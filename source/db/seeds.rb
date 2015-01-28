
User.create! name: "Admin", email: "admin@example.com", password: "secret123", password_confirmation: "secret123", admin: true if User.find_by(email: "admin@example.com").nil?

