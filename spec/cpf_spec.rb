RSpec.describe CPF do
  it "blacklists common numbers" do
    expect(CPF.valid?("01234567890")).to be_nil
    expect(CPF.valid?("11111111111")).to be_nil
    expect(CPF.valid?("22222222222")).to be_nil
    expect(CPF.valid?("33333333333")).to be_nil
    expect(CPF.valid?("44444444444")).to be_nil
    expect(CPF.valid?("55555555555")).to be_nil
    expect(CPF.valid?("66666666666")).to be_nil
    expect(CPF.valid?("77777777777")).to be_nil
    expect(CPF.valid?("88888888888")).to be_nil
    expect(CPF.valid?("99999999999")).to be_nil
    expect(CPF.valid?("12345678909")).to be_nil
  end

  it "rejects blank strings" do
    expect(CPF.valid?("")).to be_nil
  end

  it "rejects strings" do
    expect(CPF.valid?("aaa.bbb.ccc-dd")).to be_nil
  end

  it "rejects nil values" do
    expect(CPF.valid?(nil)).to be_nil
  end

  it "validates formatted strings" do
    number = "295.379.955-93"
    expect(CPF.valid?(number)).to be_true
  end

  it "validates unformatted strings" do
    number = "29537995593"
    expect(CPF.valid?(number)).to be_true
  end

  it "validates messed strings" do
    number = "295$379\n955...93"
    expect(CPF.valid?(number)).to be_true
  end

  it "strictly validates strings" do
    expect(CPF.valid?("295.379.955-93", strict: true)).to be_true
    expect(CPF.valid?("29537995593", strict: true)).to be_true
  end

  it "rejects strings (strict)" do
    expect(CPF.valid?("aaa.bbb.ccc-dd", strict: true)).to be_nil
  end

  it "returns stripped number" do
    cpf = CPF.new("295.379.955-93")
    expect("29537995593").to eq cpf.stripped
  end

  it "formats number" do
    cpf = CPF.new("29537995593")
    expect("295.379.955-93").to eq cpf.formatted
  end

  it "generates formatted number" do
    expect(CPF.generate(true)).to match(/\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/)
  end

  it "generates stripped number" do
    expect(CPF.generate).to match(/\A\d{11}\z/)
  end

  it "invalidates memoization cache" do
    cpf = CPF.new("29537995593")
    cpf.number = "52139989171"

    expect("52139989171").to eq cpf.stripped
    expect("521.399.891-71").to eq cpf.formatted
  end

  it "compare objects by their numeric value" do
    one = CPF.new("29537995593")
    other = CPF.new("29537995593")
    different = CPF.new("76556868310")

    expect(one).to eq other

    expect(one).to_not eq different
    expect(other).to_not eq different
  end
end