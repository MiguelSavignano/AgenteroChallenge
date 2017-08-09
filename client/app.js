var complex_query = { q: { age: 24, "$or" : [{ name: "Robert" }]}, order: { name: "desc" } }

var getPeople = async (complex_query) => {
  var query = $.param(complex_query)
  const token = await sigIn()
  var response = await fetch(`http://localhost:3000/people?${query}`, {
    headers: {'Authorization': `Bearer ${token}`},
  })
  const json = await response.json()
  console.log("People")
  console.log(json)
}

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
// sigIn()
getPeople(complex_query)