class Resolvers::CreateAgent < GraphQL::Function
  argument :cde, !types.String
  argument :fullname, !types.String

  type Types::AgentType

  def call(_obj, args, _ctx)
    Agent.create!(
      cde: args[:cde],
      fullname: args[:fullname]
    )
  end
end
