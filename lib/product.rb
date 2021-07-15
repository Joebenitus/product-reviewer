class Product

  def initialize(path)
    @file = File.read(path).split("\n")
  end

  def list
    @file
  end

  def review
    reviewed_array = []
    @file.each do |p|
      new_arr = p.split(/,\s|\s\-\s/)
      reviewed_array.push(new_arr[1])
    end
    "APPROVED\n#{reviewed_array.join("\n")}"
  end
end
# puts File.read(input_file)