class ChangeCountryToCountryCodeInProfile < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, :country, :country_code
  end
end
