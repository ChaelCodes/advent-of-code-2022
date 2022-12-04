class Day01
  attr_accessor :records, :part

  def initialize(part: 1)
    self.records = inputs
    self.part = part
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    File.readlines("./inputs/day_#{day_match[:number]}.txt").map(&:chomp)
  end

  def solve_part_1
    records.count
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

Day01.new.solve
