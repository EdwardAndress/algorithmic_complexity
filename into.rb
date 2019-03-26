class Array
  def into(n = 3)
    groups = []
    n.times { groups << [] }
    elements = self

    counter = 0
    while !elements.empty? do
      groups[counter % n] << elements.shift
      counter += 1
    end
    groups
  end
end
