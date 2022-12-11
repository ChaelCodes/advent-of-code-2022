RSpec.describe Day06 do
  let(:solution) { described_class.new(datastream: datastream) }
  let(:datastream) { nil }

  describe "#inputs" do
    subject { solution.inputs }

    it { expect(subject.chars.first(5)).to eq %w[m n l n v] }
  end

  describe "#first_marker" do
    subject { solution.first_marker(length) }

    context "with sample 1" do
      let(:datastream) { "mjqjpqmgbljsphdztnvjfqwrcgsmlb" }
      let(:length) { 4 }

      it { is_expected.to eq "jpqm" }
    end
  end

  describe "#index_of_marker" do
    subject { solution.index_of_marker("jpqm") }

    context "with sample 1" do
      let(:datastream) { "mjqjpqmgbljsphdztnvjfqwrcgsmlb" }

      it { is_expected.to eq 3 }
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      it { is_expected.to eq 1816 }
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { is_expected.to eq 2625 }

      context "with sample data" do
        let(:solution) { described_class.new(part: 2, datastream: "mjqjpqmgbljsphdztnvjfqwrcgsmlb") }

        it { is_expected.to eq 19 }
      end
    end
  end
end
