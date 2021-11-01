RSpec.describe CPF::Formatter do
  it "should format string without separators" do
    number = "12345678901"
    expect("123.456.789-01").to eq(CPF::Formatter.format(number))
  end

  it "should remove any non-numeric characters" do
    number = "\n12$345[678/901-"
    expect("12345678901").to eq(CPF::Formatter.strip(number))
  end
end