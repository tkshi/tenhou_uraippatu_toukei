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

kyoku_text = ''
rich_count = 0
ippatu_count = 0
kyoku_count = 0
i = 0
File.open('houton2015.txt', encoding: 'CP932:UTF-8') do |file|
    # IO#each_lineは1行ずつ文字列として読み込み、それを引数にブロックを実行する
    # 第1引数: 行の区切り文字列
    # 第2引数: 最大の読み込みバイト数
    # 読み込み用にオープンされていない場合にIOError
  file.each_line do |labmen|
    # p i = i + 1

      # labmenには読み込んだ行が含まれる
      kyoku_count = kyoku_count + 1 if labmen =~ /本場/
      next unless labmen =~ /符.*点/
      if labmen =~ /立直/
          rich_count += 1
          ippatu_count += 1 if labmen =~ /一発/
      end
      # p "立直数: #{rich_count}"
      # p "一発数: #{ippatu_count}"
      # p "統計本場数: #{kyoku_count}"
  end
end

p "立直数: #{rich_count}"
p "一発数: #{ippatu_count}"
p "統計本場数: #{kyoku_count}"
