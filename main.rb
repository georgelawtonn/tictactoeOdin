require_relative 'BoardView'
require_relative 'BoardState'
require_relative 'BoardCPU'
require_relative 'BoardController'

board_state = BoardState.new
board_cpu = BoardCPU.new(board_state)
board_controller = BoardController.new(board_cpu, board_state)
board_view = BoardView.new(board_controller)
board_view.start

