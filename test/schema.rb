ActiveRecord::Schema.define(version: 1) do
  create_table :users do |t|
    t.string :identifier
    t.string :uuid
  end
end
