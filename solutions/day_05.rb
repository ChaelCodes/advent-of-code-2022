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

  def run_instruction(instruction)
    parsed_instruction = instruction.match(/move (?<crate_count>\d+) from (?<from_stack>\d+) to (?<to_stack>\d+)/)
    crate_count, from_stack, to_stack = parsed_instruction[:crate_count].to_i, parsed_instruction[:from_stack].to_i, parsed_instruction[:to_stack].to_i
    move_crates(crate_count, from_stack, to_stack)
  end

  def move_crates(crate_count, from_stack, to_stack)
    if part == 1
      crate_count.times { crates[to_stack] << crates[from_stack].pop }
    else
      crates[to_stack].concat(crates[from_stack].pop(crate_count))
    end
  end

  def run_instructions
    instructions.each(&method(:run_instruction))
  end

  def answer
    crates.values.map(&:last).join
  end

  def solve
    run_instructions
    answer
  end
end
