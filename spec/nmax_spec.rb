RSpec.describe Nmax do
  it "has a version number" do
    expect(Nmax::VERSION).not_to be nil
  end

  describe Nmax::Extractor do
    let(:example) { "kfjsdlkfj241lkj42 34;1\nfsd2\n2" }
    describe '#purify' do
      it { expect(described_class.purify(example)).to eq(%w(241 42 34 1 2 2)) }
      it { expect(described_class.purify('')).to eq([]) }
    end
    describe '#integers' do
      it { expect(described_class.integers(example)).to eq([241, 42, 34, 1, 2, 2]) }
      it { expect(described_class.integers('')).to eq([]) }
    end
  end

  describe Nmax::Accumulator do
    let(:example) { [34, 42, 1, 2, 241, 2] }

    it { expect(described_class.new(2, example).result).to eq([241, 42]) }
    it { expect(described_class.new(2).result).to eq([]) }
    it { expect(described_class.new(2).add(example).result).to eq([241, 42]) }
    it { expect(described_class.new(3, example).add(example).result).to eq([241, 241, 42]) }
    it { expect(described_class.new(4, example).add(example).add(example).result).to eq([241, 241, 241, 42]) }
  end
end
