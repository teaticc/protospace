# User
## association
### has many comments, Prototypes, Goods
## table
-member
-profile
-avatar
-works

# Prototype
## association
### belongs to user, has many comments, sub_ images, goods
## table
-copy
-concept
-title
-user_id

# Comment
## association
### belongs to user, prototype
## table
-text
-user_id
-prototype_id

# Good
## association
### belongs to user, prototype
## table
-user_id
-prototype_id

# Capturedimage
## association
### belongs to prototype
## table
-img_url
-prototype_id
-image_type


