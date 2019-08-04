Category.create([
  {name: "Phones"},
  {name: "Electronics"},
  {name: "Health"},
  {name: "Women"},
  {name: "Men"}])

User.create(email: 'admin_user@admin.com', password: "admin123", role: "admin", phone_number: "9876543210", country_code: "91")
