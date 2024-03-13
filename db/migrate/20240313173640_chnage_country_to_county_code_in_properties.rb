class ChnageCountryToCountyCodeInProperties < ActiveRecord::Migration[7.0]
  def change
    rename_column :properties, :country, :country_code
  end
end
