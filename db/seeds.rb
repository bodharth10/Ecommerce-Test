Category.create([
  {name: "history"},
  {name: "fictional"},
  {name: "biography"},
  {name: "science fiction"},
  {name: "prayer book"}])

User.create(email: 'admin_user@admin.com', password: "admin123", role: "admin", phone_number: "8329584897", country_code: "91")