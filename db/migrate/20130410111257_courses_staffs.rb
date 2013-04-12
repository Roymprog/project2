class CoursesStaffs < ActiveRecord::Migration
  def change
  	create_table :courses_staffs, :id => false do |t|
  		t.references :course
  		t.references :staff
  	end
  add_index(:courses_staffs, [:course_id, :staff_id], :uniq => true)
  end
end

