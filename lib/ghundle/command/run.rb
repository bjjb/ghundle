require 'ghundle/command'
require 'ghundle/app_error'

module Ghundle
  module Command
    # Runs the given hook, providing it with the rest of the positional
    # arguments on the command-line.
    #
    class Run < Common
      def call
        name      = args.first
        hook_path = config.hook_path(name)
        hook      = Hook.new(Source::Local.new(hook_path))

        say "Running hook #{hook.name}"
        hook.run(*args[1 .. -1])
      end
    end
  end
end