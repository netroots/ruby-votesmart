# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-votesmart}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Cunning"]
  s.date = %q{2009-02-16}
  s.description = %q{A wrapper for the Project Vote Smart API}
  s.email = %q{dancunning@gmail.com}
  s.files = ["History.txt", "README.rdoc", "VERSION.yml", "lib/mcll4r", "lib/mcll4r/mcll4r.rb", "lib/mcll4r/mcll4r_test.rb", "lib/mcll4r/MIT-LICENSE", "lib/mcll4r/README", "lib/project_vote_smart", "lib/project_vote_smart/address.rb", "lib/project_vote_smart/candidate.rb", "lib/project_vote_smart/candidate_bio.rb", "lib/project_vote_smart/candidate_office.rb", "lib/project_vote_smart/committee.rb", "lib/project_vote_smart/common.rb", "lib/project_vote_smart/district.rb", "lib/project_vote_smart/election.rb", "lib/project_vote_smart/leadership.rb", "lib/project_vote_smart/local.rb", "lib/project_vote_smart/measure.rb", "lib/project_vote_smart/notes.rb", "lib/project_vote_smart/npat.rb", "lib/project_vote_smart/office.rb", "lib/project_vote_smart/official.rb", "lib/project_vote_smart/phone.rb", "lib/project_vote_smart/rating.rb", "lib/project_vote_smart/state.rb", "lib/project_vote_smart/vote.rb", "lib/project_vote_smart.rb", "spec/project_vote_smart", "spec/project_vote_smart/district_spec.rb", "spec/project_vote_smart/office_spec.rb", "spec/project_vote_smart/official_spec.rb", "spec/project_vote_smart/state_spec.rb", "spec/responses", "spec/responses/Address.get_office.1721.js", "spec/responses/authorization_failed.js", "spec/responses/District.get_by_office_state.7.GA.js", "spec/responses/District.get_by_office_state.8.GA.js", "spec/responses/District.get_by_office_state.9.GA.js", "spec/responses/Office.get_offices_by_type.C.js", "spec/responses/Office.get_offices_by_type.L.js", "spec/responses/Office.get_offices_by_type.P.js", "spec/responses/Office.get_offices_by_type.S.js", "spec/responses/Office.get_types.js", "spec/responses/Official.get_by_district.20451.js", "spec/responses/Official.get_by_district.20689.js", "spec/responses/Official.get_by_district.21946.js", "spec/responses/Official.get_by_office_state.12.GA.js", "spec/responses/Official.get_by_office_state.13.GA.js", "spec/responses/Official.get_by_office_state.33.GA.js", "spec/responses/Official.get_by_office_state.42.GA.js", "spec/responses/Official.get_by_office_state.44.GA.js", "spec/responses/Official.get_by_office_state.45.GA.js", "spec/responses/Official.get_by_office_state.53.GA.js", "spec/responses/State.get_state.GA.js", "spec/responses/State.get_state_ids.js", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/netroots/ruby-votesmart}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A wrapper for the Project Vote Smart API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
