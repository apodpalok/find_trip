require 'rails_helper'

describe Car do
  context 'associations' do
    it { should belong_to(:user) }
  end
end
