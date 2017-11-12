class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :linkpicturetags
  has_many :tags, through: :linkpicturetags
  belongs_to :category
  belongs_to :user

  has_many :likes
  attr_accessor :liked
  acts_as_votable

  def self.searchByUser(args)
    out = []
    search = args[:search_user]
    out = Picture.joins(:user).where(["users.pseudo LIKE :query", query: "%#{search.capitalize}%"]).order('images.id DESC')
    return out.limit(6)
  end

  def self.filter(args)
    out = []
    if args[:search_user].present?
        out = searchByUser(args)
    elsif args[:category_id].present?
        out = Picture.where(["category_id = ?",args[:category_id]]).order('id DESC')
    elsif args[:picture_id].present?
        out = Picture.where(["id = ?",args[:image_id]]).order('id DESC')
    elsif args[:tag_id].present?
        out = Picture.joins(:linkpicturetags).where(["tag_id = ?",args[:tag_id]])
    elsif args[:user_id].present?
        out = Picture.where(["user_id = ?",args[:user_id]]).order('id DESC')
    else
        out = Picture.all.order('id DESC')
    end

    if args[:last_id].present?
        out = out.where("id < ?", args[:last_id]).order('id DESC')
    end
    return out.limit(6)
  end
end
