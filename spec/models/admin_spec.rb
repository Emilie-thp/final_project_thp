require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  #pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do @admin = Admin.create(first_name: "John", last_name: "Doe", pseudo: "jojo", speciality: "carpenter", email: "wwww@mail.com", password:"gagaga", display:"false", description:"juratime")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@admin).to be_a(Admin)
      expect(@admin).to be_valid
    end

    describe "#first_name" do
      it "should not be valid without first_name" do
        bad_admin = Admin.create(last_name: "Doe")
        expect(bad_admin).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule admin.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_admin.errors.include?(:first_name)).to eq(true)
      end
    end

    describe "#last_name" do
      it "should not be valid without last_name" do
        bad_admin = Admin.create(first_name: "John")
        expect(bad_admin).not_to be_valid
        expect(bad_admin.errors.include?(:last_name)).to eq(true)
      end
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
        project = Project.create(title: "strtrtr", description:"cscs", content:"fafa", admin: @admin)
        expect(@admin.projects.include?(project)).to eq(true)
      end
    end

  end   

  context "public instance methods" do

    describe "#full_name" do

      it "should return a string" do
        expect(@admin.full_name).to be_a(String)
      end

      it "should return the full name" do
        admin_1 = Admin.create(first_name: "John", last_name: "Doe", pseudo: "johndoe")
        expect(admin_1.full_name).to eq("John Doe")
        admin_2 = Admin.create(first_name: "Jean-Michel", last_name: "Durant", pseudo: "kikou_du_67")
        expect(admin_2.full_name).to eq("Jean-Michel Durant")
      end
    end

  end


end
