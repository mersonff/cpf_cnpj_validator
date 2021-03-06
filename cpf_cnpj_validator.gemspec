# frozen_string_literal: true

require_relative "lib/cpf_cnpj_validator/version"

Gem::Specification.new do |spec|
  spec.name          = "cpf_cnpj_validator"
  spec.version       = CpfCnpjValidator::VERSION
  spec.authors       = ["Emerson Freitas"]
  spec.email         = ["mersonsi@gmail.com"]

  spec.summary       = "CPF/CNPJ Validator"
  spec.description   = "CPF/CNPJ Validator"
  spec.homepage      = "https://github.com/mersonff/cpf_cnpj_validator"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = "https://github.com/mersonff/cpf_cnpj_validator"
  spec.metadata["source_code_uri"] = "https://github.com/mersonff/cpf_cnpj_validator"
  spec.metadata["changelog_uri"] = "https://github.com/mersonff/cpf_cnpj_validator"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
