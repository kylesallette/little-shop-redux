ITERATION 1:
1. Set up database cleaner
2. Create migration and write code in migration to create merchant table with attributes
3. Run migration to create database
4. Create a Merchant model
5. Write at least 4 tests (id, name, created_at, updated_at) to ensure merchants cannot be created without having ALL attributes
6. Create controller paths to route to:
  1. get '/index' to see all merchants
  2. get '/index/:id' to see single merchants
  3. get '/index/new' to create merchant
  4. post '/index' to create merchant in database
  5. get '/index/:id/edit' to edit a merchant
  6. put '/index/:id' to update merchant in database
  7. delete 'index/:id' to delete merchant from database **what page do we want to be able to delete a merchant?**
  8. create corresponding erb pages for each path

ITERATION 2:
1. Add data to the database from our CSV using... tux? File?
