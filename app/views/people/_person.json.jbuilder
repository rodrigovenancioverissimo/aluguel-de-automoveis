json.extract!(person,:id, :name, :surname, :cpf, :date_of_birth, :email, :created_at, :updated_at,
              :license, :phones)
json.url person_url(person, format: :json)
