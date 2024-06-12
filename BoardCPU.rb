class BoardCPU
  def initialize(board_state)
    @board_state = board_state
  end

  def take_turn
    available = @board_state.retrieve_available
    number = available[rand(available.size)]
    @board_state.update_board(number, "O")
  end
end