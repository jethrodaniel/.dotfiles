extend Rails::ConsoleMethods if Object.const_defined?(:Rails)

if RUBY_VERSION.gsub(/[^\d]/, '').to_i < 270
  begin
    require 'pry'
  rescue LoadError => e
  end

  if Object.const_defined?(:Pry)
    Pry.start
    exit
  else
    require 'irb/ext/save-history'
    require 'irb/completion'
    IRB.conf[:SAVE_HISTORY] = 1_000
    IRB.conf[:HISTORY_FILE] = '~/.config/irb_history'
    IRB.conf[:USE_READLINE] = true
  end
end
