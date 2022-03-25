ログイン
    理解不足(新しい知識)
    ・delete methodが使えない。 → get methodに変えることで動くようになった。
    config/devise.rb config.sign_out_via = :delete を config.sign_out_via = :get に変更。

    ・rails g model Photo user:belongs_to caption:text のcaption:textの部分がわからない

画像投稿

    仮説
    1 photoモデルはuserモデルに属しているので、userモデルに投稿された画像はphotoモデルで設定したhas_one_attached :imageを使って画像を取得できる。 → <%= image_tag photo.image %>
    これをviewのファイルで表示できる。

    2 Scaffoldを使ってparams.require.permitの挙動確認
    参考記事
    https://techblog.kyamanak.com/entry/2017/08/29/012909
    https://viral-community.com/security/curl-8263/

    3 current_user
    deviseで作成したUserモデルとPhotoモデルを紐付けるためにUserモデルにhas_many :photosとすることで紐付けできる。そして、current_userはPhotosControllerでUserモデルに紐付いたphotoのデータを生成するときに使う。current_userを使うことで自動的にのuserのidが自動的に保存される。
    app/controller/photos_controller.rb
    しかし、@photo = Photo.new でも作成ができるみたいなので current_user を使う理由は明確にわかっていない。
    ================================================================================

    理解不足(新しい知識)

    ・form_withで使われている local: true の説明
    こちらのRailsドキュメントにオプション一覧が記載されているが、ここの説明によると「リモート送信の無効（デフォルトはfalse）」とのこと。
    つまり、local: trueを入力していない場合、非同期通信(Ajaxによる通信)が行われる。
    local: trueを入力すれば、非同期通信をキャンセルし、HTMLとしてフォームの送信が可能になる。
    https://qiita.com/kmjooh/items/c533b2f72a2f3e5a29a9

    form_withで使われる form.file_field はファイル選択ボックスを生成するものである。
    form_withに関する参考記事
    https://pikawaka.com/rails/form_with

    ・パラメーターを受け取る
    def create
        @photo = Photo.new(photo_params)
    end
    パラメーターの参考記事
    https://guides.rubyonrails.org/action_controller_overview.html
    https://techacademy.jp/magazine/22078
    https://ymiyashitablog.com/rails-require-permit/
    https://techracho.bpsinc.jp/hachi8833/2017_04_05/37930

    ・privateの参考記事
    https://26gram.com/private-protected-in-ruby

    ・params.require.permit
    https://techblog.kyamanak.com/entry/2017/08/29/012909

    ・captionカラム
    投稿の内容を入力。ここにハッシュタグが入力される前提
    https://qiita.com/Naoki1126/items/06e75badae93fc62d52d

    ・curent_user
    https://qiita.com/sawayu/items/9f879b859d00d8d9e8a7
    

    