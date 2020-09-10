class TodolistsController < ApplicationController
  def new
    @list = List.new
  end
  def create
    # データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # データをDBに保存するためのsaveメソッド実行
    list.save
    # トップ画面へリダイレクト
    redirect_to '/top'
  end

  def index
    @lists = List.all
  end
  
  private
  # ストロングパラメータ：マスアサインメント傍若生を防ぐ境界線
  # ここから下の行はメソッド呼出し制限をかけられ,
  # アクションとして認識されない
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
