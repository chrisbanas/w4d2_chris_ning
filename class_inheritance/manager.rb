require_relative "employee"

class Manager < Employee

    def initialize(*employees)
        employees.each{|employee| @emplyees << employee if employee.boss == name }
        @employees = [  ]

    end

    def bonus(multiplier)
        total_salary = 0
        @employees.each{|employee| total_salary += employee.salary}
        total_bonus = total_salary * multiplier
    end 

end