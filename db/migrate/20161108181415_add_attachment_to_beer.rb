class AddAttachmentToBeer < ActiveRecord::Migration
  def change
    add_attachment :beers, :image
  end
end
