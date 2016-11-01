require 'rails_helper'

describe Cart do

  it "has initial contents" do
    session_cart = {"1"=>2}
    cart = Cart.new(session_cart)
    expect(cart.contents).to eq(session_cart)
  end

end
