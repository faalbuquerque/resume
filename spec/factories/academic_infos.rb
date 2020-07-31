FactoryBot.define do
  factory :academic_info do
    name_academic { 'Desenvolvedor de Softwares' }
    description_academic { 'Curso para gerenciar programas' }
    institution_academic { 'Fatec' }
    conclusion_academic { 2012 }
    start_date { '2020-01-02' }
    end_date { '2020-06-30' }
  end
end
