require_relative '../git_helpers'

RSpec.describe GitHelpers do
  let(:issue_branch) { '123-some-issue' }
  let(:master_branch) { 'master' }

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
end
