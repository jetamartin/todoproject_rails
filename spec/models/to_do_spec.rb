require 'rails_helper'

describe ToDo do
  it { expect(subject).to validate_presence_of :name }
end
