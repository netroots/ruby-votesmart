%w[rubygems rake rake/clean fileutils].each { |f| require f }

require 'jeweler'
Jeweler::Tasks.new do |s|
  s.name = "votesmart"
  s.summary = "A wrapper for the Project Vote Smart API"
  s.email = "ben.woosley@gmail.com"
  s.homepage = "http://github.com/Empact/votesmart"
  s.description = "A wrapper for the Project Vote Smart API"
  s.authors = ["Dan Cunning", "Ben Woosley"]
  s.add_dependency 'patron', '>=0.4.6'
  s.add_development_dependency 'rspec', '<2.0.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'jeweler'
  s.add_development_dependency 'ym4r' # optional runtime dependency, required for tests
end
Jeweler::GemcutterTasks.new

Dir['tasks/**/*.rake'].each { |t| load t }

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "votesmart #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
