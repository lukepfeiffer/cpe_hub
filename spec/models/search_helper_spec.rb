require 'rails_helper'

describe SearchHelper do
  let!(:discussion1) { Fabricate(:discussion, question: "How do") }
  let!(:discussion2) { Fabricate(:discussion, question: "How do") }
  let!(:discussion3) { Fabricate(:discussion, question: "Why not") }

  context "#search" do
    it "returns valid discussions" do
      discussions = described_class.search(Discussion, "How", "question")
      expect(discussions).to include(discussion1)
      expect(discussions).to include(discussion2)
      expect(discussions).to_not include(discussion3)
    end
  end

end
