class BindersController < ApplicationController
  before_action :authenticate_user!

  def index
    @binders = current_user.binders.includes(:headline)
  end

  def show
    @binder = Binder.find(params[:id])
    @pieces = @binder.pieces.includes(:memo)
  end

  def create
    user = User.find(params[:user_id])
    keyword = params[:q]
    headline = Headline.find_by(name: keyword)
    @binder = user.binders.build()
    @binder.headline = headline
    if @binder.save
      @binder.update_pieces(params[:q])
      redirect_to user_binder_path(id: @binder.id)
    else
      render :template => "memo/index"
    end
  end

  def destroy
  end
end
