require('rspec')
require('product')

describe('#product') do
  it("initializes a new product") do
    product1 = Product.new("test-input.txt")
    expect(product1.list).to(eq(["G.C., keychain - approve", "J.M., holographic t-shirt - approve"]))
  end

  it("outputs APPROVED for all products") do
    product_list = Product.new("test-input.txt")
    expect(product_list.review).to(eq("APPROVED\nkeychain\nholographic t-shirt"))
  end
end