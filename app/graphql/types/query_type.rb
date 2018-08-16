Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :tesField, types.String do
    resolve ->(obj, args, ctx) {
      'Hello World!'
    }
  end

end
