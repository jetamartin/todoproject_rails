require 'rails_helper'

describe ToDo do
  # fixtures :to_dos  ---Don't think I need this line

  it 'is invalid without a name' do
    expect(build(:to_do, name: nil)).to_not be_valid
  end

  it 'has the correct count for to do list items' do
    3.times.each {create(:to_do)}
    expect(ToDo.all.count).to eq 3
  end
end
