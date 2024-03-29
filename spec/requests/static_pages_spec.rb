require 'spec_helper'

describe "StaticPages" do
  subject { page }
  let(:base_title) { "Ruby on Rails Training App" }
  
  describe "Home page" do
    it "should work" do
      get root_path
      response.status.should be(200)
    end
    describe "visits" do
      before { visit root_path }
      it { should have_content('Ruby on Rails Training') }
      it { should have_selector('h1', :text => 'Training Application') }
      it { should have_selector('title', :text => "#{base_title}") }
      it { should_not have_selector('title', :text => "| Home") }
    end
  end
  
  describe "Help page" do
    before { visit help_path }
    it { should have_selector('h1', :text => "Help") }
    it { should have_selector('title', :text => "#{base_title} | Help") }
  end
  
  describe "About page" do
    before { visit about_path }
    it { should have_selector('h1', :text => 'About Us') }
    it { should have_selector('title', :text => "#{base_title} | About Us") }
  end
  
  describe "Contact page" do
    before { visit contact_path }
    it { should have_selector('h1', :text => 'Contact') }
    it { should have_selector('title', :text => "#{base_title} | Contact") }
  end  
  
  describe "Homepage" do
    it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      page.should have_selector 'title', :text => "#{base_title} | About Us"
      click_link "Help"
      page.should have_selector 'title', :text => "#{base_title} | Help"
      click_link "Contact"
      page.should have_selector 'title', :text => "#{base_title} | Contact"
      click_link "Home"   
      page.should have_selector 'title', :text => "#{base_title}"
      click_link "training app"
      # click_link "Sign up now!"
      # page.should have_selector 'title', :text => "#{base_title}"
    end
  end
end
