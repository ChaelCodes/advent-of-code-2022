class Day03
  attr_accessor :rucksacks, :part

  ALPHABET = [*'a'..'z', *'A'..'Z']

  def initialize(part: 1)
    self.rucksacks = inputs
    self.part = part
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    File.readlines("./inputs/day_#{day_match[:number]}.txt").map(&:chomp)
  end

  def reorganized_item_priority(rucksack)
    compartment_1 = rucksack[0...rucksack.length/2].chars
    compartment_2 = rucksack[rucksack.length/2..].chars
    ALPHABET.index((compartment_1 & compartment_2).first) + 1
  end

  def badge_priority(rucksacks)
    ALPHABET.index(rucksacks.map(&:chars).reduce(:&).first) + 1
  end

  def solve_part_1
    rucksacks.map(&method(:reorganized_item_priority)).sum
  end

  def solve_part_2
    rucksacks.each_slice(3).sum(&method(:badge_priority))
  end

  def solve
    if part == 1
      solve_part_1
    else
      solve_part_2
    end
  end
end

Day03.new.solve
