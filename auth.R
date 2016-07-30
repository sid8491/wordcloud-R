require(twitteR)
require(tm)
require(wordcloud)

consumer_key <- '######################'
consumer_secret <-  '#################################'
access_token <- '##################################'
access_secret <- '###################################'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
# "Using direct authentication"