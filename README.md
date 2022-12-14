# Monitor Links

## Developed by

[Laisy C. F. S.](https://github.com/laisy)

## About the project

	Monitor Links is an application that was conceived as a step in the selection process.

### Project features

	It consists of a web application with 2 routes:
	- /links
	- /screenshots

	In the links route it will be possible to register links to be "monitored", listed or removed.
	Each URL registered will be a job to be executed in the worker every 1 minute. The worker needs to receive the URL, enter the page with a webdriver and print the home.
	The /screenshots route will display the screenshots taken with date,
	separated by link sorted by descending date.
	Need:
	- be versioned
	- follow a code pattern
	- Basic README with installation
	Note:
	- Use the technology you want and how you prefer
	- selenium documentation: https://www.selenium.dev/documentation/en/
	- test with Cat As A Service *_* cataas.com/cat

## Technologies

	Technologies that I used to develop this api

	- Ruby ON Rails
	- sqlite3
	- postgreSQL
	- Heroku
	- selenium
	- Shrine
	
## Difficulties found

	During the "Monitor Links" development process, I tested some options to generate the image link after saving it by Selinium, options were: gcloud and AWS.
	I chose to use Heroku, because in addition to being easier and more practical to visualize the system, errors also arose when implementing docker.

## Funcionamento

	The start screen has the Links list and show, edit and destroy options.
	The New link button, to create new links.
	The Init Monitor button has the function of starting the selenium monitor, which will loop the links, open the browser with Selenium, take the Screenshot and save the image in the database.

## Pendente
 	- JOB running every 1 minute		
## URL heroku

To view the web client, click here: https://monitor-links.herokuapp.com/

