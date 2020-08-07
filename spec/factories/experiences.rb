FactoryBot.define do
  factory :experience do
    occupation { 'Programador' }
    description_occupation { 'Programa coisas' }
    company { 'UOL' }
    start_experience { '2017-07-07' }
    end_experience { '2020-12-20' }
  end
end
