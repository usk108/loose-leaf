class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def new
    @memo = Memo.new(date: Time.now)
  end

  def create
    @memo = Memo.new(memo_params)
    #TODO: 日時重複チェック時に適切なとこに移動
    @memo.date = Time.now
    if @memo.save
      redirect_to memos_path
    else
      render 'new'
    end
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      redirect_to memos_path
    else
      render 'edit'
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to memos_path
  end

  private

    def memo_params
      params[:memo].permit(:date, :text)
    end
end
