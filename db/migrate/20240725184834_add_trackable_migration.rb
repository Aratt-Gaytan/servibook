class AddTrackableMigration < ActiveRecord::Migration[7.1]

  def change
    change_table :users do |t|

      t.string     :current_sign_in_ip
      t.string     :last_sign_in_ip
    end
  end
end
