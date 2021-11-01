RSpec.describe CNPJ do
  it "blacklists common numbers" do
    expect(CNPJ.valid?("00000000000000")).to be_nil
    expect(CNPJ.valid?("11111111111111")).to be_nil
    expect(CNPJ.valid?("22222222222222")).to be_nil
    expect(CNPJ.valid?("33333333333333")).to be_nil
    expect(CNPJ.valid?("44444444444444")).to be_nil
    expect(CNPJ.valid?("55555555555555")).to be_nil
    expect(CNPJ.valid?("66666666666666")).to be_nil
    expect(CNPJ.valid?("77777777777777")).to be_nil
    expect(CNPJ.valid?("88888888888888")).to be_nil
    expect(CNPJ.valid?("99999999999999")).to be_nil
  end

  it "rejects blank strings" do
    expect(CNPJ.valid?("")).to be_nil
  end

  it "rejects nil values" do
    expect(CNPJ.valid?(nil)).to be_nil
  end

  it "validates formatted strings" do
    number = "54.550.752/0001-55"
    expect(CNPJ.valid?(number)).to be_true
  end

  it "validates unformatted strings" do
    number = "54550752000155"
    expect(CNPJ.valid?(number)).to be_true
  end

  it "validates messed strings" do
    number = "54550[752#0001..$55"
    expect(CNPJ.valid?(number)).to be_true
  end

  it "generates formatted number" do
    expect(CNPJ.generate(true)).to match(%r[\A\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}\z]) # passes
  end

  it "generates stripped number" do
    expect(CNPJ.generate).to match(/\A\d{14}\z/) # passes
  end

  it "rejects strings" do
    expect(CNPJ.valid?("aa.bb.ccc/dddd-ee")).to be_nil
  end

  it "rejects strings (strict)" do
    expect(CNPJ.valid?("aa.bb.ccc/dddd-ee", strict: true)).to be_nil
  end

  it "compare objects by their numeric value" do
    one = CNPJ.new("54550752000155")
    other = CNPJ.new("54550752000155")
    different = CNPJ.new("32228235377")

    expect(one).to eq(other)

    expect(one).to_not eq(different)
    expect(other).to_not eq(different)
  end
end