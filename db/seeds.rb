# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


f = File.open("courses.xml")
@doc = Nokogiri::XML(f)
@doc.xpath("/courses/course").each do |course|
	
	c = Course.create(:catalog_number => course.xpath("@sgid").text.strip,
		 		  	  :name => course.xpath("name").text.strip,
					  :ec => course.xpath("ects").text.strip,
					  :blok => course.xpath("period").text.strip,
					  :institute => course.xpath("institute").text.strip,
					  :description => course.xpath("description").text.strip,
					  :maximum => course.xpath("participant_count").text.strip)
	course.xpath("staff_list/staff").each do |staff|
	c.staffs << Staff.create(:name => staff.xpath("name").text.strip,
				         	 :url => staff.xpath("url").text.strip)
	end
	course.xpath("programmes/programme").each do |programme|
	c.programmes << Programme.create(:name => course.xpath("name").text.strip,
					         		 :url => course.xpath("url").text.strip)
	end
	
end
	
#@doc.xpath("/courses/course/institute").each do |filldb|
#	Course.create(:institute => filldb.text)
#end

#i = 1
#xml = @doc.xpath("/courses/course").each do |filldb|
#	xml.xpath("@sgid")
#	Course.update(i, :catalog_number => filldb.text)
#	i = i + 1
#end
f.close
