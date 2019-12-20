json.extract! lease, :id, :person_id, :automobile_id, :start_time, :end_time, :entry_time, :exit_time, :created_at, :updated_at
json.url lease_url(lease, format: :json)
