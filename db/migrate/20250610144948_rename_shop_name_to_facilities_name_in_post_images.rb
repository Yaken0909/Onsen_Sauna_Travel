class RenameShopNameToFacilitiesNameInPostImages < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_images, :shop_name, :facilities_name
  end
end