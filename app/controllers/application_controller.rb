class ApplicationController < ActionController::Base
  def hello
    render html: "hellllo"
  end
end
