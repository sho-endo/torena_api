user = User.create(email: 'a@example.com', password: 'password')

example_menus = [
  {
    part: '胸',
    menus: %w(ベンチプレス インクラインベンチプレス ダンベルフライ インクラインダンベルフライ ダンベルデクラインプレス)
  },
  {
    part: '肩',
    menus: %w(ショルダープレス アーノルドプレス リバースショルダープレス サイドレイズ ライイングリアレイズ インクラインサイドレイズ)
  },
  {
    part: '二頭',
    menus: %w(インクラインアームカール インクラインハンマーカール ネガティブアームカール コンセントレーションカール ダンベルアームカール),
  },
  {
    part: '三頭',
    menus: %w(フレンチプレス ディップス ライイングダンベルエクステンション ダンベルキックバック リバースプッシュアップ),
  },
  {
    part: '背中',
    menus: %w(ワンハンドダンベルロウ チンニング ダンベルデッドリフト プルオーバー サポーテッドロウ),
  },
  {
    part: '脚',
    menus: %w(ダンベルスクワット ブルガリアンスクワット ワンレッグスクワット ランジ シシースクワット),
  }
]

example_menus.each do |example_menu|
  part = user.parts.create(name: example_menu[:part])

  example_menu[:menus].each do |menu|
    part.menus.create(name: menu)
  end
end
