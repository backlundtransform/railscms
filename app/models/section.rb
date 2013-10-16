class Section < ActiveRecord::Base
  belongs_to :page
  has_one :css
end
