class Admin::BaseController < ApplicationController
  layout false, only: [:index]
  def index
  end
end
