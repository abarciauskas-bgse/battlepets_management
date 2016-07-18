# Design

## Principles

* KISS
    * Only implement resources which are required by spec
* Don't create constraints or functionality where there is not yet a business case for them
    * In this instance, I create the business case outside of the specification, so there are really no constraints
    * Reasonable constraints are maintained where they are necessary for application logic (e.g. can't have multiple pets of the same name)

## Resources

### Pets

All pets have an initial set of actions (as seeded by app) having different possible forces and ante-forces.

#### Pet Resource Representation

```json
{
    "name": "Totoro",
    "traits": {
        "wit": 25,
        "strength": 25,
        "agility": 25,
        "senses": 25
    }
}
```

#### Pet Resource Attributes

_Persistent Characteristics_

Pets will have default traits if traits are not specified upon creation. To keep things socialist, during app initialization a limit may be specified so that pets cannot have arbitrarily high traits.

* `name`
* `traits`: one or more attributes having a numeric value.

_[v2]_

* `animal`: different default attributes
* `health`: numerical value (range initiated by app), decreases during battle, increases time spent way from battle plus feeding
* `actions`: set of battle actions the pet is capable of, e.g. spelling, kicking and punchting
* `moves`: set of battle moves the pet is capable of, e.g. walking, running
* `special_actionz`: initially none, may become karate chopping or fireballing, etc.
* `special_movez`: initially none, but may become swimming, jumping, flying, etc.

#### Pet Resource Actions

**`POST /pets`**

Request:

* Required parameters: none
* Optional parameters: `name, animal, wit, strength, agility, senses`

Response:

* Successful Response:
    * HTTP Resonse Status: 201
    * HTTP Resonse Body: _See Pet Resource Representation_

**`GET /pets/:name`**

_Returns the representation of the pet with :name_

Request:

* Required parameters: `:name`
* Optional parameters: none

Response:

* Successful Response:
    * HTTP Resonse Status: 200
    * HTTP Resonse Body: _See Pet Resource Representation_

* `PATCH /pets/:name`: updates to health, experience, or skills

Request:

* Required parameters: `:name`

Response:

* Successful Response:
    * HTTP Resonse Status: 204
    * HTTP Resonse Body: No Content
    * HTTP Response Headers:
        * Content-Location `/pets/:name`


____

_[v2]_

**Resource Actions**

**`GET /pets`**

_Returns a list of all existing pets_

* Required parameters: none
* Successful Response:
    * HTTP Status: 200
    ```json
    ```

* `PUT,DELETE /pets/:name`


### _[v2]_ Battle Actions

**Resource Attributes**

* `name`: Name for action, e.g.: `kick, punch, shield, karate chop` etc.
* `force`: positive or negative value. (e.g. offensive or defensive)
    * If positive, indicates a defensive action which reduces impact of opponents action.
    * If negative, indicates an offensive action impacting opponents health.

Possible actions are seeded during app initiation.

### _[v2]_ Battle ActionsBattle Moves

* `type`: step, jump, leap, run, swim
* `direction`
* `force`

Possible moves are seeded during app initiation.

## Ideas

### Technical implementation

* use a pet builder
* error on unpermitted attributes?

### Features

[Inspired by Tamagotchi](https://en.wikipedia.org/wiki/Tamagotchi)

* Lifecycle - having an age that progresses in real time such that younger and older pets are weaker than adult pets
* Marriage and procreation

My ideas

* pets can have superpowers - perhaps only if the user is a power user
* should there be functionality to clone existing pets? Say a user wants to battle the same pet by creating a duplicate of it.
* train a pet builds actions and moves, but only when healthy

