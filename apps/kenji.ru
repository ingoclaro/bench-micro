require "kenji"

class HelloWorld < Kenji::Controller
  get "/" do
    "Hello World!"
  end
end

APP = proc do |env|
  Kenji::Kenji.new(env, root_controller: HelloWorld).call
end
run APP
