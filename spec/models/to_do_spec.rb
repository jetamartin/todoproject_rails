require 'rails_helper'

describe ToDo do
  fixtures :to_dos

  it { expect(subject).to validate_presence_of :name }
  it { expect(ToDo.all.count).to eq 2}
end
