# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


f = File.open("course.xml")
@doc = Nokogiri::XML(f)
@doc.xpath("/courses/course").each do |course|
	
	c = Course.create(:catalog_number => course.xpath("@sgid").text.strip,
		 		  	  :name => course.xpath("name").text.strip,
					  :ec => course.xpath("ects").text.strip,
					  :period => course.xpath("period").text.strip.downcase,
					  :blok => course.xpath("period").text.strip.gsub(/Semester 1/, '').gsub(/Semester 2/, '').gsub(/[c]/, '').gsub(/and/, 'en').downcase,
					  :institute => course.xpath("institute").text.strip,
					  :description => course.xpath("description").text.strip.gsub(/<.>/,'').gsub(/<\/.>/, '').gsub(/<..\/>/, ''),
					  :maximum => course.xpath("participant_count").text.strip.gsub(/<.>/,'').gsub(/<\/.>/, ''))
	course.xpath("staff_list/staff").each do |staff|
	c.staffs << Staff.find_or_create_by_name_and_url(:name => staff.xpath("name").text.strip,
				         	 :url => staff.xpath("url").text.strip)
	end
	course.xpath("programmes/programme").each do |programme|
	c.programmes << Programme.find_or_create_by_name_and_url(:name => programme.xpath("name").text.strip,
					         		 :url => programme.xpath("url").text.strip)
	end
	
end
	
f.close
