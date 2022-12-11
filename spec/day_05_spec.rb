RSpec.describe Day05 do
  let(:solution) { described_class.new }

  describe "#initialize" do
    subject { solution }

    it "parses crates" do
      expect(solution.crates[1]).to eq %w[B S V Z G P W]
      expect(solution.crates[2]).to eq %w[J V B C Z F]
      expect(solution.crates[3]).to eq %w[V L M H N Z D C]
      expect(solution.crates[4]).to eq %w[L D M Z P F J B]
      expect(solution.crates[5]).to eq %w[V F C G J B Q H]
      expect(solution.crates[6]).to eq %w[G F Q T S L B]
      expect(solution.crates[7]).to eq %w[L G C Z V]
      expect(solution.crates[8]).to eq %w[N L G]
      expect(solution.crates[9]).to eq %w[J F H C]
    end

    it "has first instruction" do
      expect(solution.instructions.first).to eq "move 5 from 4 to 7"
    end

    it "has last instruction" do
      expect(solution.instructions.last).to eq "move 1 from 8 to 1"
    end

    it "has all instructions" do
      expect(solution.instructions.count).to eq 501
    end
  end

  describe "#move_crate" do
    subject { solution.move_crate(instruction) }
    let(:instruction) { "move 1 from 2 to 1" }

    before do
      solution.crates = {
        1 => %w[Z N],
        2 => %w[M C D],
        3 => %w[P]
      }
    end

    it "moves the crate" do
      subject
      expect(solution.crates).to eq({
        1 => %w[Z N D],
        2 => %w[M C],
        3 => %w[P]
      })
    end
  end

  describe "#answer" do
    subject { solution.answer }

    it { is_expected.to eq "WFCBHBVGC" }
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      it { is_expected.to eq "VJSFHWGFT" }
    end

    xcontext "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { is_expected.to eq 0 }
    end
  end
end
