twitterCloud <- function(searchString, n = 500, remove.words = '') {
  require(twitteR)
  require(tm)
  require(wordcloud)
  
  tweets <- searchTwitteR(searchString = searchString, n = n)
  tweets.char <- sapply(tweets, function(x) x$getText())
  tweets.corpus <- Corpus(VectorSource(tweets.char))
  
  
  # cleaning data
  tweets.clean <- tm_map(tweets.corpus, removePunctuation)
  tweets.clean <- tm_map(tweets.clean, content_transformer(tolower))
  tweets.clean <- tm_map(tweets.clean, removeWords, stopwords("english"))
  tweets.clean <- tm_map(tweets.clean, removeNumbers)
  tweets.clean <- tm_map(tweets.clean, stripWhitespace)
  tweets.clean <- tm_map(tweets.clean, removeWords, remove.words)
  
  # make wordcloud
  wordcloud(tweets.clean, max.words = n, colors = rainbow(50), scale = c(12,1))
}