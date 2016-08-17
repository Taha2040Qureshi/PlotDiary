ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :town_id, :user_type

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :updated_at
    actions
  end
  #mysql.server start
  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :town_id, :label => 'Town', :as => :select, :collection => Town.all
      f.input :user_type, :lebel => 'Type', :as => :select, :collection => [['ADMIN', 'admin'], ['OPERATER', 'operater']]
    end
    f.actions
  end

end
