
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
query = { age: 24, "$or" => [{name: "Robert" }]}
```

## send in the url
people route need send the query in the key "q" and order in the key "order"
example:
```ruby
params = { q: { age: 24, "$or" => [{ name: "Robert" }]}, order: { name: "desc" } }
```
# Example send complex query with ajax request
```javascript
var complex_query = { q: { age: 24, "$or" : [{ name: "Robert" }]}, order: { name: "desc" } }
var getPeople = async (complex_query) => {
  var query = $.param(complex_query)
  var response = await fetch(`http://localhost:3000/people?${query}`)
  var json = await response.json()
  console.log(json)
}
```
Note: you need jquery param function to convert hash in uri query
```javascript
var complex_query = { q: { age: 24, "$or" : [{ name: "Robert" }]}, order: { name: "desc" } }
var uri_query = $.param(complex_query)
// ?q%5Bage%5D=24&q%5B%24or%5D%5B0%5D%5Bname%5D=Robert&order%5Bname%5D=desc
```
var script = document.createElement('script');
script.type = 'text/javascript';
script.src = 'https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js';
document.head.appendChild(script);