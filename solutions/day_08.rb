class Day08
  attr_accessor :trees, :part, :visibility_map

  def initialize(part: 1)
    self.trees = inputs
    self.visibility_map = Array.new(99) { Array.new(99, '') }
    self.part = part
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    File.readlines("./inputs/day_#{day_match[:number]}.txt", chomp: true).map(&:chars)
  end

  def parse_tree(tree)
   tree.match(/(?<visible>[vi]?)(?<height>\d)/)
  end

  def tree_visibility
    # West
    trees.each.with_index do |tree_stand, stand_index|
      tallest_tree = -1
      tree_stand.each.with_index do |tree, tree_index|
        if tree.to_i > tallest_tree
          visibility_map[stand_index][tree_index] = 'v'
          tallest_tree = tree.to_i
        end
      end
    end

    # East
    trees.each.with_index do |tree_stand, stand_index|
      tallest_tree = -1
      tree_stand.reverse.each.with_index do |tree, tree_index|
        if tree.to_i > tallest_tree
          visibility_map[stand_index][-tree_index - 1] = 'v'
          tallest_tree = tree.to_i
        end
      end
    end

    (0...trees.first.length).each do |tree_index|
      vertical = trees.map { _1[tree_index] }
      # South
      tallest_tree = -1
      vertical.each.with_index do |tree, stand_index|
        if tree.to_i > tallest_tree
          visibility_map[stand_index][tree_index] = 'v'
          tallest_tree = tree.to_i
        end
      end
      # North
      tallest_tree = -1
      vertical.reverse.each.with_index do |tree, stand_index|
        if tree.to_i > tallest_tree
          visibility_map[-stand_index - 1][tree_index] = 'v'
          tallest_tree = tree.to_i
        end
      end
    end
  end

  def solve_part_1
    tree_visibility
    visibility_map.sum { |row| row.count('v')}
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
