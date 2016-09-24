# # -*- coding: utf-8 -*-
#
# require 'mongo'
#
# # データベースと接続
# connection = Mongo::Connection.new
# # connection = Mongo::Connection.new('localhost');
# # connection = Mongo::Connection.new('localhost'27017);
# db = connection.db('paihu')
# coll = db.collection('kyokus')
#
# doc = { 'name' => 'MongoDB', 'type' => 'database', 'count' => 1, 'info' => { 'x' => 203, 'y' => '102' } }
#
# # コレクションにドキュメントをインサート
# # (データベースが存在しない場合はここで初めて作成される)
# # id = coll.insert(doc)

kyoku_count = 0
prev_labmen = ""
ryu_kyoku_sum = 0
ryu_kyoku_count = 0
tumo_count = 0
tumo_sum = 0
File.open('houton2015.txt', encoding: 'CP932:UTF-8') do |file|
    # IO#each_lineは1行ずつ文字列として読み込み、それを引数にブロックを実行する
    # 第1引数: 行の区切り文字列
    # 第2引数: 最大の読み込みバイト数
    # 読み込み用にオープンされていない場合にIOError
  file.each_line do |labmen|
    # p i = i + 1

      # labmenには読み込んだ行が含まれる
      if labmen =~ /ツモ(?!\/)/
        puts labmen.scan(/[0-9]{4,5}/)[0].to_i
        tumo_sum = tumo_sum + 1
        # ryu_kyoku_count = ryu_kyoku_count + 1
        # puts prev_labmen
        # puts labmen
        # ryu_kyoku_sum= ryu_kyoku_sum + prev_labmen.scan(/\-{1}[0-9]{4,5}/)[0].to_i
        # puts ryu_kyoku_sum
        # p "流局数: #{ryu_kyoku_count}"
        # p "罰符合計: #{ryu_kyoku_sum}"
        # p "罰符平均: #{ryu_kyoku_sum / ryu_kyoku_count}"
      end
      prev_labmen = labmen

      # p "立直数: #{rich_count}"
      # p "一発数: #{ippatu_count}"
      # p "統計本場数: #{kyoku_count}"
  end
end

p "ロン数: #{tumo_count}"
