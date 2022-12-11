class Day06
  attr_accessor :datastream, :part

  def initialize(part: 1, datastream: nil)
    self.datastream = datastream || inputs
    self.part = part
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    File.readlines("./inputs/day_#{day_match[:number]}.txt", chomp: true)[0]
  end

  def find_markers(length)
    markers = []
    datastream.chars.each_cons(length) do |char_array|
      if char_array.uniq.count == length
        markers << char_array.join
      end
    end
    markers
  end

  def first_marker(length)
    find_markers(length).first
  end

  def index_of_marker(marker)
    datastream.index(marker)
  end

  def solve_part_1
    index_of_marker(first_marker(4)) + 4
  end

  def solve_part_2
    index_of_marker(first_marker(14)) + 14
  end

  def solve
    if part == 1
      solve_part_1
    else
      solve_part_2
    end
  end
end

Day06.new.solve
