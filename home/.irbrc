# ~/.irbrc
##########################################################
unless self.class.const_defined?("IRB_RC_HAS_LOADED")

  #system('clear')

  HISTFILE = "#{ENV['HOME']}/.irb_history"
  MAXHISTSIZE = 5000

  # regular colors
  ANSI_BLACK               = "\033[0;30m"
  ANSI_RED                 = "\033[0;31m"
  ANSI_GREEN               = "\033[0;32m"
  ANSI_BROWN               = "\033[0;33m"
  ANSI_BLUE                = "\033[0;34m"
  ANSI_PURPLE              = "\033[0;35m"
  ANSI_CYAN                = "\033[0;36m"
  ANSI_GRAY                = "\033[0;37m"
  
  # emphasized/bold colors
  ANSI_EM_GRAY             = "\033[1;30m"
  ANSI_EM_RED              = "\033[1;31m"
  ANSI_EM_GREEN            = "\033[1;32m"
  ANSI_EM_YELLOW           = "\033[1;33m"
  ANSI_EM_BLUE             = "\033[1;34m"
  ANSI_EM_PURPLE           = "\033[1;35m"
  ANSI_EM_CYAN             = "\033[1;36m"
  ANSI_EM_WHITE            = "\033[1;37m"
  
  # background colors
  ANSI_BG_BLACK            = "\033[40m"
  ANSI_BG_RED              = "\033[41m"
  ANSI_BG_GREEN            = "\033[42m"
  ANSI_BG_YELLOW           = "\033[43m"
  ANSI_BG_BLUE             = "\033[44m"
  ANSI_BG_PURPLE           = "\033[45m"
  ANSI_BG_CYAN             = "\033[46m"
  ANSI_BG_GRAY             = "\033[47m"

  ANSI_RESET               = "\033[0m"
  ANSI_BOLD                = "\033[1m"
  ANSI_UNDERSCORE          = "\033[4m"
  ANSI_BLINK               = "\033[5m"
  ANSI_REVERSE             = "\033[7m"
  ANSI_CONCEALED           = "\033[8m"

  ##########################################################

  # Enable tab-completion.
  begin
    require 'irb/completion'
  rescue LoadError
    puts ANSI_EM_RED + "Error loading 'irb/completion'." + ANSI_RESET
  end
  
  ### preserve history
  begin
    require 'irb/ext/save-history'
  rescue LoadError
    puts ANSI_EM_RED + "Error loading 'irb/ext/save-history'." + ANSI_RESET
  end
    
  # Enable rubygems
  begin
    require 'rubygems'
  rescue LoadError
    puts ANSI_EM_RED + "Error loading 'rubygems'." + ANSI_RESET
  end
  
  # pretty print
  # wondeful in the console for exploring objects that are visually large.
  begin
    require 'pp'
  rescue LoadError
    puts ANSI_EM_RED + "Error loading 'pretty print'." + ANSI_RESET
  end

  # The Map by Method is wizardly for quick-to-type array manipulations.
  begin
    require 'map_by_method' 
  rescue LoadError
    puts ANSI_EM_RED + "Error loading 'map_by_method'." + ANSI_RESET
    puts ANSI_EM_YELLOW + "  to install run 'gem install map_by_method'." + ANSI_RESET 
  end

  # Colorize results
  begin
    require 'wirble'
    # load wirble
    Wirble.init

    colors = Wirble::Colorize.colors.merge({
      :comma => :white,

      :refers => :green,

      :open_object => :light_purple,
      :close_object => :light_purple,
      :object_class => :light_green,
      :object_addr_prefix => :light_blue,
      :object_addr => :cyan,

      :open_hash => :light_blue,
      :close_hash => :light_blue,
      :open_array => :light_blue,
      :close_array => :light_blue,

      :symbol => :yellow,
      :symbol_prefix => :yellow,
  
      :open_string => :cyan,
      :string => :cyan,
      :close_string => :cyan,
    
      :number => :cyan,
      :range => :cyan,
      :class => :cyan
    })
    Wirble::Colorize.colors = colors

    Wirble.colorize  
  rescue LoadError
    puts ANSI_EM_RED + 'Error loading Wirble.' + ANSI_RESET 
    puts ANSI_EM_YELLOW + "  to install run 'gem install wirble'." + ANSI_RESET 
  end

  # Object#what? method finding.
  begin
    require 'what_methods'
  rescue LoadError
    puts ANSI_EM_RED + "Error loading 'what_methods'." + ANSI_RESET 
    puts ANSI_EM_YELLOW + "  to install run 'gem install what_methods'." + ANSI_RESET 
  end 

  ### irb session duration
  begin
    require 'duration'
    IRB_START_TIME = Time.now
    at_exit { 
      puts "\nirb session duration: #{Duration.new(Time.now - IRB_START_TIME)}" 
    }
  rescue LoadError
    puts ANSI_EM_RED + "Error loading duration." + ANSI_RESET 
    puts ANSI_EM_YELLOW + "  to install run 'gem install duration'." + ANSI_RESET 
  end

  ##########################################################

  IRB.conf[:SAVE_HISTORY] = MAXHISTSIZE
  IRB.conf[:HISTORY_FILE] = HISTFILE

  # Auto-indentation.
  IRB.conf[:AUTO_INDENT]  = true

  # enable readline.
  IRB.conf[:USE_READLINE] = true

  # Define prompt
  # :PROMPT_I normal prompt
  # :PROMPT_S prompt for continuing strings
  # :PROMPT_C prompt for continuing statement
  # :RETURN format to return value
  
  IRB.conf[:PROMPT][:COLORPROMPT] = {
    :PROMPT_I => ANSI_EM_GREEN + "%N(%m) > " + ANSI_RESET,
    :PROMPT_N => ANSI_EM_GREEN + "%N(%m) > " + ANSI_RESET, 
    :PROMPT_S => ANSI_EM_GREEN + "%N(%m) > " + ANSI_RESET, 
    :PROMPT_C => ANSI_EM_GREEN + "%N(%m) > " + ANSI_RESET, 
    :RETURN   => ANSI_EM_YELLOW + "=> %s\n" + ANSI_RESET
  }
  
  IRB.conf[:PROMPT][:SHORT] = {
    :PROMPT_C => "%03n:%i* ",
    :RETURN   => "=> %s\n",
    :PROMPT_I => "%03n:%i> ",
    :PROMPT_N => "%03n:%i ",
    :PROMPT_S => "%03n:%i%l "
  }
  
  IRB.conf[:PROMPT][:COLORSHORT] = {
    :PROMPT_C => ANSI_EM_GREEN + "%03n:%i* " + ANSI_RESET,
    :RETURN   => ANSI_EM_YELLOW + "=> %s\n" + ANSI_RESET,
    :PROMPT_I => ANSI_EM_GREEN + "%03n:%i> " + ANSI_RESET,
    :PROMPT_N => ANSI_EM_GREEN + "%03n:%i " + ANSI_RESET,
    :PROMPT_S => ANSI_EM_GREEN + "%03n:%i%l " + ANSI_RESET
  }
  
  # enable prompt.
  #IRB.conf[:PROMPT_MODE]  = :SIMPLE
  #IRB.conf[:PROMPT_MODE]  = :DEFAULT
  #IRB.conf[:PROMPT_MODE]  = :COLORPROMPT
  #IRB.conf[:PROMPT_MODE]  = :SHORT
  IRB.conf[:PROMPT_MODE]  = :COLORSHORT
  
  ##########################################################
  # Aliases
  
  alias q exit
  
  def clear 
    system('clear')
  end
  
  alias c clear
  
  ##########################################################

  IRB_RC_HAS_LOADED = true
  
  ##########################################################

  print ANSI_EM_GREEN + "Starting irb...\n\n" + ANSI_RESET 
end
