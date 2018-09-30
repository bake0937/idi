class AddAvatarToProfiles < ActiveRecord::Migration[4.2]
  def change
    add_column :profiles, :avatar, :string
  end
end
