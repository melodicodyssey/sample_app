class AddNameAndQuantityToWidget < ActiveRecord::Migration
  def change
    add_column :widgets, :name, :string
    add_column :widgets, :quantity, :integer
  end
end
