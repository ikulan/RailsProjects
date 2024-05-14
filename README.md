# Ruby on Rails Projects

## 1. [Build a Blog with Rails 7](blog/)

This project aims to familiarize myself with the latest features of Rails 7 and its useful tool libraries. I began by following the instructions outlined in the [Getting Started with Rails guide](https://guides.rubyonrails.org/getting_started.html) from the official Ruby on Rails documentation, then proceeded to integrate additional modules:

- Beautification using [Tailwind CSS](https://github.com/rails/tailwindcss-rails)
- Authentication using [Devise](https://github.com/heartcombo/devise)
- Switching database from sqlite3 to PostgreSQL
- Support rich text using [Action Text](https://guides.rubyonrails.org/action_text_overview.html)
- Support uploading files into Amazon S3 through [Active Storage](https://guides.rubyonrails.org/active_storage_overview.html)

## 2. [Password Manager](password_manager/)

This project aims to build a password manager app which can securely store encrypted usernames and passwords. This app also allows users to share passwords to other users that they want to share with.

- Create a many-to-many data model through join table to enable the password sharing feature.
- Utilize Active Record Encryption to encrypt specified db fields.
- Add front-end interactive features using Stimulus.js.

https://password-manager-pliu.fly.dev/

