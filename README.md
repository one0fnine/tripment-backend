# README
## Tripment Backend

### Description
List of medical procedures.

### Tasks
``` rails procedures::update ```
### Endpoints
* `GET /api/v1/procedures` - list of procedures
* `GET /api/v1/procedures?filter[name]=blood` - filter by name
* `PUT /api/v1/procedures/reload` - async refetching procedures

### Linters & audit
* rubocop
* bundle-audit
* brakeman

### Test
`bundle exec rspec`
