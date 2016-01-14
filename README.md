# ECS Claims Ruby Gem

A Ruby wrapper for the ECS Claims API.

You should access the ECS Claims API documentation in order to learn more about the
request/response parameters for each endpoint.

## Installation

```
$ gem install ecs_claims_ruby
```

Or if you are using Bundler, add

````
gem 'ecs_claims_ruby'
```

## API Usage Examples

You will need to get an access token. Once you have it, initialize the client
to make authenticated calls.

```ruby
require 'ecs_claims_ruby'

client = EcsClaims::Client.new(token: '<redacted>', url: '<redacted>',
  rfc: '<redacted>')
```

### Claims

Create a claim.

```ruby
attributes = {
  Paciente: {
    fichaEmp: '98',
    numEmpresa: '0',
    curp: 'VICTALPPRCV376MNIV',
    numCod: '5',
    nombre: 'TALENS VICENTE ISIDRO'
  },
  Cuenta: {
    numEvento: '1',
    fechaAdm: '2016-01-06T13:37:56',
    fechaAlta: '2016-01-06T13:41:01',
    folioAut: 'EC0000000005',
    total: 0,
    estatus: 'C',
    cedula: '684097',
    medico: 'LUIS ANTONIO TORRES  FACUNDO',
    tipo: 'H'
  },
  listaDx: {}
}

claim = EcsClaims::Claim.new(client)
response = claim.create(attributes)
response.inspect
```
Retrieve existing claim

```ruby
response = claim.create(attributes)
response = claim.fetch(response['id'])
response.inspect
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
