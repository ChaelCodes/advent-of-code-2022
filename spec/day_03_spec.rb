RSpec.describe Day03 do
  let(:solution) { described_class.new }

  describe "#inputs" do
    subject { solution.inputs }

    it { expect(subject.first).to eq "QtGHnGlcwQGvHwMHGnnGfRFCJnRBfVVJRVBfCFBh" }
    it { expect(subject.count).to eq 300 }
  end

  describe '#reorganized_item_priority' do
    subject { solution.reorganized_item_priority(rucksack) }

    context 'with rucksack A' do
      let(:rucksack) { "vJrwpWtwJgWrhcsFMMfFFhFp" }

      it { is_expected.to eq 16 }
    end

    context 'with rucksack B' do
      let(:rucksack) { "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL" }

      it { is_expected.to eq 38 }
    end

    context 'with rucksack C' do
      let(:rucksack) { "PmmdzqPrVvPwwTWBwg" }

      it { is_expected.to eq 42 }
    end

    context 'with rucksack D' do
      let(:rucksack) { "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn" }

      it { is_expected.to eq 22 }
    end

    context 'with rucksack E' do
      let(:rucksack) { "ttgJtRGJQctTZtZT" }

      it { is_expected.to eq 20 }
    end

    context 'with rucksack F' do
      let(:rucksack) { "CrZsJsPPZsGzwwsLwLmpwMDw" }

      it { is_expected.to eq 19 }
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      it { is_expected.to eq 8349 }
    end

    xcontext "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { is_expected.to eq 0 }
    end
  end
end
