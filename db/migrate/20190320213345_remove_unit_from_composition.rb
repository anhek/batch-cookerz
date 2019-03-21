class RemoveUnitFromComposition < ActiveRecord::Migration[5.2]
  def change
    remove_column :compositions, :unit, :string
  end
end
