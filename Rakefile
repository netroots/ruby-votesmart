%w[rubygems rake rake/clean fileutils].each { |f| require f }
require 'spec'
require 'spec/rake/spectask'
require File.dirname(__FILE__) + '/lib/ruby-votesmart'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "ruby-votesmart"
    s.summary = "A wrapper for the Project Vote Smart API"
    s.email = "dancunning@gmail.com"
    s.homepage = "http://github.com/netroots/ruby-votesmart"
    s.description = "A wrapper for the Project Vote Smart API"
    s.authors = ["Dan Cunning"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Dir['tasks/**/*.rake'].each { |t| load t }

Spec::Rake::SpecTask.new

#Cucumber::Rake::Task.new

#task :default => [:features]