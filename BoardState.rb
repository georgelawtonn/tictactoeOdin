class BoardState
  attr_reader :board_state

  def initialize
    @board_state = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def update_board(number, symbol)
    @board_state.each do |line_state|
      line_state.map! do |state|
        if state == number.to_i
          symbol
        else
          state
        end
      end
    end

  end

  def confirm_validity(player_input)
    @board_state.any? do |line_state|
      line_state.include?(player_input.to_i)
    end
  end

  def evaluation
    scan_rows || scan_columns || scan_diagonals
  end

  def retrieve_available
    available = []
    @board_state.each do |line_state|
      line_state.each do |symbol|
        if symbol != "O" && symbol != "X"
          available << symbol
        end
      end
    end
    available
  end

  private
  def scan_rows
    @board_state.each do |row|
      if row.all?("X") || row.all?("O")
        return true
      end
    end
    return false
  end

  def scan_columns
    (0..2).each do |i|
      if simple_check(@board_state[0][i], @board_state[1][i], @board_state[2][i])
        return true
      end
    end
    return false
  end

  def scan_diagonals
    simple_check(@board_state[0][0], @board_state[1][1], @board_state[2][2]) ||
      simple_check(@board_state[1][1], @board_state[0][2], @board_state[2][0])
  end

  def simple_check(symbol_one, symbol_two, symbol_three)
    (symbol_one == "O" && symbol_two == "O" && symbol_three == "O") ||
      (symbol_one == "X" && symbol_two == "X" && symbol_three == "X")
  end
end