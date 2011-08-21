class Widget < ActiveRecord::Base

###### --- associations + attributes ---

  belongs_to :page
  belongs_to :registered_widget

  delegate :system_name, :to  =>:registered_widget

###### --- validations ---

  validates :registered_widget_id, :presence => true

###### --- scopes ---
  scope :by_placeholder, lambda {|placeholder| where('placeholder = ?', placeholder).ordered }
  scope :ordered, order(:position)
end
