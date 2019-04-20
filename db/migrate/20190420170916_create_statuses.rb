class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.belongs_to :status, index: true
      t.timestamps
    end
    create_table :services do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    create_table :work_shops do |t|
      t.string :name
      t.string :ubication
      t.string :owner

      t.timestamps
    end
    create_table :operators do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.float :rate
      t.string :national_id
      t.belongs_to :status, index: true
      t.belongs_to :workshop, index: true
      t.belongs_to :service,index: true
      t.timestamps
    end
    create_table :booking_statuses do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    create_table :bookings do |t|
      t.datetime :accepted_at
      t.datetime :cancelled_at
      t.datetime :finish_at
      t.float :rate
      t.string :comment_rate
      t.belongs_to :booking_status, index: true
      t.belongs_to :service, index: true
      t.belongs_to :user, index: true
      t.belongs_to :operator, index: true
      t.timestamps
    end

  end
end
