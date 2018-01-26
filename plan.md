ITERATION 1:
X1. Set up database cleaner
X2. Create migration and write code in migration to create merchant table with attributes
X3. Run migration to create database
X4. Create a Merchant model
x5. Write at least 4 tests (id, name, created_at, updated_at) to ensure merchants cannot be created without having ALL attributes
6. Create controller paths to route to:
  X6.1 - get '/index' to see all merchants
  X6.2 - get '/index/:id' to see single merchants
  X6.3 - get '/index/new' to create merchant
  X6.4 - post '/index' to create merchant in database
  X6.5 - get '/index/:id/edit' to edit a merchant
  X6.6 - put '/index/:id' to update merchant in database
  X6.7 - delete 'index/:id' to delete merchant from database **what page do we want to be able to delete a merchant?**
  X6.8 - create corresponding erb pages for each path

ITERATION 2:
1. Add data to the database from our CSV using... tux? File?
