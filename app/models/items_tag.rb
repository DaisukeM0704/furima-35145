class ItemsTag

  include ActiveModel::Model
  attr_accessor :message, :tag_name

  with_options presence: true do
    validates :message
    validates :tag_name
  end

  def save
    item = Item.create(message: message)
    tag = Tag.create(tag_name: tag_name)

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end