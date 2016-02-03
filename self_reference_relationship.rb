# How to self reference a model twice?
# For example, we have a Person model, each person has a parent. Now we want to use .children to list all children of a record and .grandchildren to list all grandchildren of a person.
# irb> john = Person.create(name: 'Johnny')
# irb> jim  = Person.create(name: 'Jimmy', parent: john)
# irb> nany = Person.create(name: 'Nanny', parent: john)
# irb> john.children.pluck(:name)
# irb> => ["Jimmy", "Nanny"]

# first we run => $ rails g model Person name:string parent_id:integer

# we get the following migration 
class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :parent_id, index: true

      t.timestamps null: false
    end
  end
end

# add index: true to parent_id because it'll be queried a lot

# Person model

class Person < ActiveRecord::Base
  belongs_to :parent, class_name: Person
  has_many :children, class_name: Person, foreign_key: :parent_id
end

# To get the following result
#
# irb> lele = Person.create(name: 'Lele', parent: jim)
# irb> john.grandchildren.pluck(:name)
# irb> => ["Lele"]

# The person model will be as follow

class Person < ActiveRecord::Base
  belongs_to :parent, class_name: Person
  has_many :children, class_name: Person, foreign_key: :parent_id
  has_many :grandchildren, class_name: Person, through: :children, source: :children
end