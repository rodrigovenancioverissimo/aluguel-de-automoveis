# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

person_params = [
    {
        name: 'Justin',
        surname: 'Timberlake',
        cpf: '79877842068',
        date_of_birth: '2005-12-02',
        email: 'justin@email.com',
        phones_attributes: [
            { ddd: '011', number: '7987-7842', phone_type: 'comercial', preferential: true },
        ],
        licenses_attributes: [
            {
                number: '7195601426',
                validity: '2023-12-02',
                modalities_attributes: [
                    { name: 'A' },
                    { name: 'B'},
                ]
            }
        ]
    },
    {
        name: 'Angelina',
        surname: 'Jolie',
        cpf: '17568397009',
        date_of_birth: '1977-05-31',
        email: 'angelina@email.com',
        phones_attributes: [
            { ddd: '021', number: '1756-8397', phone_type: 'particular', preferential: true },
        ],
        licenses_attributes: [
            {
                number: '6943716123',
                validity: '2022-05-31',
                modalities_attributes: [
                    { name: 'A' },
                    { name: 'C'},
                ]
            }
        ]
    },
    {
        name: 'Beyouncé',
        surname: '',
        cpf: '25408438082',
        date_of_birth: '1986-08-07',
        email: 'beyouncé@email.com',
        phones_attributes: [
            { ddd: '045', number: '2540-8438', phone_type: 'trabalho', preferential: true },
        ],
        licenses_attributes: [
            {
                number: '1180791711',
                validity: '2024-08-07',
                modalities_attributes: [
                    { name: 'B'},
                ]
            }
        ]
    },
    {
        name: 'Brad',
        surname: 'Pitt',
        cpf: '87839967027',
        date_of_birth: '1971-05-16',
        email: 'brad@email.com',
        phones_attributes: [
            { ddd: '036', number: '98783-9967', phone_type: 'particular', preferential: true },
        ],
        licenses_attributes: [
            {
                number: '4022223573',
                validity: '2023-05-16',
                modalities_attributes: [
                    { name: 'E' },
                ]
            }
        ]
    },
    {
        name: 'Tom',
        surname: 'Cruise',
        cpf: '36031680033',
        date_of_birth: '1948-02-07',
        email: 'tom@email.com',
        phones_attributes: [
            { ddd: '022', number: '3603-1680', phone_type: 'comercial', preferential: true },
        ],
        licenses_attributes: [
            {
                number: '4792176902',
                validity: '2023-02-07',
                modalities_attributes: [
                    { name: 'D' },
                ]
            }
        ]
    },
    {
        name: 'Gisele',
        surname: 'Bündchen',
        cpf: '33888115043',
        date_of_birth: '1962-02-26',
        email: 'gisele@email.com',
        phones_attributes: [
            { ddd: '032', number: '3388-8115', phone_type: 'particular', preferential: true },
        ],
        licenses_attributes: [
            {
                number: '1910131222',
                validity: '2023-02-26',
                modalities_attributes: [
                    { name: 'A' },
                    { name: 'B'},
                ]
            }
        ]
    },
    {
        name: 'Will',
        surname: 'Smith',
        cpf: '80050339079',
        date_of_birth: '1987-01-12',
        email: 'will@email.com',
        phones_attributes: [
            { ddd: '011', number: '98005-0339', phone_type: 'trabalho', preferential: true },
        ],
        licenses_attributes: [
            {
                number: '6892136432',
                validity: '2019-09-12',
                modalities_attributes: [
                    { name: 'A' },
                ]
            }
        ]
    },
]

print('Criando pessoas')
Person.transaction do
  person_params.each do |item_params|
    unless Person.find_by_cpf(item_params[:cpf])
      person = Person.create!(item_params.except(:phones_attributes, :licenses_attributes))
      item_params[:phones_attributes].each do |phone_params|
        Phone.create!(phone_params.merge(person_id: person.id))
      end
      item_params[:licenses_attributes].each do |license_params|
        license = License.create!(license_params.except(:modalities_attributes).merge(person_id: person.id))
        license_params[:modalities_attributes].each do |modality_params|
          Modality.create!(modality_params.merge(license_id: license.id))
        end
      end
    end
    print('.')
  end
end
puts('.')

automobiles_params = [
    { model: 'CB 300', color: 'vermelho', automobile_type: 'moto', plaque: 'AHD-5454', year: 2019, daily_cost: '99.99'},
    { model: 'HB 20', color: 'preto', automobile_type: 'carro', plaque: 'FMR-6345', year: 2019, daily_cost: '139.99'},
    { model: 'Agrale 6500', color: 'prata', automobile_type: 'VUC', plaque: 'RGH-42-45', year: 2019, daily_cost: '199.99'},
    { model: 'Millennium III', color: 'azul', automobile_type: 'ônibus', plaque: 'BTF-5278', year: 2019, daily_cost: '279.99'},
    { model: 'Atego 2425', color: 'branco', automobile_type: 'caminhão', plaque: 'BYT-2354', year: 2019, daily_cost: '409.99'},
]

print('Criando automóveis')
Automobile.transaction do
  automobiles_params.each do |automobile_params|
    Automobile.create!(automobile_params)
    print('.')
  end
  puts('.')
end

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
print('Criando alocações')
Lease.transaction do
  leases_params.each do |lease_params|
    person = Person.find_by_cpf(lease_params[:cpf])
    automobile = Automobile.find_by_plaque(lease_params[:plaque])
    Lease.create!(lease_params[:lease].merge({person_id: person.id, automobile_id: automobile.id}))
    print('.')
  end
  puts('.')
end
puts('Operação concluída')

{total_price: '199.98', start_time: '2019-11-07 10:30', end_time: '2019-11-09 10:20', exit_time: '2019-11-07 10:40', entry_time: '2019-11-09 09:20'}