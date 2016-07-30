# wordcloud-R

##This program fetches the tweets based on keyword provided, and make a wordcloud of fetched words.

### Usage :
* In auth.R file, provide your credentials you get from twitter developer account
* Load auth.R and getTweets.R files, and call method twitterCloud() with parameters
* Parametes :
	* searchString = word which you want to search **(required)**
	* n = number of tweets **(defaut = 500)**
	* remove.words = list of words you want to remove **(optional)**