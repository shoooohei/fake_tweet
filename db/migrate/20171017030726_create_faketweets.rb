class CreateFaketweets < ActiveRecord::Migration[5.1]
  def change
    create_table :faketweets do |t|
      t.text :content

      t.timestamps
    end
  end
end
