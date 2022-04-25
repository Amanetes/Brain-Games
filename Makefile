install:
	bundle install
start:
	bin/brain_games.rb
lint:
	rubocop .
fix:
	rubocop -A .

.PHONY: test