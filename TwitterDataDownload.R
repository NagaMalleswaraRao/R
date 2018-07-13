#Resource: https://www.credera.com/blog/business-intelligence/twitter-analytics-using-r-part-1-extract-tweets/
# Sample code to pull data from Twitter's #nba hashtag
library("twitteR")
library("ROAuth")
library("base64enc")
# Download "cacert.pem" file
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

#create an object "cred" that will save the authenticated object that we can use for later sessions
cred <- OAuthFactory$new(consumerKey='721fHH3wMcWQTFnynT92hjjjdk',
                       consumerSecret='6gDxBfloRCS556klpZkWOUKTlgMNxfYfHLR2eJ9RoIa8tMdhjjfk998',
                       requestURL='https://api.twitter.com/oauth/request_token',
                      accessURL='https://api.twitter.com/oauth/access_token',
                     authURL='https://api.twitter.com/oauth/authorize')

# Executing the next step generates an output --> To enable the connection, please direct your web browser to: <hyperlink> .
# Note:  You only need to do this part once, input the pin after authentication in R console
cred$handshake(cainfo="cacert.pem")

#save for later use
save(cred, file="twitter authentication.Rdata")

load("twitter authentication.Rdata")
setup_twitter_oauth("721fHH3wMcWQTFnynT92hjjjdk","6gDxBfloRCS556klpZkWOUKTlgMNxfYfHLR2eJ9RoIa8tMdhjjfk998","1286969-mM2ghuyCL9ki90olyG8YpPGs8WWwsVZnIwT8TOpE89W",
                    "zjklo78RBfCHT4E8904gfjIHzdRPthfj566drmzaPKetI6OhkVkM")

search.string <- "#nba"
no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets, lang="en")
tweets
