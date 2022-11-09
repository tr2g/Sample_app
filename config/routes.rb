Rails.application.routes.draw do
 get 'top' => 'home#top'
 resources:lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

  #get 'lists/new'
  #get '/top' => 'homes#top'
  #post 'lists' => 'lists#create'
  #get 'lists' => 'lists#index'
  #get 'lists/:id' => 'lists#show', as:'list' #as以降が「名前付きルート」
  #【↑説明】投稿データを判別するための「:id」。アクション内で「params[:id]」と記述すると取得できる。
  #【↑説明】URLが/list/1の場合、params[:id]でid=1を取り出せる。
  #【↑説明】「as: オプション」で名前付きルートを設定。↑では「'lists#show'の設定をlistとして利用できる。」という意味。
  #【↑説明】asで名前付きルートを作ったらURLを変更したいときでもこのroute.rbだけを編集すれば良い。
  #get 'lists/:id/edit' => 'lists#edit', as:'edit_list'
  #【↑】前半のURLにアクセスするとlists内のeditというアクションを実行する。またlists#editの設定がedit_listと記述することで使えるようになる。
  #patch 'lists/:id' => 'lists#update', as:'update_list'
  #delete 'lists/:id' => 'lists#destroy',as: 'destroy_list'
