class AddStartDateToPlanet < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :start_date, :datetime
  end
end
