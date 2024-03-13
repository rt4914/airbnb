module ApplicationHelper
  def country_name(country_code)
    unless country_code.nil? || country_code == ""
      country = ISO3166::Country[country_code]
      country.translations[I18n.locale.to_s] || country.common_name || country.iso_short_name
    end
  end
end
