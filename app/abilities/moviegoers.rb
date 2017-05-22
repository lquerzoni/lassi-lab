Canard::Abilities.for(:moviegoer) do

  can     [:read, :create, :update], Movie
  cannot  [:destroy], Movie
  can     [:read, :create, :destroy], Review
#  cannot  [:read], Review


end
