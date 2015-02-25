# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iam_ftp/version'

Gem::Specification.new do |spec|
  spec.name          = "iam_ftp"
  spec.version       = IamFtp::VERSION
  spec.authors       = ["anthony de silva"]
  spec.email         = ["anthony   @   iamfree.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{A Ruby FTP client}
  spec.description   = %q{I think i can upload files to an FTP server, list all files and download files from FTP server}
  spec.homepage      = "https://github.com/iamfree-com/iam_ftp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
