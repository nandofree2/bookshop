Category.create!([{ name: "Fiction" }, { name: "Science" }, { name: "History" }])

# User.create!(name: "Admin", email: "admin@mail.com", role: :admin)
# User.create!(name: "Staff", email: "staff@mail.com", role: :staff)
# User.create!(name: "Customer", email: "customer@mail.com", role: :customer)
([{name:'admin'}, {name:'staff'}, {name:'customer'}])
c1 = Category.first
Book.create!([
  { name: "The Great Book", category: c1, rating: 5, price: 19.99, flag: :best_seller },
  { name: "New Adventures", category: c1, rating: 4, price: 14.50, flag: :new }
])
