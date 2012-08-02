require 'spec_helper'

describe Project do
  before(:each) do
		@usr = {
		    #:name => "Example User",
		    :email => "user@example.com",
		    :password => "foobar",
		    :password_confirmation => "foobar"
		  }

		@prj = {
				:title => "Awesome project",
				:description => "Lorem ipsum dolor et si malalala",
				:private => false
		}

		@prj2 = {
				:title => "Great project",
				:description => "Great New project...",
				:private => false
		}

		@prj3 = {
				:title => "Private project",
				:description => "Top secret project...",
				:private => true
		}


	   
	   @user = User.new @usr
	   #@project = Project.new @project
  end

  it "can be added to a user" do
  	@user.projects.build @prj
  	@user.projects.first.title.should eq "Awesome project"
  end

  it "should add more projects to user" do
  	@user.projects.build @prj2
  	@user.projects.first.title.should eq "Great project"
  end

  it "can be created as private" do
  	project = @user.projects.build @prj3
  	project.should be_private
  end

  it "is not private unless set to be" do
  	project = @user.projects.build @prj2
  	project.should_not be_private
  end

end
