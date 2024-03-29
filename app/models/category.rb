class Category < ActiveHash::Base
  self.data = [
    { id: 0, category: '---' },
    { id: 1, category: 'レディース' },
    { id: 2, category: 'メンズ' },
    { id: 3, category: 'ベビー・キッズ' },
    { id: 5, category: 'インテリア・住まい・小物' },
    { id: 6, category: '本・音楽・ゲーム' },
    { id: 7, category: 'おもちゃ・ホビー・グッズ' },
    { id: 8, category: '家電・スマホ・カメラ' },
    { id: 9, category: 'スポーツ・レジャー' },
    { id: 10, category: 'ハンドメイド' },
    { id: 11, category: 'その他' },
    #第3引数　　＃第四引数
  ]
  include ActiveHash::Associations
  has_many :items
  has_many :orders
  end