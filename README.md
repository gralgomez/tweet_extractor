# Extracting Tweets with R
## Steps

There are already many tutorials out there on Text Mining/Opinion Mining with R. However not all codes run smoothly since many details are left out e.g which libraries are needed. You will find hereby my own version which runs on a Ubuntu 15.10 (64bits), RStudio Version 0.99.491 together with some recomendations based on the my experience while trying to implement the code.

### Note:
You can also lookup [this tutorial](http://www.r-bloggers.com/r-text-mining-on-twitter-prayformh370-malaysia-airlines/) for a good start (includes screenshots).

### Steps:
1. Make sure you have:
  * An account at https://dev.twitter.com/ [Twitter account requiered]
  * Your API key and account Token

2. Connect with Twitter thorugh OAuth (ROauth library)
  * For this step please make sure you leave the Callback URL empty, otherwise you'll probably will have to restart your     application due to a Twitter bug. If you are experiencing some authorization problems make sure your have all packages requiered and your libraries are uptodate.
  * I am using Ubuntu 15.10 64bit and thus I had to also install the 'base64enc' library.

3. Fetch your Tweets
  * This step is quite easy since the 'twitteR' library by Jeff Gentry provides many useful functions.
  * However, I did experienced some difficulties converting the extracted Tweets (list) into a data frame. For doing so I used the plyr package (lapply)
  * This is still work in progress, I will keep you posted ....
  
## Packages
https://cran.r-project.org/web/packages/twitteR/index.html
https://cran.r-project.org/web/packages/ROAuth/index.html
