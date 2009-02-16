Gem::Specification.new do |s|
  s.name = "project_vote_smart"
  s.version = "0.1.0"
  s.date = "2009-02-10"
  s.summary = "Library for accessing the Project Vote Smart API."
  s.email = "dancunning@gmail.com"
  s.homepage = "http://github.com/netroots/project_vote_smart"
  s.authors = ["Dan Cunning"]
  s.files = ['project-vote-smart.gemspec', 'lib/project_vote_smart.rb']
  s.add_dependency("json", [">= 1.1.3"])
  s.add_dependency("ym4r", [">= 0.6.1"])
  s.has_rdoc = true
end