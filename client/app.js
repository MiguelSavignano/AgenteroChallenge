var complex_query1 = { q: { age: 29, oss_projects: 3 }, order: {age: "desc"} }
var complex_query2 = { q: { "$or": [{ name: "John" }, { name: "Amanda" }] } }
var complex_query3 = { q: { age: 24, "$or": [{ name: "Robert" }]}, order: { name: "desc" } }
var complex_query4 = { q: {"age": {"$gte": 25 }}, order: { age: "desc" } }

var getPeople = async (complex_query, token) => {
  var query = $.param(complex_query)
  var response = await fetch(`http://localhost:3000/people?${query}`, {
    headers: {'Authorization': `Bearer ${token}`},
  })
  const json = await response.json()
  console.log("GET /people")
  console.log("params: ", JSON.stringify(complex_query))
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

const init = async () => {
  const token = await sigIn()
  getPeople(complex_query1, token)
  getPeople(complex_query2, token)
  getPeople(complex_query3, token)
  getPeople(complex_query4, token)
}
init()