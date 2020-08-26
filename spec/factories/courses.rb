FactoryBot.define do
  factory :course do
    name_course { 'Desenvolvimento de Software' }
    description_course { 'Desenvolver sites e sistemas' }
    institution_course { 'Caelum' }
    time_course { '100' }
    conclusion_course { 'Concluido' }
    start_course { '2020-01-02' }
    end_course { '2020-08-03' }
  end
end
