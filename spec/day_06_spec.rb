RSpec.describe Day06 do
  let(:solution) { described_class.new(datastream: datastream) }
  let(:datastream) { nil }

  describe "#inputs" do
    subject { solution.inputs }

    it { expect(subject.chars.first(5)).to eq %w[m n l n v] }
  end

  describe "#first_marker" do
    subject { solution.first_marker }

    context "with sample 1" do
      let(:datastream) { "mjqjpqmgbljsphdztnvjfqwrcgsmlb" }

      it { is_expected.to eq "jpqm" }
    end
  end

  describe "#index_of_marker" do
    subject { solution.index_of_marker("jpqm") }

    context "with sample 1" do
      let(:datastream) { "mjqjpqmgbljsphdztnvjfqwrcgsmlb" }

      it { is_expected.to eq 7 }
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      it { is_expected.to eq 1816 }
    end

    xcontext "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { is_expected.to eq 0 }
    end
  end
end
