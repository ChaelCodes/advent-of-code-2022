class Day07
  attr_accessor :file_tree, :location, :terminal_history, :part

  COMMAND_REGEX = /^\$ (?<command>(cd|ls))\s?(?<directory>(\w+|\.\.|\/))?/
  LS_OUTPUT_REGEX = /^(?<dir>dir)?(?<size>\d+)? (?<name>\w+\.?\w*)/
  TOTAL_DEVICE_STORAGE = 70_000_000
  UPDATE_SPACE_REQUIRED = 30_000_000

  def initialize(part: 1, terminal_history: nil)
    self.terminal_history = terminal_history || inputs
    self.part = part
    root = Directory.new name: '/', directories: [], files: [], size: 0
    self.file_tree = root
    self.location = root
  end

  Directory = Struct.new(:name, :directories, :files, :parent, :size, keyword_init: true) do
    def child_directory(name)
      if directories.none? { _1.name == name }
        new_dir = Directory.new name: name, directories: [], files: [], parent: self, size: 0
        directories << new_dir
      end
    end

    def file(name, size)
      if files.none? name
        files << name
        increase_size(size)
      end
    end

    def find_directory(name)
      raise if directories.none? { _1.name == name }
      directories.find { _1.name == name }
    end

    def increase_size(size)
      self.size += size
      parent.increase_size(size) if parent
    end
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    File.readlines("./inputs/day_#{day_match[:number]}.txt", chomp: true)
  end

  def parse_history(instruction)
    parsed_command = instruction.match COMMAND_REGEX
    parsed_ls_output = instruction.match LS_OUTPUT_REGEX 
    run_command(parsed_command)
    update_from_ls_output(parsed_ls_output)
  end

  def update_from_ls_output(parsed_ls_output)
    return unless parsed_ls_output
    if parsed_ls_output[:dir]
      location.child_directory(parsed_ls_output[:name])
    elsif parsed_ls_output[:size]
      location.file(parsed_ls_output[:name], parsed_ls_output[:size].to_i)
    end
  end

  def run_command(parsed_command)
    return unless parsed_command
    if parsed_command[:command] == "cd"
      case parsed_command[:directory]
      when '/'
        self.location = file_tree
      when '..'
        self.location = location.parent
      else
        self.location = location.find_directory(parsed_command[:directory])
      end
    end
  end

  def traverse_tree(directories)
    return 0 unless directories
    dir_sizes = directories.map do |directory|
      (directory.size > 100000 ? 0 : directory.size) + traverse_tree(directory.directories)
    end.sum
  end

  def traverse_tree_for_candidates(directory, space_needed)
    return unless directory.size >= space_needed
    smallest_child = directory.directories.map do |dir|
      if dir.size >= space_needed
        traverse_tree_for_candidates(dir, space_needed)
      end
    end.compact.min_by(&:size)
    smallest_child || directory
  end


  def solve_part_1
    terminal_history.each(&method(:parse_history))
    traverse_tree(file_tree.directories)
  end

  def solve_part_2
    terminal_history.each(&method(:parse_history))
    unused_space = TOTAL_DEVICE_STORAGE - file_tree.size
    space_needed_for_update = UPDATE_SPACE_REQUIRED - unused_space
    traverse_tree_for_candidates(file_tree, space_needed_for_update).size
  end

  def solve
    if part == 1
      solve_part_1
    else
      solve_part_2
    end
  end
end
