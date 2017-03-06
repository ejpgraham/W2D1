require 'byebug'
class Employee
  attr_reader :name, :title, :salary, :boss, :subordinates


  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    @subordinates = []
    @boss.add_subordinate(self) if @boss
  end



  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :subordinates, :boss
  def initialize(name, title, salary, boss)
      super(name, title, salary, boss)
      @subordinates = []
  end

  def add_subordinate(employee)
    @subordinates << employee
  end

  def bonus(multiplier)
    # debugger
    salary = 0
    subordinates.each do |subordinate|
      salary += subordinate.salary
      # debugger
      if subordinate.subordinates
        subordinate.subordinates.each { |sub_subordinate| salary += sub_subordinate.salary }
      end
    end
    salary * multiplier
  end
end
ned = Manager.new("Ned", "Founder",1_000_000, nil)
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
david = Employee.new("David", "TA", 10_000, darren)
shawna = Employee.new("Shawna", "TA", 12_000, darren)

puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
