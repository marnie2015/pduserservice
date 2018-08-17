class Resolvers::ChangePassword < GraphQL::Function
  argument :email, !types.String
  argument :old_pass, !types.String
  argument :new_pass, !types.String
  argument :confirm_pass, !types.String

  type do
    name 'ChangePassword'

    field :message, types.String
  end

  def call(_obj, args, _ctx)
    @message = _ctx[:current_user]
    if @message != 'Invalid Access Token.'
      _ctx[:current_user]['designation'].downcase == 'admin' ?
        admin_access(args[:email], args[:new_pass], args[:confirm_pass]) :
        user_access(args[:email], args[:old_pass], args[:new_pass], args[:confirm_pass])
    end

    OpenStruct.new({
      message: @message
    })
  end

  def admin_access(email, new_pass, confirm_pass)
    user = User.where(email: email).first

    if user.nil?
      @message = 'Record not found!'
    else
      @message = user.update(password: new_pass, password_confirmation: confirm_pass) == true ?
        'Password successfully changed!' : 'Invalid confirmation password!'
    end
  end

  def user_access(email, old_pass, new_pass, confirm_pass)
    user = User.where(email: email).first.try(:authenticate, old_pass)

    if user.nil?
      @message = 'Record not found!'
    elsif user == false
      @message = 'Invalid old password!'
    else
      @message = user.update(password: new_pass, password_confirmation: confirm_pass) == true ?
        'Password successfully changed!' : 'Invalid confirmation password!'
    end
  end
end
