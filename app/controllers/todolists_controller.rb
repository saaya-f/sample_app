class TodolistsController < ApplicationController
  def new
    @List = List.new
  end
end
