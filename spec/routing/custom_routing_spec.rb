require "rails_helper"

RSpec.describe "Custom routing", type: :routing do
  describe "routing" do

    it "routes /register to users#new" do
      expect(:get => "/register").to route_to("users#new")
    end

    it "routes /login to sessions#new" do
      expect(:get => "/login").to route_to("sessions#new")
    end

    it "routes /logout to sessions#destroy" do
      expect(:get => "/logout").to route_to("sessions#destroy")
    end

    it "routes /users/create to users#create" do
      expect(:post => "/users/create").to route_to("users#create")
    end

  end
end
