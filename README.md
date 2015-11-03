#     Grid
####  A module for common grid operations
***

* * *

I’ve decided to begin documenting the work I’ve been doing on a personal project: [The Grid Module](https://github.com/CoryDHall/grid_module)

* * *

After working on so many grid based games, it became apparent that I was violating **_DRY_** at the personal scale, so I decided to make a module to contain common methods and operations for objects that contain and heavily reference Two Dimensional Arrays.

## Methods:

*   `#[](row, col)` accepts input as an ordered pair _(row, col)_ and returns the object at `[row][col]`
*   `#[]=(row, col, value)` accepts an ordered pair and a value and sets the object at `[row][col]` to value
*   `#in_bounds?(row, col)` checks an ordered pair to see if the provided indices are valid coordinates in the grid
*   `#dup_grid` duplicates the grid at both levels, but not the objects within the grid
*   `#each {}` accepts a block as an argument, the block can reference each individual cell or the individual cell and its index > Note: the index used in the iterative methods is an ordered pair

*   `#map {}` matches the functionality of Array#map 2-dimensionally

*   The same goes for:

    *   `#select`
    *   `#index_where`
    *   `#all?`
    *   `#none?`
    *   `#any?`
    *   `#inject?(accum = first_elem)`

### Things to add in future versions:

*   An option to prevent mixed data types
*   Aliases to make the methods more idiomatic
*   Complete documentation
*   Perhaps a more unique name
