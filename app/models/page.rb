class Page < ActiveRecord::Base
  attr_accessible :title, :body, :group_id
  has_paper_trail

  has_many :tags
  belongs_to :group

  def self.pages_by_tag(string)
    pages = []
    Tag.where(tag_name: string).each do |tag|
      pages << Page.find(tag.page_id)
    end
    return pages
  end

  def add_tags(tags)
  	tags.split(" ").each do |t|
  		self.tags.create(tag_name: t)
  	end
  end
  
  def delete_tags
  	self.tags.each do |t|
  		t.destroy
  	end
  end

end
