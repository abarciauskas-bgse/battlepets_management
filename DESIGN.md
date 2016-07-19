# Design

KISS (Keep It Simple Stupid): The API is simple, while adding flexibility where there is easily a use case for additional configurability requried clients. For example, if left unspecified, battlepet traits default to those listed by the original spec: wit, senses, strength, agility. But they are dynamically assigned to be any name / value pair as indicated by the client.

# Resources

## BattlePets

All pets have an initial set of actions (as seeded by app) having different possible forces and ante-forces.

#### BattlePet Resource Representation

```json
{
    "name": "Hamtaro",
    "serialized_traits": [{
        "name": "wit",
        "value": 70
    }, {
        "name": "strength",
        "value": 30
    }]
}
```

#### BattlePet Resource Attributes

_Persistent Characteristics_

Pets will have default traits if traits are not specified upon creation. To keep things socialist, during app initialization a limit may be specified so that pets cannot have arbitrarily high traits.

* `name`
* `traits`: one or more attributes having a numeric value.

#### BattlePet Resource Actions

**`POST /battle_pets`**

_Creates a new battle pet. If no traits are specified, a set of defaults will be configured as determined by `/config/default_attributes.rb`._

Request:

* Required parameters: `name`
* Optional parameters: `traits`: a dictionary mapping trait names to values.

Response:

* Successful Response:
    * HTTP Resonse Status: 201
    * HTTP Resonse Body: _See Pet Resource Representation_

**`GET /battle_pets/:name`**

_Returns the representation of the pet with :name_

Request:

* Required parameters: `:name`
* Optional parameters: none

Response:

* Successful Response:
    * HTTP Resonse Status: 200
    * HTTP Resonse Body: _See Pet Resource Representation_

# Version 2

## (Additional) BattlePets

* `animal`: different default attributes
* `health`: numerical value (range initiated by app), decreases during battle, increases time spent way from battle plus feeding
* `actions`: set of battle actions the pet is capable of, e.g. spelling, kicking and punchting
* `moves`: set of battle moves the pet is capable of, e.g. walking, running
* `special_actionz`: initially none, may become karate chopping or fireballing, etc.
* `special_movez`: initially none, but may become swimming, jumping, flying, etc.

**Resource Actions**

**`GET /pets`**

_Returns a list of all existing pets_

**`PUT,DELETE /pets/:name`**

**`PATCH /pets/:name`: updates to health, experience, or skills**

### Battle Actions

**Resource Attributes**

* `name`: Name for action, e.g.: `kick, punch, shield, karate chop` etc.
* `force`: positive or negative value. (e.g. offensive or defensive)
    * If positive, indicates a defensive action which reduces impact of opponents action.
    * If negative, indicates an offensive action impacting opponents health.

Possible actions are seeded during app initiation.

### Battle Actions and Battle Moves

* `type`: step, jump, leap, run, swim
* `direction`
* `force`

Possible moves are seeded during app initiation.

# Future Improvements

* Should there be functionality to clone existing pets? Say a user wants to battle the same pet by creating a duplicate of it.
* Train a pet builds actions and moves, but only when healthy

#### [Inspired by Tamagotchi](https://en.wikipedia.org/wiki/Tamagotchi)

* Lifecycle - having an age that progresses in real time such that younger and older pets are weaker than adult pets
* Marriage and procreation
