RSpec.describe CNPJ do
  it "should generates valid numbers" do
    10.times { expect(CNPJ.valid?(CNPJ.generate)).to be_true }
  end

  it "should generates random numbers" do
    10.times { expect(CNPJ.generate).to_not eq(CNPJ.generate) }
  end
end