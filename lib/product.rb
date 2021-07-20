class Product

  def initialize(path)
    @file = File.read(path).split("\n")
  end

  def list
    @file
  end

  def review
    reviewed_array = []
    approved_array = []
    rejected_array = []
    @file.each do |p|
      new_arr = p.split(/,\s|\s\-\s/)
      if !reviewed_array.include?(new_arr[1])
        reviewed_array.push(new_arr)
      end
    end
    reviewed_array.each do |r|
      if r[2] == "approve" && !approved_array.include?(r[1]) && !rejected_array.include?(r[1])
        approved_array.push(r[1])
      elsif r[2] == "reject" && !rejected_array.include?(r[1])
        rejected_array.push(r[1])
      end
    end
    "APPROVED\n#{(approved_array - rejected_array).join("\n")}\n\nDENIED\n#{rejected_array.join("\n")}"
  end
end
# puts File.read(input_file)