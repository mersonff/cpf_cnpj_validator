RSpec.describe CNPJ::Formatter do
  it "should format strings without separators" do
    number = "12345678901234"
    expect("12.345.678/9012-34").to eq(CNPJ::Formatter.format(number))
  end

  it "should remove any non-numeric characters" do
    number = "\n12$345[678/9012-34"
    expect("12345678901234").to eq(CNPJ::Formatter.strip(number))
  end
end