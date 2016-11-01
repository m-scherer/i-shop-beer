require 'rails_helper'

describe Cart do
  before 

  it "has initial contents" do
    session_cart = {"1"=>2}
    cart = Cart.new(session_cart)
    expect(cart.contents).to eq(session_cart)
  end

  describe "add_beer" do
    it "can add beer" do
      session_cart = {"1"=>1}
      cart = Cart.new(session_cart)

    end
  end

end
