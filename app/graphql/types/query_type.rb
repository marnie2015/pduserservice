Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :signIn, types[Types::UserType] do
    description 'Login function'
    argument :email_address, !types.String
    argument :password, !types.String

    resolve ->(obj, args, ctx) {
      User.where(email_address: args[:email_address], password: encryptpass(args[:password]))
    }

    def encryptpass(val)
      Digest::MD5.hexdigest(val)
    end
  end
end
