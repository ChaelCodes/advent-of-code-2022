class Day05
  attr_accessor :crates, :instructions, :part

  def initialize(part: 1)
    records = inputs
    self.crates = {}
    records[0...9].each.with_index do |stack, index|
      crates[index + 1] = stack.chars
    end
    self.instructions = records[(20..)]
    self.part = part
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    File.readlines("./inputs/day_#{day_match[:number]}.txt", chomp: true)
  end

  def move_crate(instruction)
    parsed_instruction = instruction.match(/move (?<crate_count>\d+) from (?<from_stack>\d+) to (?<to_stack>\d+)/)
    crate_count, from_stack, to_stack = parsed_instruction[:crate_count].to_i, parsed_instruction[:from_stack].to_i, parsed_instruction[:to_stack].to_i
    crate_count.times { crates[to_stack] << crates[from_stack].pop }
  end

  def run_instructions
    instructions.each(&method(:move_crate))
  end

  def answer
    crates.values.map(&:last).join
  end

  def solve_part_1
    run_instructions
    answer
  end

  def solve_part_2
    instructions.count
  end

  def solve
    if part == 1
      solve_part_1
    else
      solve_part_2
    end
  end
end
