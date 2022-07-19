
class Game
#can put option here so that it runs every time game class is called

  # attr_reader :welcome, :choice
  def initialize()
    # @welcome = "Welcome to BATTLESHIP"
    # @choice = "Enter p to play. Enter q to quit." 
  end


  def messages
    welcome = "Welcome to BATTLESHIP \n"
    choice = "Enter p to play. Enter q to quit."
    puts welcome + choice 
    return welcome + choice 
  end



end

# puts @messages