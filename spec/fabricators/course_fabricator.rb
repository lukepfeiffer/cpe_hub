Fabricator(:course) do
  name "Foo"
  description "Bar"
  difficulty 1
  course_type "Tech Elective"
  course_code "FOO1111"
end

Fabricator(:tech_elective, from: :course) do
  name "Tech"
  description "Elective"
  course_type "Tech Elective"
  course_code "TEC1111"
end

Fabricator(:breadth_elective, from: :course) do
  name "Tech"
  description "breadth"
  difficulty 1
  course_type "Breadth Elective"
  course_code "BRE1111"
end

Fabricator(:core, from: :course) do
  name "Core"
  description "core"
  difficulty 1
  course_type "Core"
  course_code "COR1111"
end
