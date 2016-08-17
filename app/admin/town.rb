ActiveAdmin.register Town do

  permit_params :name, :address_attributes => [:address_1, :address_2, :phone_number1, :secondary_phone_number ]

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :created_at

    actions
  end

  filter :name, :as => :select, :collection => Town.all

  form do |f|
    f.inputs "Town Details" do
      f.input :name


    end
    f.inputs for: [:address, (f.object.address || f.object.build_address)] do |auf|
      auf.input :address_1
      auf.input :address_2
      auf.input :phone_number1
      auf.input :secondary_phone_number
    end
    f.actions
  end


end
