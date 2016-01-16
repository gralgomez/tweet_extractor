#Twitter_Extractor
#20160113

library('streamR')
library('rjson')
#library('bitstops')
library('RJSONIO')
library('twitteR')
library('RCurl')

#OAuth authentification
library('ROAuth')

#These are relevant for later storage of the Tweets
library('plyr')
library('dplyr')

#Curl cert --> You need this certificate 
download.file(url="http://curl.haxx.se/ca/cacert.pem",
              destfile="cacert.pem")
#---------------------------------------------------------------------
# Following steps are followed:
#   1- Request Access to Twiter 
#     1.1 - Create account at https://dev.twitter.com/ (Sign In)
#     1.2 - Create an Access Token / Secret Token
#     1.3 - LEAVE Callback URL EMPTY (Otherwise it is still quite hard to reset it, Twitter Bug) [FIRST RUN]
#   2- Connect with Twitter setup_twitter_oauth() [SECOND RUN]
#   3- Fetch/Process the Tweets
#---------------------------------------------------------------------
reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"

api_key <- 'xxxx'   # ------> You have to replace your own key after dev.twiter signin 
api_secret <- 'xxxx' 
access_token <- 'xxxx'
access_token_secret <- 'xxxx'

#Check this tutorial (including screenshots) for a good start
#http://www.r-bloggers.com/r-text-mining-on-twitter-prayformh370-malaysia-airlines/

twitCred <- OAuthFactory$new(consumerKey = api_key,
                             consumerSecret = api_secret,
                             requestURL = reqURL,
                             accessURL = accessURL,
                             authURL = authURL
) 
twitCred$handshake() #asking for access, introduce PIN [RUN UNTIL HERE 1st]
#---------------------------------------------------------------------
# possible error log can be fixed with callback URL: http://127.0.0.1:1410 - resolved, leave blank!!!
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
#---------------------------------------------------------------------

#3- Fetching Tweets
tweets <- searchTwitter("#moocs", n=250)
data.tweets <- do.call('rbind', lapply(tweets, as.data.frame)); View(data.tweets) # This will store your tweets as a dat.frame
