RSpec.describe NMax::Accumulator do
  let(:example) { [34, 42, 1, 2, 241, 2] }

  it { expect(described_class.new(2, example).result).to eq([241, 42]) }
  it { expect(described_class.new(2).result).to eq([]) }
  it { expect(described_class.new(2).add(example).result).to eq([241, 42]) }
  it {
    expect(described_class.new(3, example).add(example).result)
      .to eq([241, 241, 42])
  }
  it {
    expect(described_class.new(4, example).add(example).add(example).result)
      .to eq([241, 241, 241, 42])
  }
end
