# frozen_string_literal: true

# ~/.pryrc
#
# Pry debugger/console configuration.
#
# https://github.com/pry/pry
# https://github.com/deivid-rodriguez/pry-byebug

# Save history locally
Pry.config.history.file = '.pry_history'

if defined? PryByebug
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'q', 'quit-program'
end

# https://phansch.net/2017/02/12/a-better-pry-prompt-for-rails-console/
if defined?(Rails) && !Rails.root.nil?
  def formatted_env
    case Rails.env
    when 'production'
      bold_upcased_env = Pry::Helpers::Text.bold Rails.env.upcase
      Pry::Helpers::Text.red bold_upcased_env
    when 'staging'
      Pry::Helpers::Text.yellow Rails.env
    when 'development'
      Pry::Helpers::Text.green Rails.env
    else
      Rails.env
    end
  end

  def app_name
    File.basename Rails.root
  end

  Pry.config.prompt = proc do |obj, nest_level, _|
    "[#{app_name}][#{formatted_env}] #{obj}:#{nest_level}> "
  end
end
