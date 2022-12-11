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

  def find_markers
    markers = []
    datastream.chars.each_cons(4) do |char_array|
      if char_array.uniq.count == 4
        markers << char_array.join
      end
    end
    markers
  end

  def first_marker
    find_markers.first
  end

  def index_of_marker(marker)
    datastream.index(marker) + 4
  end

  def solve_part_1
    index_of_marker(first_marker)
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

Day06.new.solve
