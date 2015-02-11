require 'rails_helper'
require 'shoulda/matchers'

describe Task do
  it { expect(subject).to validate_presence_of :name }
end
