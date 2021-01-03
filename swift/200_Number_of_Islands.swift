/*
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:

 Input:
 11110
 11010
 11000
 00000

 Output: 1
 Example 2:

 Input:
 11000
 11000
 00100
 00011

 Output: 3
 */

/*
 Time: O(MxN); number of rows and number of columns
 Space: worst case O(MxN)
 */

import Foundation

func numIslands(_ grid: [[Character]]) -> Int {
    if grid.count == 0 {
        return 0
    }
    
    var newGrid = grid
    var counter = 0
    
    for i in 0..<newGrid.count {
        for j in 0..<newGrid[0].count {
            if String(newGrid[i][j]) == "1" {
                dfs(&newGrid, i, j)
                counter += 1
            }
        }
    }
    return counter
}

func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
    if i < 0 || i >= grid.count || j < 0 || j >= grid[0].count || String(grid[i][j]) == "0" {
        return
    }
    grid[i][j] = Character("0")
    dfs(&grid, i+1, j)
    dfs(&grid, i-1, j)
    dfs(&grid, i, j-1)
    dfs(&grid, i, j+1)
}

func printGrid(_ grid: [[Character]]) {
    for i in grid {
        print(i)
    }
}

let grid = [
    Array("11110"),
    Array("11010"),
    Array("11000"),
    Array("00000")
]

print(numIslands(grid))

