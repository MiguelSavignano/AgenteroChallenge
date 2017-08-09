var complex_query = { q: { age: 24, "$or" : [{ name: "Robert" }]}, order: { name: "desc" } }
const fetchConfig = {
  headers:{
    "Content-Type": "application/json",
  }
}
var getPeople = async (complex_query) => {
  var query = $.param(complex_query)
  var response = await fetch(`http://localhost:3000/people?${query}`, fetchConfig)
  var json = await response.json()
  console.log("People")
  console.log(json)
}

const sigIn = async () => {
  var response = await fetch(`http://localhost:3000/user_token`, {
    method: "POST",
    headers:{
      "Content-Type": "application/json",
    },
    body: JSON.stringify({"auth": {"email": "user@test.com", "password": "12345678"}})
  })
}
sigIn()
// getPeople(complex_query)