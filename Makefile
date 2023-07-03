install:
	bundle install

start:
	bin/rails s -p 3000 -b "0.0.0.0"

lint:
	bundle exec rubocop

linter-fix:
	bundle exec rubocop -A
