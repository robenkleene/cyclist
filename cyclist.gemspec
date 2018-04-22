# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "cyclist"
  spec.version       = "0.7.3"
  spec.authors       = ["Roben Kleene"]
  spec.email         = ["contact@robenkleene.com"]

  spec.summary       = "Bicycle for the mind."
  spec.homepage      = "https://github.com/robenkleene/cyclist"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  base_path = File.expand_path(File.dirname(__FILE__)) + "/"
  `git submodule --quiet foreach pwd`.split($\).each do |submodule_path|
    Dir.chdir(submodule_path) do
      submodule_relative_path = submodule_path.sub base_path, ""
      `git ls-files -z`.split("\x0").each do |filename|
        spec.files << "#{submodule_relative_path}/#{filename}"
      end
    end
  end

  spec.add_runtime_dependency "jekyll", "~> 3.7"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.9"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.1"
  spec.add_development_dependency "bundler", "~> 1.16"
end
