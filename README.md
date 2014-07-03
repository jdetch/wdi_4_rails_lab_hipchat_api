# HipChat API Lab

We're building an app that allows "poking" people through HipChat, either publicly or as a private message. Everything is already done in this repository, except for the actual HipChat integration. We'll be using the dedicated "PokeChat" channel, which you should have access to, to avoid spamming the off-topic channel.

## Setup

* APIs often, but not always, require a "key" or credentials of some kind to access. Search around to find the documentation for the HipChat API, and find out how you can obtain an API key.
* Third parties, or sometimes first parties, often write Ruby gems to interact with popular APIs in a friendlier way than issuing plain HTTP requests. Search [RubyGems](http://rubygems.org/) for a HipChat gem you could use &ndash; the results are sorted by number of downloads, which is a decent indicator of popularity.
* It would be a *very* bad idea to commit our secret API key to a public GitHub repository. Therefore, we need a way to hide the key from Git, but still make it accessible from our app. The [dotenv-rails](https://github.com/bkeepers/dotenv) gem allows us to define secret keys in a `.env` file in the root of our project (which we must add to our `.gitignore`), and makes those keys accessible through the `ENV` constant anywhere in our app.

## Step One

Implement public pokes. If the user leaves the "private" checkbox on the form unchecked, the app should message the PokeChat channel using the info submitted like so:

```
@TargetUser got poked by AuthorLine: http://localhost:3000/pokes/1
```

Note the URL should be clickable and the @-mention should notify the target user.

## Step Two

Replace the "Target" text input with a dropdown containing the mention names of everyone currently in the PokeChat channel.

## Step Three

Implement private pokes. If the user checks the "private" checkbox on the form, the app should send a private message to the target user using the info submitted like so:

```
You got poked by AuthorLine: http://localhost:3000/pokes/1
```

Note that private messages can only be sent by user ID, not mention name, so you will need to implement a mention-name-to-user-ID lookup.
