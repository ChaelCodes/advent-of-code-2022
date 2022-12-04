RSpec.describe Day04 do
  let(:solution) { described_class.new }

  describe "#inputs" do
    subject { solution.inputs }

    it { expect(subject.first).to eq "37-87,36-87" }
    it { expect(subject.count).to eq 1000 }
  end

  describe "#overlapping_assignments" do
    subject { solution.overlapping_assignments(assignment_pair) }

    context "with assignment pair 2-4,6-8" do
      let(:assignment_pair) { "2-4,6-8" }

      it { is_expected.to be_falsey }
    end

    context "with assignment pair 2-8,3-7" do
      let(:assignment_pair) { "2-8,3-7" }

      it { is_expected.to be_truthy }
    end

    context "with assignment pair 6-6,4-6" do
      let(:assignment_pair) { "6-6,4-6" }

      it { is_expected.to be_truthy }
    end

    context "with assignment pair 2-11,10-11" do
      let(:assignment_pair) { "2-11,10-11" }

      it { is_expected.to be_truthy }
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      it { is_expected.to eq 651 }
    end

    xcontext "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { is_expected.to eq 0 }
    end
  end
end
