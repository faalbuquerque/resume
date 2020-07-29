FactoryBot.define do
  factory :personal_info do
    name { 'Fabiane Albuquerque' }
    address { 'Rua teste, 01' }
    fone { '11 9 9999-9999' }
    email { 'fa@test.com' }
    links { 'http://teste.com' }
    goals { 'Estudar' }
  end
end
