require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  before(:each) do 
    @admin = Admin.create(first_name: "John", last_name: "Doe", pseudo: "jojo", speciality: "Carpenter", email: "wwww@mail.com", password:"gagaga7", display: "true" , description:"great photographer")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@admin).to be_a(Admin)
      expect(@admin).to be_valid
    end

    describe "#pseudo" do
      it "should not be lower that 3 characters" do
        invalid_admin = Admin.create(first_name: "John", last_name: "Doe", pseudo: "a")
        expect(invalid_admin).not_to be_valid
        expect(invalid_admin.errors.include?(:pseudo)).to eq(true)
      end
    end
  
  end

  context "associations" do

    describe "projects" do
      it "should have_many projets" do
        project = Project.create(title: "Videoblog", description:"forest", content:"nicepics", admin: @admin, published: "true")
        expect(@admin.projects.include?(project)).to eq(true)
      end
    end
  
  end   

end
