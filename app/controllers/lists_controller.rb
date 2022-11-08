class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    #処理の流れ1⃣＆2⃣データを受け取り、新規登録するためのインスタンス作成
    list = List.new(list_params)
    #3⃣データベースに保存するためのsaveメソッド実行
    list.save
    #4⃣トップページへリダイレクト
    redirect_to '/top'
  end

  def index
    @lists = List.all
  end

  def show
  end

  def edit
  end

  private
  #ストロングパラメーター
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
