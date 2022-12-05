class Day02
  attr_accessor :games, :part
  
  MY_MOVE = { 
    'X' => 1, # Rock
    'Y' => 2, # Paper
    'Z' => 3  # Scissors
  }

  OUTCOME = {
    'X' => 0, # Lose
    'Y' => 3, # Draw
    'Z' => 6  # Win
  }

  # 0 loss, 3 draw, 6 win
  GAME_POINTS = {
    'A' => { # Rock
      'X' => 3,
      'Y' => 6,
      'Z' => 0
    },
    'B' => { # Paper
      'X' => 0,
      'Y' => 3,
      'Z' => 6
    },
    'C' => { # Scissors
      'X' => 6,
      'Y' => 0,
      'Z' => 3
    }
  }

  def initialize(part: 1)
    self.games = inputs
    self.part = part
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    File.readlines("./inputs/day_#{day_match[:number]}.txt").map(&:chomp)
  end

  def game_score(opponent_move, my_move)
    MY_MOVE[my_move] + GAME_POINTS[opponent_move][my_move] 
  end

  def game_score_2(opponent_move, my_move)
    move_points = MY_MOVE[GAME_POINTS[opponent_move].key(OUTCOME[my_move])]
    OUTCOME[my_move] + move_points
  end

  def solve_part_1
    games.map do |game|
      moves = game.match(/(?<opponent_move>\w) (?<my_move>\w)/)
      game_score(moves[:opponent_move], moves[:my_move])
    end.sum
  end

  def solve_part_2
    games.map do |game|
      moves = game.match(/(?<opponent_move>\w) (?<my_move>\w)/)
      game_score_2(moves[:opponent_move], moves[:my_move])
    end.sum
  end

  def solve
    if part == 1
      solve_part_1
    else
      solve_part_2
    end
  end
end

Day02.new.solve
