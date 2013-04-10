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
	
	Course.create(:catalog_number => course.xpath("@sgid").text,
		 		  :name => course.xpath("name").text,
				  :ec => course.xpath("ects").text,
				  :blok => course.xpath("period").text,
				  :institute => course.xpath("institute").text,
				  :description => course.xpath("description").text,
				  :maximum => course.xpath("participant_count").text)
	Staff.find_or_create(:name => course.xpath("staff_list/staff/name"),
				         :url => course.xpath("staff_list/staff/url"))
	Programme.find_or_create(:name => course.xpath("programmes/programme/name"),
					         :url => course.xpath("programmes/programme/url"))
	puts course.xpath("name").text 
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
