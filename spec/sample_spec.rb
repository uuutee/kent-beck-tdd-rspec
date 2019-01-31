require_relative '../lib/sample'

RSpec.describe 'sample' do
  it 'should be true' do
    expect(SampleClass.true?).to eq(true)
  end
end