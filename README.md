# User
  ## association
    ### has many comments, Prototypes, Goos
  ## table
       -member
       -profile
       -avatar
       -works

# Prototype
  ## association
    ### belongs to user, has many comments, sub_ images, goos
  ## table
       -img
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

# Goo
  ## association
    ### belongs to user, prototype
  ## table
       -user_id
       -prototype_id

# Sub_image
  ## association
    ### belongs to prototype
  ## table
       -img_url
       -prototype_id


