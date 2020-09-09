class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.string :body
      t.timestamps
      # t.timestamps ：このテーブルに書込・修正した時に
      # そのタイムスタンプを保存しておくためのカラム
    end
  end
end
