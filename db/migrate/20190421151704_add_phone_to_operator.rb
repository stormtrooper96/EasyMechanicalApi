class AddPhoneToOperator < ActiveRecord::Migration[5.2]
  def change
    add_column :operators, :phone, :integer
  end
end
