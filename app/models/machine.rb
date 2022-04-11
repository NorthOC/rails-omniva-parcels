class Machine < ApplicationRecord

  #csv
  def self.to_csv
    CSV.generate() do |csv|
      name = %w(ZIP Name Adress)
      csv << name
      all.each do |item|
        row = [item.zip, item.name, item.full_address]
        csv << row
      end
    end
  end

end
