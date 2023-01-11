require_relative 'enumerable'

class MyList
  include MyEnumerable

  def initialize(*list)
    @list = list
  end

#   def each(&block)
#     @list.each(&block)
#   end
  def each
    return to_enum(:each) unless block_given?

    count = 0
    while count < @list.length
        yield(@list[count])
        count +=1
    end
    @list
  end
end

list = MyList.new(1, 2, 3, 4)

puts(list.all? { |e| e < 5 })
puts(list.all? { |e| e > 5 })
puts(list.any? { |e| e == 5 })
puts(list.any? { |e| e == 5 })
puts(list.filter { |e| e.even? })