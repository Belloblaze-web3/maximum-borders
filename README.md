# Maximum Borders

## Problem

Given a grid containing black cells (`#`) and white cells (`.`), find the maximum number of consecutive black cells appearing in any row or column. This value is called the maximum border of the shapes formed by the black cells.

## Algorithm

The solution scans each row and computes its longest consecutive run of `#` characters. It then scans each column and computes the longest consecutive vertical run of black cells. The answer is the largest run found in either direction.

A connected-component search is unnecessary because the definition of a border depends only on consecutive cells in a single row or column. Every possible horizontal or vertical border is covered directly by the two scans.

## Correctness

For every row, the running counter increases while black cells continue and resets when a white cell appears. Therefore, the maximum recorded for that row is its longest horizontal black run. The same logic is applied independently to every column, producing the longest vertical black run. Taking the maximum of all row and column results gives exactly the required maximum border.

## Complexity

For an `R × C` grid, each cell is examined a constant number of times.

| Measure | Complexity |
|---|---:|
| Time | `O(R × C)` |
| Space | `O(R × C)` |

The space usage includes storing the grid.

## Input and Output

The first line contains the number of test cases. Each test case contains `R` and `C`, followed by `R` grid rows. For each test case, print one integer.

## Implementation

The solution is implemented in Python 3 in [`solution.py`](solution.py).

## Example

For a row containing `..####...`, the longest horizontal run is `4`. The program also checks vertical runs and outputs the greatest value among all directions.
