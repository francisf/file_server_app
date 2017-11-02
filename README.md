# README
git clone git@github.com:francisf/file_server_app.git

rails db:migrate

rails server


Go to localhost:3000

using 2 models :
1) User - Created using 'devise' gem. Supports the basic authentication requirements. Can enable advanced features later by changing config
2) Blob - For user file. The content is stored using paperclip inside a field blob_data on the file system. Paperclip is quick to start, provides option to s3 if required, file processors, etc. Carrierwave was another option.

Prodenv setup at https://file-server-app.herokuapp.com
