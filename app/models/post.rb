class Post < ActiveRecord::Base
  attr_accessible :body, :photo


  belongs_to :user


  has_attached_file :photo,
    styles: { thumb: '300' },
    url: '/system/:class/:id/:attachment/:style/:filename'
end
