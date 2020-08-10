class AddEndDateToPlanet < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :end_date, :datetime
  end
end
