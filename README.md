# InfoShuttle by Brandon

This is a [breakable toy](http://chimera.labs.oreilly.com/books/1234000001813/ch05.html#breakable_toys) created during my [Bloc apprenticeship](http://bloc.io). This is the second rails app that I have created on my own from a list of requirements (compared to following along tutorial style).

This app lives at [infoshuttle.bayer.ws](http://infoshuttle.bayer.ws)

## Features

### Definitions

* **Wiki:** a collection of related pages with common collaborators
* **Anyone:** anyone :)
* **Registered user:** someone who has authenticated via Twitter
* **Owner:** the user who creates a private wiki
* **Collaborator:** a user who can edit the wiki

### Public Wiki

* **Anyone** can view
* All **registered users** are **collaborators**

### Private Wiki

* Has one **owner** who manages **collaborators** (none by default)
* Only **collaborators** can view and edit
* [FUTURE]: **Owner** can allow **anyone** to view

### Registered User

* Has own public wiki by default that's seeded with helpful content and suggestions
* Can create new public wikis

### Premium User

* Can make their own user wiki private
* Can create new private wikis
