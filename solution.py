import sys


def longest_run(sequence):
    best = 0
    current = 0
    for cell in sequence:
        if cell == '#':
            current += 1
            best = max(best, current)
        else:
            current = 0
    return best


def solve():
    input = sys.stdin.readline
    test_cases = int(input())
    answers = []

    for _ in range(test_cases):
        rows, columns = map(int, input().split())
        grid = [input().strip() for _ in range(rows)]
        answer = 0

        for row in grid:
            answer = max(answer, longest_run(row))

        for column in range(columns):
            current = 0
            for row in range(rows):
                if grid[row][column] == '#':
                    current += 1
                    answer = max(answer, current)
                else:
                    current = 0

        answers.append(str(answer))

    sys.stdout.write("\n".join(answers))


if __name__ == "__main__":
    solve()
