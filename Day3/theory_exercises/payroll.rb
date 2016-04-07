#Employee
class Employee
	attr_reader :name, :email
	def initialize(name, email)
		@name = name
		@email = email
	end
end

module Hourly_paid

	def calculate_hourly_salary
		@hourly_rate*@hours_worked
	end

end
class HourlyEmployee < Employee
	include Hourly_paid
	def initialize(name, email, hourly_rate, hours_worked)
		super(name,email)
		@hourly_rate = hourly_rate
    	@hours_worked = hours_worked
	end
	def calculate_salary
		calculate_hourly_salary
	end
end
class SalariedEmployee < Employee
	def initialize(name, email, year_salary)
		super(name,email)
		@year_salary = year_salary
	end
	def calculate_salary
		@year_salary/52
	end
end
class MultiPaymentEmployee < Employee
	include Hourly_paid
	def initialize(name, email, year_salary, hourly_rate, hours_worked)
		super(name,email)
		@year_salary = year_salary
		@hourly_rate = hourly_rate
        @hours_worked = hours_worked
	end
	def calculate_salary
		total_salary = @year_salary
		if(@hours_worked>40)
			total_salary += calculate_hourly_salary
		end
		total_salary
	end
end
class Payroll
	def initialize(employees)
		@employees = employees
	end

	def notify_employees(employees)
		employees.each do |employee|
			puts """
		Dear #{employee.name}.
		Your salary #{employee.calculate_salary} has been paid.
		Please check your email to see the payroll at #{employee.email}.
		Remember to deduce the Tax Rate of 18%"""
		end
	end

	def pay_employees
		total_salary_week = 0
		@employees.each do |employee|
			puts "#{employee.name} has been paid #{employee.calculate_salary - (employee.calculate_salary*0.18)}"
			total_salary_week += employee.calculate_salary
		end
		puts "The total amount per week is #{total_salary_week}"
	end
end


josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
ricardo = HourlyEmployee.new('Ricardo', 'ricardo@ironhack.com', 15, 50)
cillas = HourlyEmployee.new('Cillas', 'cillas@ironhack.com', 15, 50)

employees = [josh, nizar, ted, ricardo, cillas]

payroll = Payroll.new(employees)

payroll.pay_employees

payroll.notify_employees(employees)