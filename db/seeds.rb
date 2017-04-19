# Our standard test password & array of users (we'll need this to bypass devise's confirm step in a bit).
test_users = []
pw = "wsxedc"
item_count = 25

# Create my usual test admin account
admin_acct = User.create!(name: "Alex Gould", email: "alexgould17@gmail.com", password: pw)
test_users << admin_acct

# The rest of the seeding we do unless we're in production
unless Rails.env.production?
	# Create 5 test users
	5.times do
		test_users << User.create!(
			name: Faker::Name.unique.name,
			email: Faker::Internet.unique.safe_email,
			password: pw
		)
	end
	
	# Create 25 items randomly assigned to a user in our test_users bunch
	item_count.times do
		Item.create!(
			name: Faker::Beer.unique.name,
			user: test_users.sample
		)
	end
end

# Bypass devise's confirm step
test_users.each { |u| u.update_attribute(:confirmed_at, 1.second.ago) }

# Log our results
puts "Seeded the database with #{test_users.count} users & #{item_count} items."