# Setup Apache2 VHost for Linux/Ubuntu

## Usage
Clone or download the repo

Form the directory the project was cloned to run: 
```
bash savh.sh
```

### Step 1
#### What is the document root for the new site?
Enter the document root for the new site. E.g. /home/$USER/Documents/example-site
For Laravel projects ensure you append the public directory. 
### Step 2
#### What is the service alias?
This will be the domain you will use to access the site in a browser. E.g. example-site.local
#### Step 3
Now you will be prompted to confirm you are happy with the configuration file which will be created and that your document root is correct. 
#### Step 4
Now you will need to edit your hosts file and add a new entry. e.g. 127.0.0.1 example-site.local