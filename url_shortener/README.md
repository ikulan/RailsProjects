# URL Shortener

This project aims to build a url shortener web app. Users can get a shortened url and track the views of the url.

What I explored in this project,

- Implement Base62 conversion
- Integrate [Chartkick](https://chartkick.com/) for easy JavaScript chart creation
- Create background jobs using [Active Job](https://guides.rubyonrails.org/active_job_basics.html)
- Update the view in real-time after the background job has completed, using [Hotwire Turbo Streams](https://github.com/hotwired/turbo-rails?tab=readme-ov-file#come-alive-with-turbo-streams)

## Requirements

- After a user submitting a url,
  - a short code (`:id`) of the url will be generated using Base62 encoding
  - The url entry is stored into the database, along with the short code, title, description, and the opengraph image for the HTML document (background jobs)
- When visiting `/v/:id`,
  - redirecting the client to the URL
  - the views is recorded
- The URL entry view should be able to,
  - copy the short URL to the clipboard
  - display the total number of views
  - display a graph of the views over the past month
