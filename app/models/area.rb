class Area < ApplicationRecord
  require 'csv'

  has_many :child_areas, class_name: 'Area', foreign_key: 'parent_area_id'
  belongs_to :parent_area, class_name: 'Area', optional: true

  def self.initialize_data
    # そこまでの行数は想定していないので、一括で読む。
    data_list = CSV.read('db/csv/areas.csv', headers: true)
    areas = []
    data_list.each do |data|
      areas << {
        id: data['id'],
        level: data['level'],
        parent_area_id: data['parent_area_id'],
        name: data['name'],
        column_name: data['column_name']
      }
    end
    areas
  end
end
