require "grape"

class HelloWorld < Grape::API
  get "/" do
    "Hello World!"
  end
end

APP = HelloWorld
run APP
