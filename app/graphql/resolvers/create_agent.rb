class Resolvers::CreateAgent < GraphQL::Function
  argument :cde, !types.String
  argument :fullname, !types.String

  type do
    name 'CreateAgent'

    field :message, types.String
  end

  def call(_obj, args, _ctx)
    message = _ctx[:current_user]
    if message != 'Invalid Access Token.'
      Agent.create!(
        cde: args[:cde],
        fullname: args[:fullname]
      )
      message = 'Agent successfully added!'
    end

    OpenStruct.new({
      message: message
    })
  end
end
