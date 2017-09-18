require 'rails_helper'

describe Course do
  describe "Valid course codes" do
    before(:each) do
      @course = Course.new(description: "Bar", name: "Foo", difficulty: 1, course_type: "Tech Elective")
    end

    context "Course code has first three as letters" do
      it 'returns no error' do
        @course.course_code = "AAA1111"
        expect(@course.save).to be true
      end
    end

    context "Course code does not have first three as letters" do
      it 'returns an error' do
        @course.course_code = "A2A1111"
        expect(@course.save).to be false
      end
    end

    context "Course code has last four letters as ints" do
      it 'returns no error' do
        @course.course_code = "AAA1111"
        expect(@course.save).to be true
      end
    end

    context "Course code does not have last four letters as ints" do
      it 'returns an error' do
        @course.course_code = "AAA1B11"
        expect(@course.save).to be true
      end
    end

    context "Course code is too long" do
      it "returns an error" do
        @course.course_code = "AAA1111222"
        expect(@course.save).to be false
      end
    end

    context "Course code is not too long" do
      it "returns no error" do
        @course.course_code = "AAA1111"
        expect(@course.save).to be true
      end
    end
  end

  describe "#filter_by_code" do
    let!(:tech_course1) { Fabricate(:tech_elective) }
    let!(:tech_course2) { Fabricate(:tech_elective, course_code: "COP3502") }
    let!(:breadth_course) { Fabricate(:breadth_elective) }
    let!(:core_course) { Fabricate(:core, course_code: "EEL3701") }
    let!(:core_course2) { Fabricate(:core, course_code: "EEL3744") }

    context "course_type present" do
      it "returns an array of arrays of course" do
        courses = Course.filter_by_code("Tech Elective")
        expect(courses.count).to eq(2)
        expect(courses).to include([tech_course1])
        expect(courses).to include([tech_course2])
        expect(courses).to_not include([breadth_course])
        expect(courses).to_not include([core_course])
        expect(courses).to_not include([core_course2])
      end
    end

    context "course_type not present" do
      it "returns an array of arrays of course" do
        courses = Course.filter_by_code()
        expect(courses.count).to eq(4)
        expect(courses).to include([tech_course1])
        expect(courses).to include([tech_course2])
        expect(courses).to include([breadth_course])
        expect(courses).to include([core_course, core_course2])
      end
    end
  end

  describe "#course_code_letters" do
    let!(:tech_course1) { Fabricate(:tech_elective) }
    let!(:tech_course2) { Fabricate(:tech_elective, course_code: "COP3502") }
    let!(:breadth_course) { Fabricate(:breadth_elective) }

    context "course_type present" do
      it "returns array of 3 letter strings" do
        letters = Course.course_code_letters("Tech Elective")
        expect(letters).to include("TEC")
        expect(letters).to include("COP")
        expect(letters).to_not include("BRE")
      end
    end

    context "course_type not present" do
      it "returns array of 3 letter strings" do
        letters = Course.course_code_letters
        expect(letters).to include("TEC")
        expect(letters).to include("COP")
        expect(letters).to include("BRE")
      end
    end
  end
end
