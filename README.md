# README

#### R7 	Identification of the problem you are trying to solve by building this particular marketplace app.
The problem is that Players and Gamemasters often don't have people to play with in person and other want to enjoy the hobby but don't have available friends. Having an online place to find other players and set up game sessions with them is very useful.

---

#### R8 	Why is it a problem that needs solving?
People without social contact can become depressed or they don't have other hobbies to get into. Another side is that TTRPG's is a market that is only just opening up and many people are willing to pay a lot of money just to play or have a good experience within the game.

---

#### R9 	A link (URL) to your deployed app (i.e. website)
[gmfinder](https://infinite-castle-41167.herokuapp.com/games/45)

---

#### R10 	A link to your GitHub repository (repo).
[git gmfinder](https://github.com/Chrystoff/gmfinder)

---

#### R11 	Description of your marketplace app (website), including:
  ![sitemap](/docs/gmfinder_sitemap.png)
- Screenshots
  ![](/docs/sessions_index.png)
  ![](/docs/show_screen.png)
  ![](/docs/edit_screen.png)

The purpose of this app is to create profiles as a player or as a gamemaster and set up sessions to play with other people with. The functionality is making sessions on a db with times and information that players can join and then meet up to play. The target audience is hobbyists of Tabletop Roleplaying Games, who's ages range from young to old, but the web app would only appeal to more online oriented hobbyists.
The tech stack of this web app is, Ruby on rails, ruby, HTML, CSS, Heroku, SQLite, postgresql, Cloudinary (major gems include: devise, pundit and rolify).

---

#### R12 	User stories for your app
[user Story](https://trello.com/b/sSKbPC0s/web-app)
![user story](/docs/gmfinder_userstory.png)

---

#### R13 	Wireframes for your app
![](/docs/wireframe1.png)
![](/docs/wireframe2.png)
![](/docs/wireframe3.png)

---

#### R14 	An ERD for your app
![ERD](/docs/gmfinder_erd.png)

---

#### R15 	Explain the different high-level components (abstractions) in your app
The High level components in my app are the Game, Gamemaster, Player and Session. Each of these act with eachother, the session relies on all other models for creation as it ties all the models together. They all contain various validations for creation. The Game is necessary to the app to hold data on the Game being used in the session. 

The Gamemaster is important to see who the gamemaster will be for that session, and the Player model is handy to know which players are going to be in the session, each model has it's own details so someone looking at a single session can get an understanding of the session and all it's contents to decide whether or not to join the session themselves! The session model also Brings them all together. Each Model has a one to many relationship with session, except player which is many to many.

---

#### R16 	Detail any third party services that your app will use
Cloudinary is a third party service my app uses, it is used for user image or file storage within the models. Heroku is another which is used for hosting the app itself. 

---

#### R17 	Describe your projects models in terms of the relationships (active record associations) they have with each other
I'll start with each model having or needing a 'has_one_attached' for the file/image that could be added to the model.

Game, Player and Gamemaster all connect to the Session with a has_many, this is because each session that gets made will use each of them for representation. They're all required because you can't have a session exist without a game to play, a gamemaster to run that game and players to play it. 

I went through a few iterations before ending up on this. The session was originally just to connect gamemaster and game with the MVC pre-req of a many-to-many. If I was to edit it again i'd make a new model between session and player to properly have many to many their.

---

#### R18 	Discuss the database relations to be implemented in your application
The relations to be implemented in my application are mostly one-to-many and one many to many which will have to be converted because of SQL requirements of needing a join table.

---

#### R19 	Provide your database schema design


---

#### R20 	Describe the way tasks are allocated and tracked in your project
I usually have a series of post-it notes which i use in a similar fashion to the trello board! but This project the trello board did a great job and I hope it only becomes easier.

The way I use the tasks on my trello board is just having all the tasks seperated by catergorised lists (ie: needed, completed and optional) and complete one at a time until they're done. I then move those completed tasks into the completed list. I'd like to be more involved with trello but I feel it is only as good as the complexity of your app, if the app is more complex I'll put more time into trello prep, if not then simpler planning is all that's necessary! which explains why companies/developers use trello to such a large extent because it does look to get pretty damn complex!