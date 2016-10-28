# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
	{
		name: 'CNE Update'
	},
	{
		name: 'Education Events'
	},
	{
		name: 'Emergency Notifications'
	},
	{
		name: 'Employee Health and Wellness'
	},
	{
		name: 'Employee Recognition'
	},
	{
		name: 'Feedback Wanted'
	},
	{
		name: 'New Staff Announcements'
	},
	{
		name: 'Patient Safety Alerts'
	},
	{
		name: 'Pharmacy Products'
	},
	{
		name: 'Policy Update'
	},
	{
		name: 'Practice Update'
	},
	{
		name: 'Product Updates'
	},
	{
		name: 'Shared Governance'
	},
	{
		name: 'Technology/Informatics'
	}
]

Category.create(categories)