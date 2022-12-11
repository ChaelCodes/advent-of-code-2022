RSpec.describe Day07 do
  let(:solution) { described_class.new(terminal_history: terminal_history) }
  let(:terminal_history) { nil }

  describe "#inputs" do
    subject { solution.inputs }

    it { expect(subject.first).to eq "$ cd /" }
    it { expect(subject.count).to eq 1135 }
  end

  describe "#parse_history" do
    subject { solution.parse_history(instruction) }

    context "move to root" do
      let(:instruction) { "$ cd /" }

      it "changes location to root" do
        subject
        expect(solution.location.name).to eq '/'
      end
    end

    context "ls is noop" do
      let(:instruction) { "$ ls" }

      it "does nothing" do
      end
    end

    context "dir a after ls" do
      let(:instruction) { "dir a" }

      it "creates a new directory under root" do
        subject
        expect(solution.file_tree.directories.map(&:name)).to include "a"
      end
    end

    context "14848514 b.txt increases size" do
      let(:instruction) {"14848514 b.txt" }

      it "add file to list" do
        subject
        expect(solution.location.files).to include "b.txt"
      end

      it "increases the size of current node" do
        subject
        expect(solution.location.size).to eq 14848514
      end

      it "increases size of root node" do
        subject
        expect(solution.file_tree.size).to eq 14848514
      end
    end
    
    context "$ cd a" do
      let(:instruction) { "$ cd a" }

      before do
        solution.parse_history("dir a")
      end

      it "changes location to a directory" do
        subject
        expect(solution.location.name).to eq "a"
      end
    end

    context "14848514 b.txt increases size" do
      let(:instruction) {"14848514 b.txt" }

      before do
        solution.parse_history("dir a")
        solution.parse_history("cd a")
      end

      it "add file to list" do
        subject
        expect(solution.location.files).to include "b.txt"
      end

      it "increases the size of current node" do
        subject
        expect(solution.location.size).to eq 14848514
      end

      it "increases size of root node" do
        subject
        expect(solution.file_tree.size).to eq 14848514
      end
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      it { is_expected.to eq 1490523 }

      context "with sample data" do
        let(:terminal_history) do
          [
            "$ cd /",
            "$ ls",
            "dir a",
            "14848514 b.txt",
            "8504156 c.dat",
            "dir d",
            "$ cd a",
            "$ ls",
            "dir e",
            "29116 f",
            "2557 g",
            "62596 h.lst",
            "$ cd e",
            "$ ls",
            "584 i",
            "$ cd ..",
            "$ cd ..",
            "$ cd d",
            "$ ls",
            "4060174 j",
            "8033020 d.log",
            "5626152 d.ext",
            "7214296 k"
          ]
        end

        it { is_expected.to eq 95437 }
      end
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2, terminal_history: terminal_history) }

      it { is_expected.to eq 12390492 }

      context "with sample data" do
        let(:terminal_history) do
          [
            "$ cd /",
            "$ ls",
            "dir a",
            "14848514 b.txt",
            "8504156 c.dat",
            "dir d",
            "$ cd a",
            "$ ls",
            "dir e",
            "29116 f",
            "2557 g",
            "62596 h.lst",
            "$ cd e",
            "$ ls",
            "584 i",
            "$ cd ..",
            "$ cd ..",
            "$ cd d",
            "$ ls",
            "4060174 j",
            "8033020 d.log",
            "5626152 d.ext",
            "7214296 k"
          ]
        end

        it { is_expected.to eq 24933642 }
      end
    end
  end
end
