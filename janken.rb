# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand
    # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    # 変数「input_hand」にプレイヤーが入力したものを取得して代入します。
    # ヒント! 「getsメソッド」を使用します。
    input_hand = gets.to_i
    # 「input_hand」(取得した値)が「0, 1, 2」のいずれかだとwhileから脱出させ、それ以外だと初めから繰り返させます。
    while true
      # if 条件を書く (「input_hand」(取得した値)が「0, 1, 2」のいずれかの場合だった場合)
      if (input_hand == 0 || input_hand == 1 || input_hand == 2)
        # 「input_hand」(取得した値)をそのまま返します。
        return input_hand
      else
        # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
        puts "もう一度数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        # 変数「input_hand」にプレイヤーが入力したものを取得して代入します。
        input_hand = gets.to_i
      end
    end
  end
end
# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力させます。
    return rand(3)
  end
end
# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    puts "自分の手は#{janken[player_hand]}です"
    puts "相手の手は#{janken[enemy_hand]}です"
    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジックを作成します。
    result = (player_hand - enemy_hand + 3) % 3
    if result == 2
      puts "あなたの勝ちです"
      return false
    elsif result == 1
      puts "あなたの負けです"
      return false
    else
      puts "あいこです。もう一度やりましょう"
      return true
    end
  end
end
# 変数「player」にPlayerをインスタンス化したものを代入します。
player = Player.new
# 変数「enemy」にEnemyをインスタンス化したものを代入します。
enemy = Enemy.new
# 変数「janken」にJankenをインスタンス化したものを代入します。
janken = Janken.new
# 変数「next_game」に「true」を代入します。※「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行するためです。
next_game = true
# 以降の型の例に沿って実装しましょう ※実装する時場合はコメントアウトに注意しましょう。
while next_game do
  # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
  # 「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
  next_game = janken.pon(player.hand, enemy.hand)
  # じゃんけんの実行結果に「false」が返ってくると、このwhileを終了します。「true」が返ってくると、その回数だけ繰り返し続けます。
end
