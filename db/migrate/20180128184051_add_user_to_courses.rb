class AddUserToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :user, index: true, foreign_key: true
  end
end
