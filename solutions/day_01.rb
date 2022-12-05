class Day01
  attr_accessor :elves_calories, :part

  def initialize(part: 1)
    self.elves_calories = inputs
    self.part = part
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    input = File.readlines("./inputs/day_#{day_match[:number]}.txt").map(&:chomp).chunk_while {|i, j| j != "" }
    elves_calories = input.map do |elf_snacks|
      elf_snacks.map(&:to_i).sum
    end
    elves_calories
  end

  def solve_part_1
    elves_calories.max
  end

  def solve_part_2
    elves_calories.max(3).sum
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
