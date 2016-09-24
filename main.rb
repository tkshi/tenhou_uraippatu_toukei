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
require './Oya'

kyoku_count = 0
prev_labmen = ""
ryu_kyoku_sum = 0
ryu_kyoku_count = 0
tumo_count = 0
tumo_sum = 0

def convert_to_name_array(row)
  row_array = row.scan(/\[[0-9]*\](.*?)(?=\/)/)
  [row_array[0][0],row_array[1][0],row_array[2][0],row_array[3][0],]
end

def getKyokuSuu(row)
  row_array = row.scan(/([1-4]{1})局/)[0][0].to_i
end

def getPlayerName(row)
  row.split(' ')[2]
end

def getDaten(row)
  row.scan(/\-[0-9]{4,5}/)[0].to_i
end

# p convert_to_name_array("持点25000 [1]nagisa11/七段/女 R2163 [2]ティカ-γ/八段/男 R2195 [3]riouchan/七段/男 R2081 [4]ふじお/七段/男 R2209")

oya = Oya.new(['a','b','c','d'])
# p oya.oya?(4,'a')

sum = 0
count = 0
i = 0
File.open('houton2015.txt', encoding: 'CP932:UTF-8') do |file|
  file.each_line do |labmen|
    if labmen =~ /\[1\]/
      plyaer_name = convert_to_name_array(labmen)
      oya = Oya.new(plyaer_name)
    end
    if labmen =~ /ロン\s/
      kyoku_suu = getKyokuSuu(prev_labmen)
      name = getPlayerName(prev_labmen)
      if oya.oya?(kyoku_suu,name)
        sum = sum + getDaten(prev_labmen)
        count = count + 1
        p "数: #{count}"
        p "合計点: #{sum}"
        p "平均点: #{sum / count}"
      else
        # sum = sum + getDaten(prev_labmen)
        # count = count + 1
        # p "数: #{count}"
        # p "合計点: #{sum}"
        # p "平均点: #{sum / count}"
      end
    end
    prev_labmen = labmen
  end
end

p "数: #{count}"
p "合計点: #{sum}"
p "平均点: #{sum / count}"
