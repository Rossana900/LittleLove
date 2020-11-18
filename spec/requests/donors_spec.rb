require 'rails_helper'
RSpec.describe "DonorsControllers", type: :request do
  describe "get donors_path" do
    it "renders the index view" do
      FactoryBot.create_list(:donor, 10)
      get donors_path
      expect(response.status).to eq(200)
    end
  end
  describe "get donor_path" do
    it "renders the :show template" do
      donor = FactoryBot.create(:donor)
      get donor_path(id: donor.id)
      expect(response.status).to eq(200)
    end
    it "redirects to the index path if the donor id is invalid" do
      get donor_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to donors_path
    end
  end
    describe "get new_donor_path" do
    it "renders the :new template"
  end
    describe "get edit_donor_path" do
    it "renders the :edit template"
  end
    describe "post donors_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      donor_attributes = FactoryBot.attributes_for(:donor)
      expect { post donors_path, params: {donor: donor_attributes}
    }.to change(Donor, :count)
      # expect(response).to redirect_to donor_path(id: Donor.last.id)
    end
  end
    describe "post donors_path with invalid data" do
    it "does not save a new entry or redirect" do
      donor_attributes = FactoryBot.attributes_for(:donor)
      donor_attributes.delete(:first_name)
      expect { post donors_path, params: {donor: donor_attributes}
    }.to_not change(Donor, :count)
      expect(response.status).to eq(200)
    end
  end
    describe "put donor_path with valid data" do
    it "updates an entry and redirects to the show path for the donor"
  end
    describe "put donor_path with invalid data" do
    it "does not update the donor record or redirect"
  end
    describe "delete a donor record" do
    it "deletes a donor record"
  end
end

