require('rspec')
require('product')

describe('#product') do
  it("initializes a new product") do
    product1 = Product.new("test-input1.txt")
    expect(product1.list).to(eq(["G.C., keychain - approve", "J.M., holographic t-shirt - approve"]))
  end

  it("outputs APPROVED for all products") do
    product_list = Product.new("test-input1.txt")
    expect(product_list.review).to(eq("APPROVED\nkeychain\nholographic t-shirt"))
  end

  it("removes duplicates") do
    product_list = Product.new("test-input2.txt")
    expect(product_list.review).to(eq("APPROVED\nkeychain\nholographic t-shirt"))
  end

  it("outputs DENIED if a product has one rejection") do
    product_list = Product.new("test-input3.txt")
    expect(product_list.review).to(eq("APPROVED\nkeychain\nholographic t-shirt\n\nDENIED\nmug"))
  end

  it("only outputs DENIED if there are no approved products") do
    product_list = Product.new("test-input4.txt")
    expect(product_list.review).to(eq("\n\nDENIED\nkeychain\nholographic t-shirt\nmug"))
  end

  it("initializes") do
    product_list = Product.new("test-input4.txt")
    expect(product_list.review).to(eq("\n\nDENIED\nkeychain\nholographic t-shirt\nmug"))
  end
end