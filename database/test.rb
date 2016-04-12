require "yaml"

database = YAML.load_file( "../public/database.yml/" )

p database