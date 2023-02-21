require_relative "employee"

class Manager < Employee

    def initialize(name, title, salary, boss=nil, employees=[])
        super(name, title, salary, boss=nil)
        @employees = employees
    end

    def bonus(multiplier)
        total_salary = 0
        @employees.each{|employee| total_salary += employee.salary}
        total_bonus = total_salary * multiplier
    end

end


if $PROGRAM_NAME == __FILE__


   e1 = Employee.new("Shawna", "TA", 12000, "Darren")
   e2 = Employee.new("David", "TA", 10000, "Darren")
   m = Manager.new("Darren", "TA Manager", 78000, "Ned", [e1, e2])
   f = Manager.new("Ned", "Founder", 1000000, boss=nil, [m, e1, e2])

   p f.bonus(5)
   p e1.bonus(3)
   p e2.bonus(3)
   p m.bonus(4)

end
