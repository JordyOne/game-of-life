class Grid < Array
  def initialize(array)
    @array = array
    @width = array.first.length
    @height = array.length
    @new_array = Array.new(@array.length) { Array.new(@array.first.length) }
    @live = 0
  end

  def tick
    @array.each_with_index do |row, index|
      p index
      row.each_with_index do |cell, cell_index|
        cell_value = cell
        if cell_value
          look_around_alive(index, cell_index)
        end

      end
    end


  end

  def edges?(index, cell_index)
    if index <= @height && index >= 0 && cell_index <= @width && cell_index >= 0
      true
    end
  end

  def look_around_alive(row_index, cell_index)
    live = 0
    live += 1 if @array[cell_index][row_index + 1] == 1
    live += 1 if @array[cell_index][row_index - 1] == 1
    live += 1 if @array[cell_index + 1][row_index] == 1
    live += 1 if @array[cell_index - 1][row_index] == 1
    live += 1 if @array[cell_index + 1][row_index + 1] == 1
    live += 1 if @array[cell_index - 1][row_index - 1] == 1
    live += 1 if @array[cell_index - 1][row_index + 1] == 1
    live += 1 if @array[cell_index + 1][row_index - 1] == 1
    @live = live
  end
# it's returning the correct value for arrays and each with index, so now I need to manipulate the data correctly
end



