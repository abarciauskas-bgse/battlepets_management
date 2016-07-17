ENV['RAILS_ENV'] ||= 'test'
default_attributes = YAML.load_file('config/default_attributes.yml')[ENV.fetch("RAILS_ENV")]

ATTRIBUTES_LIMIT = default_attributes['limit']
WIT_DEFAULT = default_attributes['wit']
STRENGTH_DEFAULT = default_attributes['strength']
AGILITY_DEFAULT = default_attributes['agility']
SENSES_DEFAULT = default_attributes['senses']
