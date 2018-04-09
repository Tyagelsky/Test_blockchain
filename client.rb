require_relative 'blockchain'
require 'faraday'

URL = 'http://localhost'
PORT = 4567

def list
  Faraday.get("#{URL}:#{PORT}/list")
end

def validate
  Faraday.get("#{URL}:#{PORT}/validate")
end

def add_block(user, value)
  Faraday.post("#{URL}:#{PORT}/add_block", user: user, value: value )
end
