class Day04
  attr_accessor :assignment_pairs, :part

  def initialize(part: 1)
    self.assignment_pairs = inputs
    self.part = part
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    File.readlines("./inputs/day_#{day_match[:number]}.txt").map(&:chomp)
  end

  def overlapping_assignments(assignment_pair)
    assignments = assignment_pair.match /(?<start_1>\d+)-(?<end_1>\d+),(?<start_2>\d+)-(?<end_2>\d+)/
    assignment_1 = (assignments[:start_1].to_i..assignments[:end_1].to_i)
    assignment_2 = (assignments[:start_2].to_i..assignments[:end_2].to_i)
    assignment_1.cover?(assignment_2) || assignment_2.cover?(assignment_1)
  end

  def solve_part_1
    assignment_pairs.count(&method(:overlapping_assignments))
  end

  def solve_part_2
    records.count
  end

  def solve
    if part == 1
      solve_part_1
    else
      solve_part_2
    end
  end
end

Day04.new.solve
