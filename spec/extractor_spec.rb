RSpec.describe NMax::Extractor do
  let(:example) { "kfjsdlkfj241lkj42 34;1\nfsd2\n2" }
  describe '#purify' do
    it { expect(described_class.purify(example)).to eq(%w[241 42 34 1 2 2]) }
    it { expect(described_class.purify('')).to eq([]) }
  end
  describe '#integers' do
    it {
      expect(described_class.integers(example))
        .to eq([241, 42, 34, 1, 2, 2])
    }
    it { expect(described_class.integers('')).to eq([]) }
  end
end
