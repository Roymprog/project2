roject2

App Studio Project 2

Titel: UvA Courses Mall

Summary: A web application that lets students look for, but also 'subscribe' to courses

Features:
  - Designed for smartphone use with resolution between 320x480 and 760 x 1280
  - Divide courses in departments i.e. Institute
  - Users may search courses through; catalog number, title, description, instructor, institute, EC
  - Course information to display: catalog number, submission code, study code, titles, institute, EC, descriptions, staff, maximum amount 
  of participants, semester/blok and programmes
  - Contains "register" and "log in" page redirecting to "Courses I'm taking" screen upon succes
  "Courses I'm taking" page contains links to 3 other screens: "Search Courses", "Bookmarked courses" and "Recently viewed Courses"
  - The "Courses I'm taking" page should display all subscribed courses and allow the user to delete selected courses. 
  "Search Courses" should allow all the searching features mentioned 5 lines above and select them, adding them to the "Courses I'm taking" page
  - The "Recently viewed Courses" page should show all viewed courses visited this session
  - In the "Search Courses" section there should be a 'bookmark' option to remember courses even after current session
  "Bookmarked Courses" displays all bookmarked courses and allows the user to remove 'bookmarked' courses
  
Framework/ languages/ libraries and other technical stuff:
  - The courses library used will be courses.xml, which will be stored in mySQL library
  - The users will also be stored in mySQL library(maybe couple users and courses?)
  - The app will be made with html5, JavaScript and Ruby
  - The app will feature jQuery(Mobile jQuery for smart phone users)
  - The process will be uploaded to GitHub

Models:

Class course :

  :Course_name
  :Institute 
  :Catalog_number
  :EC
  :Staff 
  :Max_population
  :Semester
  :Blok
  :Description
  :Programme

has_many :staffs
has_many :programmes

The course list will be stored locally on the device of the user. The list will be stored three times. 
Once for the "Courses I'm taking", for "Bookmarked courses" and for "Recently viewed courses".

Class staff:

  :Name
  :url

belongs_to :course

Class programme:

  :name
  :url

belongs_to :course
