ActiveAdmin.register User do
  permit_params :name, :address, :age

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :age
    actions
  end

  filter :name
  filter :address
  filter :age

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :age
    end
    f.actions
  end
end
