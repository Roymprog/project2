// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require_tree .

function submit_bookmark_form(){
	$('#bookmarked_courses').val(localStorage.getItem("bookmark"));
	$("#bookmarked_courses").submit();
}

function submit_taking_form(){
	$('#taking_courses').val(localStorage.getItem("taking"));
	$("#taking_courses").submit();
}

function submit_recent_form(){
		$('#recent_courses').val(localStorage.getItem("recent"));
		$("#recent_courses").submit();
}

function destroy_bookmarked(course_id){
    console.info("1");
	var array = JSON.parse(localStorage.getItem("bookmark"));
    var i = 0;
    while(JSON.stringify(array[i].id).replace(/['"]/g,'') != course_id) 
    {  
      i += 1;
    }
    var deleted_course_id = i;
    while(array[i])
    {
    	i += 1;
    }
    i -= 1;
    alert("You have deleted " + JSON.stringify(array[deleted_course_id].name) + "");
    array[deleted_course_id] = array[i];
    array.pop(i);
    localStorage.setItem("bookmark", JSON.stringify(array));
	window.location.reload();
}   

function destroy_taking(course_id){
	var array = JSON.parse(localStorage.getItem("taking"));
    var i = 0;
    while(JSON.stringify(array[i].id).replace(/['"]/g,'') != course_id) 
    {  
      i += 1;
    }
    var deleted_course_id = i;
    while(array[i])
    {
    	i += 1;
    }
    i -= 1;
    alert("You have deleted " + JSON.stringify(array[deleted_course_id].name) + "");
    array[deleted_course_id] = array[i];
    array.pop(i);
    localStorage.setItem("taking", JSON.stringify(array));
	window.location.reload();
}  

function subscribe_bookmarked(course_id){
	// grabs array stored in "bookmark" in local storage
	var bookmark_array = JSON.parse(localStorage.getItem("bookmark"));
    var i = 0;

    // checks the whole array for the index of the right course
    while(JSON.stringify(bookmark_array[i].id).replace(/['"]/g,'') != course_id) 
    {  
      i += 1;
    }
    // remember id of subscribed course
    var subscribed_course_id = i;

    // fills new object for the "taking" courses database
    taking 	   =	new Object();
    taking.name    = 	JSON.stringify(bookmark_array[i].name).replace(/['"]/g,'');
    taking.id 	   =	JSON.stringify(bookmark_array[i].id).replace(/['"]/g,'');
    taking.credits = 	JSON.stringify(bookmark_array[i].credits).replace(/['"]/g,'');
    
    // grabs the array of "taking" courses
    var taking_array = JSON.parse(localStorage.getItem("taking"));
    // makes new array if there is no courses
    if(!taking_array)
    {
      taking_array = new Array();
    }

    // searches array for empty spot and checks if course is not already present
    i = 0;
    while (taking_array[i] && (JSON.stringify(taking_array[i]) != JSON.stringify(taking))) 
    {  
      i += 1;
    }

    // checks if empty spot or same course was found
    if (JSON.stringify(taking_array[i]) != JSON.stringify(taking))
    {
      // puts new object at the empty spot
      taking_array[i] = taking;
      
      // sets new array in local storage
      localStorage.setItem("taking", JSON.stringify(taking_array));
   	  
   	  // delete subscribed course from bookmarked
      i = subscribed_course_id;

      // looks for empty spot in array
      while(bookmark_array[i])
      {
      	i += 1;
      }
      
      // moves index to last occupied spot
      i -= 1;

      // copies last object to subscribed object's place
      bookmark_array[subscribed_course_id] = bookmark_array[i];

      // deletes last object from list
      bookmark_array.pop(i);

      // sets new array in local storage
      localStorage.setItem("bookmark", JSON.stringify(bookmark_array));

      // alerts user that subscription was succesful
	  alert("You have subscribed to " + JSON.stringify(taking.name) + "");
	}
	// alerts user that course has already been subscribed to and keeps it at bookmarked courses
    else
    {
      alert("Failed to subscribe to " + JSON.stringify(taking.name) + ". Course already taken");
    }
	window.location.reload();
}

function take(name, ec, id){
	taking = new Object();
	taking.name = name;
	taking.credits = ec;
	taking.id = id;

	var array = JSON.parse(localStorage.getItem("taking"));
	if(!array)
	{
	  array = new Array();
	}
	var i = 0;
	while (array[i] && (JSON.stringify(array[i]) != JSON.stringify(taking))) 
	{  
	  i += 1;
	}
	if (JSON.stringify(array[i]) != JSON.stringify(taking))
	{
	  array[i] = taking;
	  localStorage.setItem("taking", JSON.stringify(array));
	  alert("You have subscribed to " + JSON.stringify(taking.name) + "");
	}
	else
	{
	  alert("Failed to subscribe to " + JSON.stringify(taking.name) + ". Course already taken");
	}
}
function bookmark(name, ec, id){ 
	bookmarked = new Object();
	bookmarked.name = name;
	bookmarked.credits = ec;
	bookmarked.id = id;
	
	var array = JSON.parse(localStorage.getItem("bookmark"));
	if(!array)
	{
	  array = new Array();
	}
	var i = 0;
	while (array[i] && (JSON.stringify(array[i]) != JSON.stringify(bookmarked))) 
	{  
	  i += 1;
	}
	if (JSON.stringify(array[i]) != JSON.stringify(bookmarked))
	{
	  array[i] = bookmarked;
	  localStorage.setItem("bookmark", JSON.stringify(array));
	  alert("You have bookmarked " + JSON.stringify(bookmarked.name) + "");
	}
	else
	{
	  alert("Failed to bookmark to " + JSON.stringify(bookmarked.name) + ". Course already bookmarked");
	}
}

