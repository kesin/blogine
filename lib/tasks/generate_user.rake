# encoding: UTF-8
# Usage: bundle exec rake 'generate_user['name','email','password']'

desc "generate user for blogine"

task :generate_user, [:name, :email, :password] => :environment do |t, args|
  password_salt = BCrypt::Engine.generate_salt
  password_digest = BCrypt::Engine.hash_secret(args.password, password_salt)
  user = User.create({ name: args.name,
                       email: args.email,
                       password_salt: password_salt,
                       password_digest: password_digest,
                       password: args.password })
  if user.errors.any?
    puts 'Create user failed!'
    user.errors.full_messages.each{|e| puts e}
  else
    puts 'User created successfully!'
  end
end