# README

Glovebox provides users with a practical and efficient way of keeping track of vehicle maintenance. Declutter your glovebox and still keep the records that can increase your car's resale value!

## Live site
````
http://glovebox.tools
or visit:
https://damp-escarpment-35251.herokuapp.com/ 
````

## Local Development

### Clone Locally
````
$git clone https://github.com/gene-radcliffe/GloveBox.git
````

## Configuration: 
````
GloveBox is a Ruby on Rails applications. This application is configured to use postgresql databaseand AWS S3 for asset storage.
````
> Ruby version: 2.5.1 
>
> Ruby on Rails version: 5.2.1

### System dependencies:
> Install the following gems onto your system. 
> Visit https://rubygems.org/ to get specific installation instructions for each gem
  1. Postgresql gem version: >= 0.18
  2. JBuilder gem version: 2.5
  3. BCrypt gem version: 3.1.7
  4. Amazon Web Service S3 ('aws-sdk-s3') gem
  5. fog-aws gem
  6. figaro gem
  7. prawn gem
  8. prawn table gem
  9. devise gem
  10. font-awesome-rails gem >= 4.7.0.4
  11. font-awesome-sass' gem > 5.3

### AWS S3
````
Sign-up for a free S3 account at Amazon Web Services. 
Create an S3 bucket to store image uploads for the application.
Grant the proper user policy to your S3 account.

The following links will guide you in the process:

https://docs.aws.amazon.com/AmazonS3/latest/gsg/SigningUpforS3.html
https://medium.com/alturasoluciones/setting-up-rails-5-active-storage-with-amazon-s3-3d158cf021ff

Once completed configure the
````

> run: $figaro install  //this wiill install an application.yml file where you can add your S3

### Database creation
````
Run the following command to reset and initialize the database 
````
> $bin/rails db:reset

### Deployment instructions
````
run the puma server
````
> bin/rails s
>
> open your browser to http://localhost:3000 

### Account signup
> You will have to signup for a user account on the account signup page
> You will receive a confirmation email to confirm your token


