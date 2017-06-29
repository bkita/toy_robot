require_relative 'src/command_parser'

# Main application class
class App

  def initialize
    @command_parser = CommandParser.new
  end

  def greeting
    puts 'Hi there! Welcome to the toy robot simulator.'
  end

  def read_commands_from_file
    begin
      file = File.new("./test_data/#{ARGV[0]}", 'r')
      while (command = file.gets)
        @command_parser.parse(command)
      end
      file.close
    rescue => err
      puts "Exception: #{err}"
      err
    end

  end
end

app = App.new
app.greeting
app.read_commands_from_file
