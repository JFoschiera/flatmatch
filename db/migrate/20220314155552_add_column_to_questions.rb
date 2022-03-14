class AddColumnToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :answer_description, :text
  end
end
