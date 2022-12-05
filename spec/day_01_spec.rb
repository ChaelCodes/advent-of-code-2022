RSpec.describe Day01 do
  let(:solution) { described_class.new }

  describe "#inputs" do
    subject { solution.inputs }

    it { expect(subject.first).to eq 45972 }
    it { expect(subject.count).to eq 247 }
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      it { is_expected.to eq 67027 }
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { is_expected.to eq 197291 }
    end
  end
end
