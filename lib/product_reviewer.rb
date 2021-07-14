
def product_reviewer(file)
  arr = file.split(/,\s|\s\-\s/)
  if arr[2] == 'approve'
    return 'APPROVED'
  end
end
# puts File.read(input_file)