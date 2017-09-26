require 'rails_helper'

describe Professor do
  describe "#full_name" do
    let(:professor) { Fabricate(:professor, first_name: "Foo", last_name: "Bar", title: "Mr.") }
    it "returns the full name of professor" do
      full_name = professor.full_name
      expect(full_name).to eq("Mr. Bar, Foo")
    end
  end
end
