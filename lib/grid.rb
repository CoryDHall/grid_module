# Module for common 2D array operations

module Grid
  def each(&prc)
    grid.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        prc.call(cell, [row_idx, col_idx])
      end
    end
  end

  def map(&prc)
    output = Array.new(grid.count) { Array.new(grid.first.count) }
    each do |cell, pos|
      output[pos[0]][pos[1]] = prc.call(cell, pos)
    end
    output
  end

  def select(&prc)
    output = []
    each do |cell, pos|
      output << cell if prc.call(cell, pos)
    end
    output
  end

  def index_where(&prc)
    output = []
    each do |cell, pos|
      output << pos if prc.call(cell, pos)
    end
    output
  end

  def all?(&prc)
    each do |cell, pos|
      return false unless prc.call(cell, pos)
    end
    true
  end

  def none?(&prc)
    each do |cell, pos|
      return false if prc.call(cell, pos)
    end
    true
  end

  def any?(&prc)
    output = false
    each do |cell, pos|
      output = output || prc.call(cell, pos)
    end
    output
  end

  def dup_grid
    grid.dup.map(&:dup)
  end

  def inject(accum = nil, &prc)
    cells = select {|_| true}
    accum = cells.shift if accum.nil?
    cells.inject(accum, &prc)
  end

  def [](row, col)
    raise BoundaryError.new_OOB([row, col]) unless in_bounds?(row, col)
    grid[row][col]
  end

  def []=(row, col, value)
    raise BoundaryError.new_OOB([row, col]) unless in_bounds?(row, col)
    grid[row][col] = value
  end

  def new_grid(num_rows, num_colums = nil, def_cell = nil)
    num_columns ||= num_rows
    @grid = Array.new(num_rows) { Array.new(num_columns) { def_cell } }
  end

  def in_bounds?(row, col)
    row.abs < grid.length && col.abs < grid.length
  end

  class BoundaryError < RangeError
    def self.new_OOB(pos)
      BoundaryError.new("[#{pos[0]}, #{pos[1]}] is not inside the grid")
    end
  end

  private

    attr_reader :grid

end
