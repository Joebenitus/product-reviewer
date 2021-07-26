class Product
  attr_accessor :votes

  def initialize(path)
    @file = File.read(path).split("\n")
    @votes = {}
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
      reviewed_array.push(new_arr)
      @votes[new_arr[1]] ||= {:approved => 0, :denied => 0}
      if new_arr[2] == "approve"
        @votes[new_arr[1]][:approved] += 1
      elsif new_arr[2] == "reject" || new_arr[2] == "skip"
        @votes[new_arr[1]][:denied] += 1
      end
    end
    reviewed_array.each do |r|
      # @votes[r[1]] is votes object at index of the product name
      if @votes[r[1]][:approved] > @votes[r[1]][:denied] && !approved_array.include?(r[1]) && !rejected_array.include?(r[1])
        approved_array.push(r[1])
      elsif @votes[r[1]][:denied] >= @votes[r[1]][:approved] && !rejected_array.include?(r[1])
        rejected_array.push(r[1])
      end
    end
    # "APPROVED\n#{(approved_array - rejected_array).join("\n")}\n\nDENIED\n#{rejected_array.join("\n")}"
    str_approved = (approved_array - rejected_array).length > 0 ? "APPROVED\n#{(approved_array - rejected_array).sort.join("\n")}" : nil
    str_denied = rejected_array.length > 0 ? "\n\nDENIED\n#{rejected_array.sort.join("\n")}" : nil
    "#{str_approved}#{str_denied}"
  end
end
# puts File.read(input_file)