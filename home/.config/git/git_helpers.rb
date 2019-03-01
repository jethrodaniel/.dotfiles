require 'erb'

module GitHelpers
  class << self
    def current_branch
      %x[git rev-parse --abbrev-ref HEAD].strip
    end

    def recent_commits(number: 5)
      %x[git log -#{number} --oneline --decorate]
    end

    def issue_number(branch)
      branch.scan(/\d+/).first
    end

    def comment_commits(commits: recent_commits)
      commits.split("\n")
             .map { |s| "# #{s}" }
             .join("\n") + "\n"
    end
  end
end


