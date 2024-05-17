# URL Shortener

## Requirements

- After a user submitting a url,
  - a short code (`:id`) of the url will be generated using Base64 encoding
  - The url entry is stored into the database, along with the short code, title, description, and the opengraph image for the HTML document (background jobs)
- When visiting `/v/:id`,
  - redirecting the client to the URL
  - the views is recorded
- The URL entry view should be able to,
  - copy the short URL to the clipboard
  - display the total number of views
  - display a graph of the views over the past month
