class Page < ActiveRecord::Base
  has_paper_trail
  has_permalink
  has_many :tags
  belongs_to :categories
  validates_presence_of :title, :category
  mount_uploader :image, ImageUploader

  define_index do
    indexes :title, sortable: true
    indexes :body
    set_property :group_concat_max_len => 8192
  end

  def to_param
    permalink
  end

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