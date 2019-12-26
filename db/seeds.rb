# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

person_params = []
automobiles_params = []
leases_params = []
if ENV['faker'] == 'true'
  puts('Iniciando Faker seeds')
  sampling_number = ENV['sampling_number'].blank? ? 100 : ENV['sampling_number'].to_i
  for i in 1..sampling_number
    phones_params = []
    for j in 1..rand(1..3)
      preferential_value = j == 1 ? true : false # apenas o primeiro é true pois o sistema permite apenas um telefone preferencial
      phones_params.push({
                             ddd: Faker::PhoneNumber.area_code,
                             number: Faker::Number.number(digits: rand(8..9)),
                             phone_type: Phone.phone_types.key(rand(Phone.phone_types.size)),
                             preferential: preferential_value
                         })
    end
    person_params.push({
                           name: Faker::Name.first_name,
                           surname: "#{Faker::Name.middle_name} #{Faker::Name.last_name}",
                           cpf: Faker::IDNumber.brazilian_citizen_number,
                           date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
                           email: Faker::Internet.email,
                           phones_attributes: phones_params,
                           license_attributes:
                               {
                                   number: Faker::Number.number(digits: rand(10..11)),
                                   validity: Faker::Date.between(from: 5.years.ago, to: 5.years.from_now),
                                   modalities_attributes: [
                                       {name: Modality.names.key(rand(Modality.names.size))}
                                   ]
                               }

                       })
    automobiles_params.push({
                                model: Faker::Vehicle.model,
                                color: Automobile.colors.key(rand(Automobile.colors.size)),
                                automobile_type: Automobile.automobile_types.key(rand(Automobile.automobile_types.size)),
                                plaque: Faker::Vehicle.license_plate,
                                year: Faker::Vehicle.year,
                                daily_cost: Faker::Commerce.price(range: 50..1000, as_string: true)
                            })
  end
  for i in 1..(sampling_number / 2).to_i
    startTime = Faker::Time.between_dates(from: Date.today - 90, to: Date.today + 30, period: :day)
    endTime = (startTime + rand(1..4).day).change(hour: rand(8..17), min: rand(0..59))
    exitTime = Faker::Time.between(from: startTime, to: endTime - 1.hour, format: :default).to_time
    entryTime = Faker::Time.between(from: exitTime, to: endTime + 2.days, format: :default).to_time
    diffInDaysIsFloat = (endTime - startTime) / 60 / 60 / 24
    total_price = (diffInDaysIsFloat * automobiles_params[i][:daily_cost].to_f).truncate(2)
    leases_params.push({
                           plaque: automobiles_params[i][:plaque],
                           cpf: person_params[i][:cpf],
                           lease: {
                               total_price: total_price,
                               start_time: startTime.to_formatted_s(:db),
                               end_time: endTime.to_formatted_s(:db),
                               exit_time: exitTime.to_formatted_s(:db),
                               entry_time: entryTime.to_formatted_s(:db)
                           }
                       })
  end
