twitterCloud <- function(searchString, n = 500, remove.words = '') {
  require(twitteR)
  require(tm)
  require(wordcloud)
  require(RColorBrewer)
  
  tweets <- searchTwitteR(searchString = searchString, n = n)
  tweets.char <- sapply(tweets, function(x) x$getText())
  tweets.char.bk <- iconv(tweets.char,'UTF-8', 'ASCII')
  tweets.char.bk <- gsub("(f|ht)tp(s?)", "", tweets.char.bk)
  tweets.corpus <- Corpus(VectorSource(tweets.char.bk))
  
  
  # cleaning data
  tweets.clean <- tm_map(tweets.corpus, removePunctuation)
  tweets.clean <- tm_map(tweets.clean, content_transformer(tolower))
  tweets.clean <- tm_map(tweets.clean, removeWords, stopwords("english"))
  tweets.clean <- tm_map(tweets.clean, removeNumbers)
  tweets.clean <- tm_map(tweets.clean, stripWhitespace)
  tweets.clean <- tm_map(tweets.clean, removeWords, remove.words)
  
  # make wordcloud
  wordcloud(tweets.clean, max.words = 500, colors = brewer.pal(8,"Set2"), scale = c(5,.5), random.order = F)
}