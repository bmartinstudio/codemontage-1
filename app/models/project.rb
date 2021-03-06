class Project < ActiveRecord::Base
  belongs_to :organization
  acts_as_ordered_taggable
  acts_as_ordered_taggable_on :technologies, :causes
  
  attr_accessible :organization_id, :name, :github_repo, :description, :notes, :cause_list, :technology_list
  
  def github_url
    github_url = "http://github.com/" + self.organization.github_org + "/" + self.github_repo
  end  

  def related_projects
    projects = self.organization.projects.where("id NOT IN (?)", self.id)
  end

end
