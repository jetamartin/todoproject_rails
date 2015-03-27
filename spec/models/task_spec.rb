require 'rails_helper'
require 'shoulda/matchers'

describe Task do
  # it { expect(subject).to validate_presence_of :name }
  it 'is invalid without a name' do
    expect(build(:task, name: nil)).to_not be_valid
  end
  it 'is invalid without a priority' do
    expect(build(:task, priority: nil)).to_not be_valid
  end

end
