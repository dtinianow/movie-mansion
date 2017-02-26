class CreateAuditoria < ActiveRecord::Migration[5.0]
  def change
    create_table :auditoria do |t|
      t.text :title
      t.integer :capacity

      t.timestamps
    end
  end
end
