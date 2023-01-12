module MyEnumerable
  def all?
    each { |e| return false unless yield(e) }
    true
  end

  def any?
    each { |e| return true if yield(e) }
    false
  end

  def filter
    my_array = []
    each { |e| my_array.push(e) if yield(e) }
    my_array
  end
end
