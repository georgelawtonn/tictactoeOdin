require_relative 'BoardView'
require_relative 'BoardState'
require_relative 'BoardCPU'


class BoardController
  def initialize(board_cpu, board_state)
    @board_state = board_state
    @board_cpu = board_cpu
  end

  def player_move
    loop do
      player_input = gets
      if input_verification(player_input)
        @board_state.update_board(player_input, "X")
        break
      end
      puts "Pick a valid number"
    end
  end

  def get_board_state
    @board_state.board_state
  end

  def prompt_cpu
    @board_cpu.take_turn
  end

  def evaluate_board_state
    @board_state.evaluation
  end

  def no_actions
    @board_state.retrieve_available.size == 0
  end

  private
  def input_verification(player_input)
    @board_state.confirm_validity(player_input) && player_input.match(/^[1-9]$/)
  end
end

