class JoobleItem
	attr_accessor :count, :jobTitle, :company, :description, :salary

	def initialize(count: nil, jobTitle: nil, company: nil, description: nil, salary: nil)
		@salary = salary
		@count = count
		@jobTitle = jobTitle
		@company = company
		@description = description
	end
end