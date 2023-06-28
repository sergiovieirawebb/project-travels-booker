class CreateStops < Jennifer::Migration::Base
  def up
    create_table :stops do |t|
      t.bigint :id, {:primary => true, :auto_increment => true}
      t.reference :travel
      t.bigint :stop, {:null => false}
      t.timestamps
    end
  end

  def down
    drop_table :stops if table_exists? :stops
  end
end
