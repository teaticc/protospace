require "rails_helper"

describe Good do

  describe "associations" do

    describe "with valid associations" do
      it { should belong_to(:prototype) }
      it {should belong_to(:user)}
    end

  end

end
