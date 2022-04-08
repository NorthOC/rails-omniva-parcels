class Machine < ApplicationRecord

  #csv
  def self.to_csv
    CSV.generate() do |csv|
      name = %w(ZIP Name Adress)
      csv << name
      all.each do |item|
        row = [item.ZIP, item.NAME, item.FULL_ADDRESS]
        csv << row
      end
    end
  end

end
