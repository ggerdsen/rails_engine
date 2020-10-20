require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "validations" do
    # it { should validate_presence_of :csv_id }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :created_at }
    it { should validate_presence_of :updated_at }
  end

  describe "relationships" do
    it {should have_many :invoices}
    it {should have_many(:transactions).through(:invoices)}
    it {should have_many(:merchants).through(:invoices)}
  end
end
