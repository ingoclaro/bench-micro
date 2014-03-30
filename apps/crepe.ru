require "crepe"

class HelloWorld < Crepe::API
  get "/" do
    "Hello World!"
  end
end

APP = HelloWorld
run APP
