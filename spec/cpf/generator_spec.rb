RSpec.describe CPF do
  it "should generates valid numbers" do
    10.times { expect(CPF.valid?(CPF.generate)).to be_true }
  end

  it "should generates random numbers" do
    10.times { expect(CPF.generate).to_not eq(CPF.generate) }
  end
end