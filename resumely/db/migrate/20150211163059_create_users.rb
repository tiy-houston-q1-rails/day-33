class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :title
      t.text :bio
      t.string :twitter
      t.string :facebook
      t.string :last_job_title
      t.text :last_job_description

      t.timestamps null: false
    end
  end
end
