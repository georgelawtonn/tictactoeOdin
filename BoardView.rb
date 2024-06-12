require_relative 'BoardState'
require_relative 'BoardController'


class BoardView
  def initialize(board_controller)
    @board_controller = board_controller
  end

  def start
    loop do
      print_board
      print "Choose your move (Select One Of The Available Numbers On The Board): "
      @board_controller.player_move
      if @board_controller.evaluate_board_state
        print_board
        puts "Congrats You Won"
        break
      end

      @board_controller.prompt_cpu
      if @board_controller.evaluate_board_state
        print_board
        puts "You Lost"
        break
      end

      if @board_controller.no_actions
        print_board
        puts "You tied"
        break
      end
    end
  end

  private
  def print_board_line(line_state)
    puts line_state.join(" ")
  end

  def print_board
    @board_controller.get_board_state.each do |line_state|
      print_board_line(line_state)
    end
    puts "\n"
  end
end


