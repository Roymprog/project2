class CoursesProgrammes < ActiveRecord::Migration
  def change
  	create_table :courses_programmes, :id => false do |t|
  		t.references :course
  		t.references :programme
  	end
  add_index(:courses_programmes, [:course_id, :programme_id], :uniq => true)
  end
end
