class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :linkpicturetags
  has_many :tags, through: :linkpicturetags
  belongs_to :category
  belongs_to :user

  has_many :likes
  attr_accessor :liked
  acts_as_votable

  def self.search(args)
    out = []
    @text_search = args[:search]
    if @text_search.first == "#"
      @text_search[0] = ''
      out = Picture.joins(:linkpicturetags).joins(:tags).where(["UPPER(tags.name) LIKE :query", query: "%#{@text_search.capitalize}%"])
    else
      out = Picture.joins(:user).where(["UPPER(users.pseudo) LIKE :query", query: "%#{@text_search.upcase}%"])
    end
    return out.limit(6)
  end

  def self.filter(args)
    out = []
    if args[:search].present?
        out = search(args)
    elsif args[:category_id].present?
        out = Picture.where("category_id = ?", args[:category_id])
    elsif args[:tag_id].present?
        out = Picture.joins(:linkpicturetags).where("linkpicturetags.tag_id = ?", args[:tag_id])
    elsif args[:user_id].present?
        out = Picture.where("user_id = ?", args[:user_id])
    else
        out = Picture.all
    end

    if args[:last_id].present?
        out = out.where("id < ?", args[:last_id])
    end

    return out.order('pictures.id DESC').limit(6)
  end
end
