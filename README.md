# InfoShuttle by Brandon

This is a [breakable toy](http://chimera.labs.oreilly.com/books/1234000001813/ch05.html#breakable_toys) created during my [Bloc apprenticeship](http://bloc.io). This is the second rails app that I have created on my own from a list of requirements (compared to following along tutorial style).

This app lives at [infoshuttle.bayer.ws](http://infoshuttle.bayer.ws)

## Features

### Definitions

* **Wiki:** a collection of related pages with common collaborators
* **Anyone:** anyone :]
* **Registered user:** a user who has authenticated via Twitter
* **Premium User:** a user who pays :]
* **Owner:** the user who created a wiki
* **Collaborator:** a user who can edit the wiki

### Public Wiki

* **Anyone** can view
* All **registered users** are **collaborators**
* Has one **owner** who can convert it to a public wiki if they are a **premium user**.

### Private Wiki

* Has one **owner** who manages **collaborators** (none by default)
* Only **collaborators** can view and edit
* [FUTURE]: **Owner** can allow **anyone** to view

### Registered User

* Can create new public wikis

### Premium User

* Can create new private wikis
* Can make their public wikis private
