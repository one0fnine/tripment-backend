# README
## Tripment Backend

### Description
List of medical procedures.

### Tasks
``` rails procedures:update ```
### Back-End URL
**[Heroku](https://tripment-backend.herokuapp.com/)**
### Endpoints
* `GET /api/v1/procedures` - list of procedures
* `GET /api/v1/procedures?filter[name]=blood` - filter by name
* `PUT /api/v1/procedures/reload` - async refetching procedures

### Docker
### Linters & audit
* rubocop
* bundle-audit
* brakeman

### Test
`bundle exec rspec`

### TODO
* add deploy to AWS
* develop front-end by React
