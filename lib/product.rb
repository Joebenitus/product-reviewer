class Product

  def initialize(path)
    @file = File.read(path).split("\n")
  end

  def list
    @file
  end

  # def approved?(file)
  #   arr = file.split(/,\s|\s\-\s/)
  #   if arr[2] == 'approve'
  #     return true
  #   end
  #   false
  # end
end
# puts File.read(input_file)