var complex_query = { q: { age: 24, "$or" : [{ name: "Robert" }]}, order: { name: "desc" } }
var getPeople = async (complex_query) => {
  var query = $.param(complex_query)
  var response = await fetch(`http://localhost:3000/people?${query}`, {
    method: "GET",
    headers:{
      "Content-Type": "application/json",
    },
  })
  var json = await response.json()
  console.log("People")
  console.log(json)
}

const sigIn = async () => {
  var response = await fetch(`http://localhost:3000/user_token`, {
    method: "POST",
    body: JSON.stringify({"auth": {"email": "user@test.com", "password": "12345678"}}),
    headers:{
      "Content-Type": "application/json"
    },
  })
}
sigIn()
// getPeople(complex_query)