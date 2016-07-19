# Design

KISS (Keep it simple stupid): I kept the API as simple as possible, while adding flexibility where I could easily see a case for extending configurability in clients. For example, battlepet traits default to those listed by the spec, but can be any name / value pair.

## Resources

### Pets

All pets have an initial set of actions (as seeded by app) having different possible forces and ante-forces.

#### Pet Resource Representation

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

____

_[v2]_

**Resource Actions**

**`GET /pets`**

_Returns a list of all existing pets_

* Required parameters: none
* Successful Response:
    * HTTP Status: 200
    * HTTP Body: List of battlepet resources

**`PUT,DELETE /pets/:name`**

[ADD ME]

**`PATCH /pets/:name`: updates to health, experience, or skills**

Request:

* Required parameters: `:name`

Response:

* Successful Response:
    * HTTP Resonse Status: 204
    * HTTP Resonse Body: No Content
    * HTTP Response Headers:
        * Content-Location `/pets/:name`

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

## Future Improvements

* Should there be functionality to clone existing pets? Say a user wants to battle the same pet by creating a duplicate of it.
* Train a pet builds actions and moves, but only when healthy

#### [Inspired by Tamagotchi](https://en.wikipedia.org/wiki/Tamagotchi)

* Lifecycle - having an age that progresses in real time such that younger and older pets are weaker than adult pets
* Marriage and procreation
