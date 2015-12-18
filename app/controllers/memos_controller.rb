class MemosController < ApplicationController
  before_action :authenticate_user!

  def index
    set_user
    @memos = Memo.page(params[:page])
  end

  def show
    set_user
    @memo = Memo.find(params[:id])
  end

  def new
    set_user
    @memo = Memo.new(date: Time.now, user: @user)
  end

  def create
    set_user
    @memo = @user.memos.build(memo_params)
    #TODO: 日時重複チェック時に適切なとこに移動
    @memo.date = Time.now
    if @memo.save
      @memo.update_headlines
      @memo.update_pieces
      redirect_to user_memos_path
    else
      render 'new'
    end
  end

  def edit
    set_user
    @memo = Memo.find(params[:id])
  end

  def update
    set_user
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      @memo.update_headlines
      @memo.update_pieces
      redirect_to user_memos_path
    else
      render 'edit'
    end
  end

  def destroy
    set_user
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to user_memos_path
  end

  def search
    @keyword = params[:q]
    @memos = Memo.search(params).page(params[:page]).per(params[:per])
  end

  private

    def memo_params
      params[:memo].permit(:date, :text)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
