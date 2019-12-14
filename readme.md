# Thanks for taking the time to read me! 

## Tasks
**Below are listed the tasks that I believe were part of this assignment respective to the numeric value of each prompt.**

1. Create a networking layer that is able to receive easy updating in the future
2. Extend the Image class to allow for loading an image into a UIImageView easily
	* Add an image to the DealCell view file
	* Add an image value to the DealCell class
	* Be sure to have set good constraints
3. Come up with a user-friendly design for filters that do not take too much real estate
	* Sorting should be fast and tidy
	* Should allow for future extension (see prompt /#4)
	* Prices in the API can come in an irregular format, the values must be cleaned to allow for sorting
4. Allow user to input custom information (only allowing numerical input) and filter within those bounds
	* Real estate must be taken into consideration
	* A decision needs to be made as to whether this will live-update while the user types or not
	* The sorting functions must be written in such a way to allow for input
5. User Defaults or Core Data must be used to acheive persisting data
	* I will go with User Defaults for the following reasons: User Defaults may not be as efficient as Core Data but using UD is fine when storing tiny amounts of data, whereas Core Data is much better for storing larger amounts of data -> Core Data would be overkill for what seemingly should be one data field.
6. All constraints for any UI must correctly follow auto layout to allow for seemless screen orientation transitions
	* No hard-coded values are to be used
	* No manipulating based on view sizes, strictly use height & width constraints
7. Have a field that is updated each time the table view is updated. This is a good opportunity to use RxSwift, but it is most likely not necessary since it is a single field. If this were a larger project with many of these data points that rely on each other in new View Controllers then I would strongly consider RxSwift for the project. 
8. Allow for data models to have some optionals and handle any missing data in an accomodating way. 
	* Users do not want to see blanks

## Work Logs

**Below are the listed dates & times I worked on this project including the time to make this readme**

* Thursday, December 12th 2019 07:00pm -> Thursday, December 12th 2019 11:00pm
	* Planning, Discovery, Networking, Image processing
* Friday, December 13th 2019 02:30pm -> Friday, December 13th 2019 06:25pm
	* Sorting, Data Restructuring, User Defaults, Project Cleaning
* **Total Hours:** 7:55

## Follow Up Questions

**Below are my answers to the follow up questions.**

1. Did you finish all the work? If not, why?
	* No, I did not. I was not able to finish the custom user entered price sorting (aka: Number 4). The reason I have chosen not to pursue it with the last of the time I have is that I feel I would not have been able to come up with a nicely fitting UI without going over. At least one that did not take up too much real estate (especially for landscape) and therefore I chose to leave it out of the assignment. I wish to remain honest with this assignment and not go over the given time. 
2. Did you make any changes to the provided code? If so, what? 
	* Yes, I made a few.
	* I changed the structure of the code to be a little bit more friendly, separating Models, Controllers & Views into their own groups and changing the name of the ViewController class to MainViewController
	* I also changed the definition of the DealSummary model to allow for storing of the price raw strings to display to the users as well as a calculated price value to be used during sorting. I added to the DealSummary a field for image URL and score as well. This way I only needed to calculate the score once and store the information rather than calculate it during sorting time. 
	* I changed the TableViewCell view to include an imageView and re-assigned constraints to all elements in that view.
3. How would you add additional sorting orders based on the feedback from the Product Team? 
	* I would definitely need to change the UI that allows users to choose how they want to sort.
	* Once the UI is changed I would map each value to a developer agreed upon data field and do one of two things.
		1. Write out new sorting code for each data field value OR
		2. Write a generic sorting function that allows for sorting based on any field of the data model. (I should have done this in my answer to this assignment, there would have been enough time. Such is the power of hindsight, I suppose :] )
4. Provide a Retrospective on the following information: 
	1. What do you think you did well?
		* I think I did well with handling the asynchronous nature of the networking along with parsing values that may or may not be there. I also think that for the time I did well with coming up with on-the-fly UI. I had to go through a few iterations before settling on the UI I have now and I'm okay with it. 
	2. What do you think you did not too well?
		* I think that my code structure & architectural decisions could have been done/made better with more time. I think that for the scope of the project I did just fine, but if this needed to be improved upon I feel like I'd want to spread things out a little more and make use of POP - which I did not do for this project. I also think my UI could have been a little prettier. But as mentioned before I could have built out the sorting function to be more generic and I definitely could have done the same with the Networking layer as well. Also, I was not able to set a default image for data that came in without an image even though I wanted to and spent some time on it. 
	3. If you were to take this test a second time, what would you do differently? 
		* I would build out a more sophisticated **networking** layer to allow me to set the image default & send generic requests. I would improve the architecture to use POP principles from the start. I would also choose a more friendly UI for the sorting that would allow me to add the custom sorting without much worry for appearance. 
5. Do you feel this test accurately evaluated your abilities? Why or why not? 
	* I feel that this test semi-accurately evaluated my abilities. I spent some time trying some things out that would normally be given to me by a product design team. But, in general, I think this more or less shows my skills accurately. I do well in a peer-review environment and would make different decisions if I kenw it were a bigger project and if I had more time. But now, only time will tell :) 

