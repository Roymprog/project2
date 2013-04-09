<h1>Project2</h1>

<h2>Titel: UvA Courses Mall</h2>

<h3>Summary:</h3>
A web application that lets students look for, but also 'subscribe' to courses

<h3>Features:</h3>
  - Designed for smartphone use with resolution between 320x480 and 760 x 1280
  - Divide courses in departments i.e. Institute
  - Users may search courses through; catalog number, title, description, instructor, institute, EC, blok(1-6)
  - Course information to display: catalog number, submission code, study code, titles, institute, EC, descriptions, staff, maximum amount 
  of participants, semester/blok and programmes
  "Courses I'm taking" page contains links to 3 other screens: "Search Courses", "Bookmarked courses" and "Recently viewed Courses"
  - The "Courses I'm taking" page should display all subscribed courses and allow the user to delete selected courses. 
  "Search Courses" should allow all the searching features mentioned above displaying 20 per page. Selecting them will add
  them to the "Courses I'm taking" page
  - The "Recently viewed Courses" page should show all viewed courses visited the past 7 days
  - In the "Search Courses" section there should be a 'bookmark' option to remember courses even after current session
  "Bookmarked Courses" displays all bookmarked courses and allows the user to remove 'bookmarked' courses (20 per page)
  
<h3>Framework/ languages/ libraries and other technical stuff:</h3>
  - The courses library used will be courses.xml, which will be stored in mySQL library
  - The users will also be stored in mySQL library(maybe couple users and courses?)
  - The app will be made with html5, JavaScript and Ruby
  - The app will feature jQuery(Mobile jQuery for smart phone users)
  - The process will be uploaded to GitHub

<h3>Models:</h3>

**Class course:**

  - :Name
  - :Institute 
  - :Catalog_number
  - :EC
  - :Staff 
  - :Maximum
  - :Blok (semester en blok in een, 1 - 6)
  - :Description
  - :Programme

`has_and_belongs_to_many :staffs`
<br>
`has_and_belongs_to_many :programmes`

The course list will be stored locally as lists on the device of the user. The list will be stored three 
times. Once for the "Courses I'm taking", for "Bookmarked courses" and for "Recently viewed courses". The local
storing will be done by javascript. Deletion of 'Bookmarked courses' and 'Courses I'm taking' will also be 
handled by javascript.

**Class staff:**

 -  :Name
 -  :url

`has_and_belongs_to_many :courses`

**Class programme:**

  - :name
  - :url

`has_and_belongs_to_many :courses`


<h3>Controllers: </h3>

**course:**

- def show
- def bookmark
- def search

<h3>Display:</h3>
<a href="https://github.com/Roymprog/project2/tree/master/doc/Screen display/Courses_I'm_taking (1).png"</a>

![Courses I'm taking](https://github.com/Roymprog/project2/tree/master/doc/Screen display/Courses_I'm_taking (1).png)
![Bookmarked courses](https://github.com/Roymprog/project2/tree/master/doc/Screen display/Bookmarked_courses (2).png)
![Search courses](https://github.com/Roymprog/project2/tree/master/doc/Screen display/Search_courses (3).png)
![Recently viewed courses](https://github.com/Roymprog/project2/tree/master/doc/Screen display/   Recently_viewed_Courses (4).png)
![Search results](https://github.com/Roymprog/project2/tree/master/doc/Screen display/Search_results (5).png)
![Selected course](https://github.com/Roymprog/project2/tree/master/doc/Screen display/Selected_course (6).png)

