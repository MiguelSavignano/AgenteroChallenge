Person.create({ name: "John",     age: 29, oss_projects: 3 })
Person.create({ name: "Linda",    age: 29, oss_projects: 5 })
Person.create({ name: "Robert",   age: 24, oss_projects: 1 })
Person.create({ name: "Amanda",   age: 21, oss_projects: 8 })
Person.create({ name: "Lawrence", age: 32, oss_projects: 2 })
Person.create({ name: "Steven",   age: 24, oss_projects: 4 })
100.times{ FactoryGirl.create(:person) }
User.create({ email: "user@test.com", password: "12345678" })