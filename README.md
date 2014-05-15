# HipChat API Lab

We're building an app that allows "poking" people through HipChat, either publicly or as a private message. Everything is already done in this repository, except for the actual HipChat integration.

## Step One

Implement public pokes. If the user leaves the "private" checkbox on the form unchecked, the app should message the WDI off-topic channel using the info submitted like so:

```
@TargetUser got poked by AuthorLine: http://localhost:3000/pokes/1
```

Note the URL should be clickable and the @-mention should notify the target user.

## Step Two

Replace the "Target" text input with a dropdown containing the mention names of everyone currently in the WDI off-topic channel.

## Step Three

Implement private pokes. If the user checks the "private" checkbox on the form, the app should send a private message to the target user using the info submitted like so:

```
You got poked by AuthorLine: http://localhost:3000/pokes/1
```

Note that private messages can only be sent by user ID, not mention name, so you will need to implement a mention-name-to-user-ID lookup.
