require('rspec')
require('product_reviewer')

describe('#product_reviewer') do
  it("outputs APPROVED for a product") do
    expect(product_reviewer("G.C., keychain - approve")).to(eq("APPROVED"))
  end
end