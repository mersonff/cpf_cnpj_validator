class CPF
  require "cpf_cnpj_validator"
  require "cpf/formatter"
  require "cpf/verifier_digit"

  attr_reader :number, :strict

  REGEX = /\A\d{3}\.\d{3}\.\d{3}-\d{2}\Z/.freeze
  VALIDATION_SIZE_REGEX = /^[0-9]{11}$/.freeze
  NUMBER_SIZE = 9

  BLACKLIST = %w[
    00000000000
    11111111111
    22222222222
    33333333333
    44444444444
    55555555555
    66666666666
    77777777777
    88888888888
    99999999999
    12345678909
    01234567890
  ].freeze

  def self.valid?(number, strict: false)
    new(number, strict).valid?
  end

  def self.generate(formatted = false)
    number = CpfCnpjValidator::Generator.generate(NUMBER_SIZE, VerifierDigit)
    cpf = new(number)
    formatted ? cpf.formatted : cpf.stripped
  end

  def initialize(number, strict = false)
    @number = number.to_s
    @strict = strict
  end

  def number=(number)
    @stripped = nil
    @formatted = nil
    @numbers = nil
    @number = number
  end

  def stripped
    @stripped ||= Formatter.strip(number, strict)
  end

  def formatted
    @formatted ||= Formatter.format(number)
  end

  def valid?
    return unless stripped =~ VALIDATION_SIZE_REGEX
    return if BLACKLIST.include?(stripped)

    digits = numbers[0...9]
    digits << VerifierDigit.generate(digits)
    digits << VerifierDigit.generate(digits)

    digits[-2, 2] == numbers[-2, 2]
  end

  def ==(other)
    super || other.instance_of?(self.class) && other.stripped == stripped
  end
  alias eql? ==

  private def numbers
    @numbers ||= stripped.each_char.to_a.map(&:to_i)
  end
end