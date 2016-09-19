require 'rails_helper'

describe Answer do
  it { should validate_presence_of :title }
  it { should validate_presence_of :text }
end
