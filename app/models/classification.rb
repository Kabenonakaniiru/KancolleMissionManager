class Classification < ApplicationRecord
  def self.initialize_data
    [{ name: '単発' }, { name: '年次' }, { name: '3ヶ月' }, { name: '月次' }, { name: '週次' }, { name: '日次' }]
  end
end