else
  person_params = [
      {
          name: 'Justin',
          surname: 'Timberlake',
          cpf: '79877842068',
          date_of_birth: '2005-12-02',
          email: 'justin@email.com',
          phones_attributes: [
              {ddd: '011', number: '7987-7842', phone_type: 'comercial', preferential: true},
          ],
          license_attributes:
              {
                  number: '7195601426',
                  validity: '2023-12-02',
                  modalities_attributes: [
                      {name: 'A'},
                      {name: 'B'},
                  ]
              }
      },
      {
          name: 'Angelina',
          surname: 'Jolie',
          cpf: '17568397009',
          date_of_birth: '1977-05-31',
          email: 'angelina@email.com',
          phones_attributes: [
              {ddd: '021', number: '1756-8397', phone_type: 'particular', preferential: true},
          ],
          license_attributes:
              {
                  number: '6943716123',
                  validity: '2022-05-31',
                  modalities_attributes: [
                      {name: 'A'},
                      {name: 'C'},
                  ]
              }
      },
      {
          name: 'Beyouncé',
          surname: '',
          cpf: '25408438082',
          date_of_birth: '1986-08-07',
          email: 'beyouncé@email.com',
          phones_attributes: [
              {ddd: '045', number: '2540-8438', phone_type: 'trabalho', preferential: true},
          ],
          license_attributes:
              {
                  number: '1180791711',
                  validity: '2024-08-07',
                  modalities_attributes: [
                      {name: 'B'},
                  ]
              }
      },
      {
          name: 'Brad',
          surname: 'Pitt',
          cpf: '87839967027',
          date_of_birth: '1971-05-16',
          email: 'brad@email.com',
          phones_attributes: [
              {ddd: '036', number: '98783-9967', phone_type: 'particular', preferential: true},
          ],
          license_attributes:
              {
                  number: '4022223573',
                  validity: '2023-05-16',
                  modalities_attributes: [
                      {name: 'E'},
                  ]
              }
      },
      {
          name: 'Tom',
          surname: 'Cruise',
          cpf: '36031680033',
          date_of_birth: '1948-02-07',
          email: 'tom@email.com',
          phones_attributes: [
              {ddd: '022', number: '3603-1680', phone_type: 'comercial', preferential: true},
          ],
          license_attributes:
              {
                  number: '4792176902',
                  validity: '2023-02-07',
                  modalities_attributes: [
                      {name: 'D'},
                  ]
              }
      },
      {
          name: 'Gisele',
          surname: 'Bündchen',
          cpf: '33888115043',
          date_of_birth: '1962-02-26',
          email: 'gisele@email.com',
          phones_attributes: [
              {ddd: '032', number: '3388-8115', phone_type: 'particular', preferential: true},
          ],
          license_attributes:
              {
                  number: '1910131222',
                  validity: '2023-02-26',
                  modalities_attributes: [
                      {name: 'A'},
                      {name: 'B'},
                  ]
              }
      },
      {
          name: 'Will',
          surname: 'Smith',
          cpf: '80050339079',
          date_of_birth: '1987-01-12',
          email: 'will@email.com',
          phones_attributes: [
              {ddd: '011', number: '98005-0339', phone_type: 'trabalho', preferential: true},
          ],
          license_attributes:
              {
                  number: '6892136432',
                  validity: '2019-09-12',
                  modalities_attributes: [
                      {name: 'A'},
                  ]
              }
      },
  ]
  automobiles_params = [
      {model: 'CB 300', color: 'vermelho', automobile_type: 'moto', plaque: 'AHD-5454', year: 2019, daily_cost: '99.99'},
      {model: 'HB 20', color: 'preto', automobile_type: 'carro', plaque: 'FMR-6345', year: 2019, daily_cost: '139.99'},
      {model: 'Agrale 6500', color: 'prata', automobile_type: 'VUC', plaque: 'RGH-42-45', year: 2019, daily_cost: '199.99'},
      {model: 'Millennium III', color: 'azul', automobile_type: 'ônibus', plaque: 'BTF-5278', year: 2019, daily_cost: '279.99'},
      {model: 'Atego 2425', color: 'branco', automobile_type: 'caminhão', plaque: 'BYT-2354', year: 2019, daily_cost: '409.99'},
  ]
  leases_params = [
      {
          plaque: 'FMR6345',
          cpf: '17568397009',
          lease: {
              total_price: '199.98',
              start_time: '2019-11-07 10:30',
              end_time: '2019-11-09 10:20',
              exit_time: '2019-11-07 10:40',
              entry_time: '2019-11-09 09:20'
          }
      },
      {
          plaque: 'RGH4245',
          cpf: '87839967027',
          lease: {
              total_price: '199.98',
              start_time: '2019-11-07 08:10',
              end_time: '2019-11-09 10:20',
              exit_time: '2019-11-07 08:00',
              entry_time: '2019-11-09 10:20'
          }
      }
  ]
end

print('Criando pessoas')
Person.transaction do
  person_params.each do |item_params|
    unless Person.find_by_cpf(item_params[:cpf])
      person = Person.create!(item_params)
    end
    print('.')
  end
  puts('.')
end

print('Criando automóveis')
Automobile.transaction do
  automobiles_params.each do |automobile_params|
    if Automobile.find_by_plaque(automobile_params[:plaque].upcase.gsub(/[^0-9A-Z]/, '')).blank?
      Automobile.create!(automobile_params)
      print('.')
    else
      print(',')
    end
  end
  puts('.')
end

print('Criando alocações')
Lease.transaction do
  leases_params.each do |lease_params|
    person = Person.find_by_cpf(lease_params[:cpf].gsub(/[^0-9]/, ''))
    automobile = Automobile.find_by_plaque(lease_params[:plaque].upcase.gsub(/[^0-9A-Z]/, ''))
    Lease.create!(lease_params[:lease].merge({person_id: person.id, automobile_id: automobile.id}))
    print('.')
  end
  puts('.')
end

puts('Criando configurações')
Setting.create!(name: 'delay tolerance in minutes', value: '30')

puts('Operação concluída')