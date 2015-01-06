class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :title
      t.text  :description
      t.date    :date
      t.string  :eventTime
      t.string  :cost
      t.string  :address
      t.string  :category
      t.string  :city
      t.string  :area
      t.string :zipcode
      t.belongs_to :user
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longtitude, precision: 10, scale: 6
    end
  end
end