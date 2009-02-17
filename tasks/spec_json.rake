
namespace :spec do
  
  def save_json_response name, response
    File.open("#{File.dirname(__FILE__)}/../spec/responses/#{name}.js", "w") do |f|
      f.write response.to_json
    end
  end
  
  def save_json clazz, method, *args
    response = args.empty? ? clazz.send(method) : clazz.send(method, *args)
    
    clazz_name = clazz.name.split("::").last
    params = [method].concat(args).join('.')
    
    save_json_response "#{clazz_name}.#{params}", response
  end
  
  task :json do
    # response = VoteSmart::State.get_state("GA")
    # save_json_response "authorization_failed", response
    
    VoteSmart.api_key = ENV['PVS_API_KEY'] if ENV['PVS_API_KEY']
    
    # save_json VoteSmart::State, :get_state_ids
    # save_json VoteSmart::State, :get_state, "GA"
    
    # save_json VoteSmart::Office, :get_types
    
    # save_json VoteSmart::Office, :get_offices_by_type, "P"
    # save_json VoteSmart::Office, :get_offices_by_type, "C"
    
    # save_json VoteSmart::Official, :get_by_district, "20451"
    
    # save_json VoteSmart::District, :get_by_office_state, "9", "GA"
    
    # save_json VoteSmart::Address, :get_office, "1721"
    
    # save_json VoteSmart::Office, :get_offices_by_type, "S"
    
    # save_json VoteSmart::Official, :get_by_office_state, "44", "GA"
    # save_json VoteSmart::Official, :get_by_office_state, "45", "GA"
    # save_json VoteSmart::Official, :get_by_office_state, "12", "GA"
    # save_json VoteSmart::Official, :get_by_office_state, "42", "GA"
    # save_json VoteSmart::Official, :get_by_office_state, "33", "GA"
    # save_json VoteSmart::Official, :get_by_office_state, "53", "GA"
    # save_json VoteSmart::Official, :get_by_office_state, "13", "GA"
    
    # save_json VoteSmart::Office, :get_offices_by_type, "L"
    # save_json VoteSmart::District, :get_by_office_state, "7", "GA"
    # save_json VoteSmart::District, :get_by_office_state, "8", "GA"
    
    # save_json VoteSmart::Official, :get_by_district, "20689"
    # save_json VoteSmart::Official, :get_by_district, "21946"
    
    # save_json VoteSmart::Official, :get_by_district, "21397"
    
    # save_json VoteSmart::Address, :get_office, "106446"
    
    save_json VoteSmart::Official, :get_by_office_state, "12", "CO"
  end
  
end