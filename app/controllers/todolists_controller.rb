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
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  def destroy
  end

  private
  # ストロングパラメータ：マスアサインメント傍若生を防ぐ境界線
  # ここから下の行はメソッド呼出し制限をかけられ,
  # アクションとして認識されない
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
