require_relative '../git_helpers'

RSpec.describe GitHelpers do
  let(:issue_branch) { '123-some-issue' }
  let(:master_branch) { 'master' }

  let(:recent_commits) do
    <<~LIST
      ea75bc1 (HEAD -> 123-why, origin/master, origin/HEAD, master) update .vim
      26fe749 better git setting names
      3e46ecf update README
      11cea58 .vim update
      83e70fa add recent commits to commit messages
    LIST
  end

  describe '#issue_number' do
    let(:issue_branch_num) { GitHelpers.issue_number issue_branch }
    let(:master_branch_num) { GitHelpers.issue_number master_branch }

    it 'parses the issue number from the branch name' do
      expect(issue_branch_num).to eq '123'
    end

    it "returns nil if the branch isn't an issue branch" do
      expect(master_branch_num).to be nil
    end
  end

  describe '#recent_messages' do
    let(:commented_commits) do
      GitHelpers.comment_commits commits: recent_commits
    end

    let(:expected) do
      <<~LIST
        # ea75bc1 (HEAD -> 123-why, origin/master, origin/HEAD, master) update .vim
        # 26fe749 better git setting names
        # 3e46ecf update README
        # 11cea58 .vim update
        # 83e70fa add recent commits to commit messages
      LIST
    end

    it 'formats recent commits into comments in the template' do
      expect(commented_commits).to eq expected
    end
  end
end
