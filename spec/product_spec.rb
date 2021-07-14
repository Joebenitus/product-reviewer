require('rspec')
require('product')

describe('#product') do
  it("initializes a new product") do
    product1 = Product.new("test-input.txt")
    expect(product1.list).to(eq(["G.C., keychain - approve", "J.M., holographic t-shirt - approve"]))
  end

  # it("outputs APPROVED for a product") do
  #   product1 = Product.new()
  #   expect(Product.approved?("G.C., keychain - reject")).to(eq("APPROVED"))
  # end
end