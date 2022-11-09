class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    #↓対象のカラムにデータが入力されていなければsaveメソッドでfalseを返し、新規投稿画面を表示するようになってる。
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new #render＝同じコントローラー内の別アクションのViewを表示できる。
    end
    #↓処理の流れ1⃣＆2⃣データを受け取り、新規登録するためのインスタンス作成
    #list = List.new(list_params)
    #↓3⃣データベースに保存するためのsaveメソッド実行
    #list.save
    #↓4⃣トップページへリダイレクト
    #redirect_to list_path(list.id)
    #投稿後、すぐに投稿した記事を見られるようにリダイレクトする設定。
    #list.idの引数を付けないとshowアクションが迷子になるので引数は必ず設定！
  end

  def index
    @lists = List.all
    #↑投稿したListを全て表示するので複数形。
    #allメソッド=listsテーブルに保存されている全てのデータを取得できる。
  end

  def show
    @list = List.find(params[:id])
    #↑レコードを一件だけ取得するので単数形。
    #findメソッド=idカラムと引数を比べてレコードを取得してくる。
    #params=「/list/1にアクセスしたとき、idが1のレコードを取得しますよ」という意味
  end

  def edit
    @list = List.find(params[:id])
    #投稿済みのデータを編集するので既に保存されているデータの取得が必要=findメソッドを使う
  end

  def update
    list = List.find(params[:id]) #idを付けることでどのデータを詳細画面に表示するか決めている。
    list.update(list_params) #保存したいデータをlist_paramsで絞り込んでる
    redirect_to list_path(list.id) #showアクション（詳細画面表示）に戻る。！idの付け忘れ注意！
  end

  def destroy
    list = List.find(params[:id]) #データ（レコード）を一件取得する
    list.destroy #↑で取得したデータ（レコード）を削除する
    redirect_to '/lists' #投稿一覧画面へ戻る
  end

  private
  #ストロングパラメーター
  def list_params
    params.require(:list).permit(:title, :body, :image)
    #params=formから送られてくるデータが入ってる
    #require=送られてきたデータの中からモデルを指定し、データを絞り込む
    #permit=↑で絞り込まれたデータの中から保存を許可するカラムを指定
  end
end
