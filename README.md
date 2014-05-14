# HipChat API Lab

We're building an app that allows "poking" people through HipChat, either publicly or as a private message. Everything is already done in this repository, except for the actual HipChat integration.

## Step One

If I choose a public poke (the default), the app should message the WDI off-topic channel like so:

```
@TargetUser got poked by AuthorLine: http://localhost:3000/pokes/1
```

If I choose a private poke, the app should send a private message to the target user like so:

```
You got poked by AuthorLine: http://localhost:3000/pokes/1
```

Note that URLs should be clickable, and the @-mention for public pokes should be a "real" mention that causes a notification for the user.

## Step Two

Replace the "Target" text input with a dropdown containing the usernames of everyone currently in the WDI off-topic channel.
