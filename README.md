# advent-of-code-2022
My Advent of Code solutions for 2022! [Advent of Code](https://adventofcode.com/) is a series of 25 puzzles, one released each day leading up to Christmas! I attempt to complete Advent of Code every year, but rarely do. This is a casual completion run, not necessarily for maximum points.

# Leaderboard

Our 2022 leaderboard for Advent of Code is `219042-9f06f774`. Enter the code on the [leaderboard page](https://adventofcode.com/2022/leaderboard/private) to join.

# Solutions
Each solution goes in a separate branch/PR, so you can review that day.


# Previous Years

You can find previous years here:
- [2021](https://github.com/ChaelCodes/Advent-of-Code-2021)
- [2020](https://github.com/ChaelCodes/Advent-of-Code-2020)
- [2019](https://github.com/ChaelCodes/Advent-of-Code-2019)

# Setup
First, set your ruby version.
```
rbenv install
```
Next, run the installation script.
```
rake install
```
Run the test cases to confirm results.
```
rake spec
```
# Creating a new Solution
Run `rake new_day[1]` in order to create a new set of solution, input, and spec files.

## Debugging
Put `binding.irb` anywhere to pry into the method while running the spec. `exit!` will exit the debugging session.

# Advent of Code
Santa's reindeer typically eat regular reindeer food, but they need a lot of [magical energy](https://adventofcode.com/2018/day/25) to deliver presents on Christmas. For that, their favorite snack is a special type of **star** fruit that only grows deep in the jungle. The Elves have brought you on their annual expedition to the grove where the fruit grows.

To supply enough magical energy, the expedition needs to retrieve a minimum of **fifty stars** by December 25th. Although the Elves assure you that the grove has plenty of fruit, you decide to grab any fruit you see along the way, just in case.

Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants **one star**. Good luck!
