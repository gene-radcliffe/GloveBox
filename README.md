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
GloveBox is a Ruby on Rails applications. This application is configured to use postgresql database
and AWS S3 for asset storage.

* __Ruby version: 2.5.1__ 

* __Ruby on Rails version: 5.2.1__
````

### System dependencies:
````
Install the following gems onto your system. 
 Visit https://rubygems.org/ to get specific installation instructions for each gem
  1. Postgresql gem version: >= 0.18
  2. JBuilder gem version: 2.5
  3. Bcrypt gem version: 3.1.7
  4. Amazon Web Service S3 ('aws-sdk-s3') gem
  5. fog-aws gem
  6. figaro gem
  7. prawn gem
  8. prawn table gem
  9. devise gem
  10. font-awesome-rails gem >= 4.7.0.4
  11. font-awesome-sass' gem > 5.3

````

### AWS S3
````
Sign-up for a free S3 account at Amazon Web Services. 
Create an S3 bucket to store image uploads for the application.
Grant the proper user policy to your S3 account.

The following links will guide you in the process:

https://docs.aws.amazon.com/AmazonS3/latest/gsg/SigningUpforS3.html
https://medium.com/alturasoluciones/setting-up-rails-5-active-storage-with-amazon-s3-3d158cf021ff

````

#### Configure Active Storage
````
Configure your active storage (S3) settings in the 'storage.yml' file.
Set it to use Amazon S3 web services. You can use figaro to create an 'application.yml' file
to store your sensitive S3 information such as your token and user id. Use ENV to call your
S3 token and user id. 
````
````Ruby
amazon:
   service: S3
   access_key_id:  <%= ENV['aws_access_key_id']%>
   secret_access_key: <%= ENV['aws_secret_access_key']%> 
   region: us-east-1
   bucket: <%= ENV['aws_bucket']%>
````

````
* set the following line in production.rb / development.rb to 'amazon' or your preferred web service.
....config.active_storage.service: amazon

 run: $figaro install  //this wiill install an application.yml file where you can 
 store your S3 token and user id.
````

### SMTP Server settings
````
Configure your SMTP server to send and receive email. You can signup for a free sendgrid account.
Gmail will work fine. Just change the security settings on your google account to allow access

Enter your SMPT settings in setup_mail.rb or development.rb
 
````

````Ruby
##setup_mail.rb

ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.sendgrid.net',
  :port                 =>  587,
  :authentication       =>  :plain,
  :user_name            => ENV['SENDGRID_USERNAME'],
  :password             => ENV['SENDGRID_PASSWORD'],
  :domain               => "heroku.com",
  :enable_starttls_auto  =>  true
}
````
### Database creation
````
Run the following command to reset and initialize the database 

_$bin/rails db:reset_

````
### Deployment instructions

````
run the puma server
_bin/rails s_

_open your browser to http://localhost:3000_
````

### Account signup
````
You will have to signup for a user account on the account signup page
You will receive a confirmation email to confirm your token
````

