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

    describe "articles" do
      it "should have_many articles" do
        article = Article.create(title: "Great photos", description:"Photos in winter", content:"Winter 2020", admin: @admin, published: "false")
        expect(@admin.articles.include?(article)).to eq(true)
      end
    end

    describe "events" do
      it "should have_many events" do
        event = Event.create(title: "Meeting on sunday", description:"Everybody can come", content:"Discover our associatios", admin: @admin, date: "12-22-2019", location: "Park", published: "false")
        expect(@admin.events.include?(event)).to eq(true)
      end
    end
  
  end   

end
