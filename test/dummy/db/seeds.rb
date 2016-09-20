users = [
	{email: 'admin@example.com', password: 'password', password_confirmation: 'password'}
]

users.each do |user|
  db_user = AdminUser.where(email: user[:email]).first_or_initialize(user)
  if db_user.valid?
   	if db_user.new_record?
    	db_user.save!
    else
    	db_user.update_attributes! user
    end
    puts "User #{db_user.email} updated with password: #{db_user.password}"
  end
end