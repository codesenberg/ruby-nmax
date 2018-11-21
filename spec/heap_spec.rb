require 'nmax/heap'

RSpec.describe NMax::MinHeap do
    let(:vals) { (1..1000) }
    let(:example) do
        heap = described_class.new()

        vals.each do |val|
            heap.push(val)
        end
        
        heap
    end

    describe "#push" do
        it "should add elements" do
            heap = described_class.new()

            vals.each do |val|
                heap.push(val)
            end

            expect(heap.size).to eq(vals.size)
            expect(heap.min).to eq(vals.min)
        end
    end

    describe "#extract_min" do
        it "should remove elements" do
            expect(example.extract_min).to eq(vals.min)
            expect(example.size).to eq(vals.size-1)
            expect(example.extract_min).to eq(vals.min+1)
            expect(example.size).to eq(vals.size-2)
        end
    end
end