
# initialize

```sh
bundle install
rake db:create db:seed
rails server
```
* js-client example
```sh
cd client
npm install
npm start
```
open http://127.0.0.1:8080

# SingIn
POST /user_token
{"auth": {"email": "user@test.com", "password": "12345678"}}

response:
{"jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"}

* example in js
```javascript
const sigIn = async (email = "user@test.com", password = "12345678") => {
  var response = await fetch('http://localhost:3000/user_token', {
    method: "post",
    body: JSON.stringify({"auth": { email, password }}),
    headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    },
  })
  var json = await response.json()
  return json.jwt
}
```

# Avanced filters with url params
## Or query
```ruby
query = { "$or": [{ name: "John" }, { name: "Amanda" }] }
```
## And query
```ruby
query = { age: 29, oss_projects: 3 }
```
## And/Or query
```ruby
query = { age: 24, "$or" => [{ name: "Robert" }]}
```

# GET people
GET /people
* params
q: json for avanced filters
order: json for order people, default {name: "asc"}

* example
```javascript
var complex_query = { q: { age: 24, "$or" : [{ name: "Robert" }]}, order: { name: "desc" } }

var getPeople = async (complex_query, token) => {
  var query = $.param(complex_query)
  var response = await fetch(`http://localhost:3000/people?${query}`, {
    headers: {'Authorization': `Bearer ${token}`},
  })
  const json = await response.json()
  console.log(json)
}
```
Note: you need jquery param function to convert hash in uri query
```javascript
var complex_query = { q: { age: 24, "$or" : [{ name: "Robert" }]}, order: { name: "desc" } }
var uri_query = $.param(complex_query)
// ?q%5Bage%5D=24&q%5B%24or%5D%5B0%5D%5Bname%5D=Robert&order%5Bname%5D=desc
```