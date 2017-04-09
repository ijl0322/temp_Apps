# The Polar Adventure

The Polar Adventure is an interacitve story book designed to run on iPads. 
It is a heart warming story about a lost, lonely penguin befriending a shark, and the two continue on a fun adventure. 

## Technologies

The Polar Adventure was designed to display nicely on all iPads. Since there are a lot of very precise animations, it is difficult to use stackview/ autolayout. For this project, everything is dynamically sized and positioned depending on the user's screen size. 

For instance, the iceberg in the story book is never stretched to fit the screen. It's width is always the same as the screen's width. Using this technique, the image will most likely not fill the entire screen, so another image (of the sky and ocean of the exactly same color as the iceberg's background) is stretched to fill the screen, giving an illusion that it is the same image. 


