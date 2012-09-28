require 'spec_helper'

describe 'include hubot' do
  it do
    should include_class('hubot::packages')
    should include_class('hubot::config')
    should include_class('hubot::service')
  end
end