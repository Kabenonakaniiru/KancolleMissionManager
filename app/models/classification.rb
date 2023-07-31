class Classification < ApplicationRecord
  def self.initialize_data
    [{ name: '単発' }, { name: '年次' }, { name: '3ヶ月' }, { name: '月次' }, { name: '週次' }, { name: '日次' }]
  end

  # 検索できる項目名。デフォルトでは全ての項目。
  #
  def self.ransackable_attributes(auth_object = nil)
    column_names + _ransackers.keys
  end

  # 参照できる関連テーブル。デフォルトは関連付く全てのテーブル
  #
  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end

  # ソート可能な項目。デフォルトは検索できる項目名と同じ
  #
  def self.ransortable_attributes(auth_object = nil)
    ransackable_attributes(auth_object)
  end

  # ransackが使用できるスコープ？
  # デフォルトは空。
  def self.ransackable_scopes(auth_object = nil)
    []
  end
end
