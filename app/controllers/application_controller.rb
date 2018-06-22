class ApplicationController < ActionController::Base
  def hello
    render html: "helllllo"
  end
end
