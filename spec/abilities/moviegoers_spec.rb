require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, '#moviegoers' do
  let(:acting_moviegoer) { User.create(roles: %w(moviegoer)) }
  subject(:moviegoer_ability) { Ability.new(acting_moviegoer) }

  describe 'on Movie' do
    let(:movie) { Movie.create }

    it { is_expected.to be_able_to(:read, movie) }
    it { is_expected.to be_able_to(:create, movie) }
    it { is_expected.to be_able_to(:update, movie) }
    it { is_expected.to_not be_able_to(:destroy, movie) }
  end
  # on Movie
  describe 'on Review' do
    let(:review) { Review.create }

    it { is_expected.to be_able_to(:read, review) }
    it { is_expected.to be_able_to(:create, review) }
    it { is_expected.to be_able_to(:destroy, review) }
  end
  # on Review
end
