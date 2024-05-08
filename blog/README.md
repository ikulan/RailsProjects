# Build a Blog with Rails 7

This project aims to familiarize myself with the latest features of Rails 7 and its useful tool libraries. I began by following the instructions outlined in the [Getting Started with Rails guide](https://guides.rubyonrails.org/getting_started.html) from the official Ruby on Rails documentation, then proceeded to integrate additional modules:

- Beautification using [Tailwind CSS](https://github.com/rails/tailwindcss-rails)
- Authentication using [Devise](https://github.com/heartcombo/devise)
- Switching database from sqlite3 to PostgreSQL
- Support rich text using [Action Text](https://guides.rubyonrails.org/action_text_overview.html)
- Support uploading files into Amazon S3 through [Active Storage] (https://guides.rubyonrails.org/active_storage_overview.html)

## Development

### Running the project for the first time:

- set up local PostgreSQL DB

```
brew install postgresql
brew services start postgresql
```

- install dependencies
  `bundle install`

- set up the database tables for the app
  `./bin/dev rails db:migrate`

### Run the dev server:

`./bin/dev`
This will bring on the dev server for Rails and a watcher for Tailwind CSS.

### Run console:

`./bin/console`
