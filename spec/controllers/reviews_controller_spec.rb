require 'rails_helper'

describe ReviewsController do
	describe ".like" do
		context "given a new review" do
			it "increases likes to 1" do
				review = create(:review)
				get :like, params: {movie_id: 1, id: review.id}
				expect(review.reload.likes).to eq (1)
			end
		end
	end
end