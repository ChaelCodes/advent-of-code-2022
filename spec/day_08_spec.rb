RSpec.describe Day08 do
  let(:solution) { described_class.new }

  describe "#inputs" do
    subject { solution.inputs }

    it { expect(subject.first).to eq %w[1 2 0 1 2 1 0 1 0 2 2 0 0 1 1 2 1 0 2 1 3 3 4 1 2 2 1 4 0 0 4 1 0 0 3 2 0 2 4 2 0 0 3 0 5 4 5 5 1 2 3 3 3 2 2 2 4 0 0 4 3 4 4 2 3 2 0 3 2 4 1 0 4 0 1 4 3 1 1 0 2 2 3 0 3 1 3 2 2 1 0 3 2 2 2 0 2 0 1] }
    it { expect(subject.last).to eq %w[1 0 2 1 0 1 0 1 0 0 3 1 3 1 2 3 2 0 3 0 1 1 3 3 1 3 3 4 2 0 1 2 4 4 2 5 3 5 2 5 5 1 4 4 1 5 5 3 5 5 2 4 1 1 3 3 1 3 1 4 1 2 2 5 1 5 4 2 3 4 2 0 1 0 0 0 2 0 3 1 2 0 4 1 2 3 0 1 2 3 1 0 2 2 2 0 2 1 2] }
    it { expect(subject.first.count).to eq 99 }
    it { expect(subject.count).to eq 99 }
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      it { is_expected.to eq 1816 }

      context "with sample inputs" do
        before do
          solution.trees = %w[30373
                              25512
                              65332
                              33549
                              35390].map(&:chars)
          solution.visibility_map = solution.trees.map(&:dup)
        end

        it { is_expected.to eq 21 }
      end
    end

    xcontext "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { is_expected.to eq 0 }
    end
  end
end
