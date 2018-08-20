class Resolvers::CreateRole < GraphQL::Function
  argument :category, !types.String
  argument :sub_category, !types.String
  argument :url, !types.String

  type do
    name 'CreateRole'
    field :message, types.String
  end

  def call(_obj, args, _ctx)
    message = _ctx[:current_user]
    if message != 'Invalid Access Token.'
      Role.create!(
        category: args[:category],
        sub_category: args[:sub_category],
        url: args[:url]
      )
      message = 'Role successfully added!'
    end

    OpenStruct.new({
      message: message
    })
  end
end
