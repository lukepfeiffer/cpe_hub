require 'rails_helper'

describe Discussion do
  describe "#vote_count" do
    let!(:user1) { Fabricate(:user) }
    let!(:user2) { Fabricate(:user, email: "email@example2", username: "BLEG") }
    let!(:discussion) { Fabricate(:discussion) }
    let!(:not_right_discussion) { Fabricate(:discussion) }
    let!(:vote1) { Fabricate(:vote, user_id: user1.id, discussion_id: discussion.id) }
    let!(:vote2) { Fabricate(:vote, user_id: user2.id, discussion_id: discussion.id) }
    let!(:vote3) { Fabricate(:vote, user_id: user2.id, discussion_id: not_right_discussion.id) }

    it "returns # of votes" do
      expect(discussion.vote_count).to eq(2)
    end
  end
end
