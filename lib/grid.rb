class Grid < Array
  def initialize(board)
    @board = board
    @new_board = []
    #array of arrays
  end

  def location_check(cell_index, row_index)
    height = @board.length
    width = @board[0].length
    true if cell_index > 0 && cell_index < width && row_index > 0 && row_index < height
  end

  def alive?(arg)
    if arg == 0
      false
    else
      true
    end
  end

  def change_state(current_cell_state, live)
    if current_cell_state && live < 2
      false
    elsif current_cell_state && live >= 2 && live <=3
      true
    elsif current_cell_state && live > 3
      false
    elsif current_cell_state == false && live == 3
      true
    end
  end

  def build_new_board(current_cell_state, row_index, cell_index)
    if current_cell_state
      @new_board[row_index, cell_index] = 1
    else
      @new_board[row_index, cell_index] = 0
    end
    @new_board
  end

  def check_neighbors
    live = 0
    @board.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        current_cell_state = alive?(@board[row_index][cell_index])
        live += 1 if alive?(@board[cell_index][(row_index) +1]) && location_check(cell_index, ((row_index) +1))
        live += 1 if alive?(@board[cell_index][(row_index) -1]) && location_check(cell_index, ((row_index) -1))
        live += 1 if alive?(@board[(cell_index) +1][row_index]) && location_check(((cell_index) +1), row_index)
        live += 1 if alive?(@board[(cell_index) -1][row_index]) && location_check(((cell_index) -1), row_index)
        live += 1 if alive?(@board[(cell_index) +1][(row_index) +1]) && location_check(((cell_index) +1), ((row_index) +1))
        live += 1 if alive?(@board[(cell_index) -1][(row_index) -1]) && location_check(((cell_index) -1), ((row_index) -1))
        live += 1 if alive?(@board[(cell_index) -1][(row_index) +1]) && location_check(((cell_index) -1), ((row_index) +1))
        live += 1 if alive?(@board[(cell_index) +1][(row_index) -1]) && location_check(((cell_index) +1), ((row_index) -1))

        current_cell_state = change_state(current_cell_state, live)
        build_new_board(current_cell_state, row_index, cell_index)
      end
    end
  end

  def tick
    check_neighbors
  end
end
