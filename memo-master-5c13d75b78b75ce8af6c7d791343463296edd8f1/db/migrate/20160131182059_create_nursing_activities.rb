class CreateNursingActivities < ActiveRecord::Migration
  def change
    create_table :nursing_activities do |t|

      t.timestamps null: false
    end
  end
end
