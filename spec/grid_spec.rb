require_relative "../lib/grid.rb"

class GridTest
  include Grid
end

RSpec.describe GridTest do
  context "#[]"

  context "#[]="

  context "#=="

  context "#==="

  context "#all?"

  context "#any?"

  context "#dup_grid"

  context "#each"

  context "#in_bounds?"

  context "#index_where"

  context "#inject"

  context "#map"

  context "#new_grid" do
    grid_test = GridTest.new
    it "creates a 'grid' instance variable" do
      grid_test.new_grid(1)
      expect(grid_test).to respond_to(:grid)
      expect(grid_test.grid).to be_an_instance_of(Array)
    end
    it "accepts a size argument" do
      grid_test.new_grid(2)
      expect(grid_test.grid.length).to be(2)
      expect(grid_test.grid.last.length).to be(2)
    end
    it "accepts dimensions as arguments" do
      grid_test.new_grid(3, 4)
      expect(grid_test.grid.length).to be(3)
      expect(grid_test.grid.last.length).to be(4)
    end
    it "accepts a default value" do
      grid_test.new_grid(5, 5, true)
      expect(grid_test.grid.first.first).to be(true)
      expect(grid_test.grid.last.last).to be(true)
    end
  end

  context "#none?"

  context "#select"

  context "#size"

  context "#slice" do
    grid_test = GridTest.new
    grid_test.new_grid(5, 5, true)
    it "accepts one coordinate" do
      slice = grid_test.slice([3,2])
      expect(slice.length).to be(2)
      expect(slice.first.length).to be(3)
    end
    it "accepts two coordinates" do
      slice = grid_test.slice([1,1],[3,2])
      expect(slice.length).to be(3)
      expect(slice.first.length).to be(2)
    end
    it "returns a subset of the grid" do
      slice = grid_test.slice([1,1],[3,2])
      check = Array.new(3) { Array.new(2) { true } }
      expect(slice).to match(check)
    end
  end

end
