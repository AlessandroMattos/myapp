class AddMiningTypeToMoedas < ActiveRecord::Migration[5.2]
  def change
    add_reference :moedas, :mining_type, foreign_key: true
  end
end
