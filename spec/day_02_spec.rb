RSpec.describe Day02 do
  let(:solution) { described_class.new }

  describe "#inputs" do
    subject { solution.inputs }

    it { expect(subject.first).to eq "B Z" }
    it { expect(subject.count).to eq 2500 }
  end

  describe "#game_score" do
    subject { solution.game_score(opponent_move, my_move) }

    context "with opponent A and my Y" do
      let(:opponent_move) { 'A' }
      let(:my_move) { 'Y' }

      it { is_expected.to eq 8 }
    end

    context "with opponent B and my X" do
      let(:opponent_move) { 'B' }
      let(:my_move) { 'X' }

      it { is_expected.to eq 1 }
    end

    context "with opponent C and my Z" do
      let(:opponent_move) { 'C' }
      let(:my_move) { 'Z' }

      it { is_expected.to eq 6 }
    end

    context "with opponent B and my Z" do
      let(:opponent_move) { 'B' }
      let(:my_move) { 'Z' }

      it { is_expected.to eq 9 }
    end
  end

  describe "#game_score_2" do
    subject { solution.game_score_2(opponent_move, my_move) }

    context "with opponent A and my Y" do
      let(:opponent_move) { 'A' }
      let(:my_move) { 'Y' }

      it { is_expected.to eq 4 }
    end

    context "with opponent B and my X" do
      let(:opponent_move) { 'B' }
      let(:my_move) { 'X' }

      it { is_expected.to eq 1 }
    end

    context "with opponent C and my Z" do
      let(:opponent_move) { 'C' }
      let(:my_move) { 'Z' }

      it { is_expected.to eq 7 }
    end

    context "with opponent B and my Z" do
      let(:opponent_move) { 'B' }
      let(:my_move) { 'Z' }

      it { is_expected.to eq 9 }
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      it { is_expected.to eq 11449 }
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { is_expected.to eq 13187 }
    end
  end
end
