require 'erb'

module GitHelpers
  class << self
    def current_branch
      %x[git rev-parse --abbrev-ref HEAD].strip
    end

    def issue_number(branch)
      branch.scan(/\d+/).first
    end

    def comment_commits(recent_commits)
      recent_commits.split("\n")
                    .map { |s| "# #{s}" }
                    .join("\n") + "\n"
    end
  end
end


