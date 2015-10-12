# encoding: utf-8
# author: Dominik Richter

require_relative 'helper'
require 'train'

backends = {}

backends[:local] = proc {
  Train.create('local', {}).connection
}

tests = ARGV

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test))
  end
end
