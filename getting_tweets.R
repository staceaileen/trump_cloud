# Getting all the data from Twitter

# importing packages
library(twitteR)
library(tidytext)library(dplyr)
library(tidyr)
library(stringr)
library(ggplot2)

<<<<<<< HEAD
# configuration
consumer_key <- "ul0zL1WmoQ9tKWgv0f5AZhiDn"
consumer_secret <- "TJ3i0v6wNFx91nqfNNbVFSYyDC9vXp1QuOYo0gZ8HdiSTnDmcF"
access_token <- "76037206-OCx8lq0rB3hiHz8WQfw9QRBv0S6ViEcZB8v9gUHcW"
access_secret <- "OvTdlW1GHZ9MhBBypUq70gnSgfB5Pah13Bg7d5yh3wFmH"
=======
consumer_key <- ""
consumer_secret <- ""
access_token <- ""
access_secret <- ""
>>>>>>> 0ed65c46138e4c1190e3b2e9106c0c0daca20b43

# getting tweets using twitteR API
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
<<<<<<< HEAD
tw = twitteR::searchTwitter('@realDonaldTrump', n = 100, lang = 'en', since = '2017-01-08', retryOnRateLimit = 1e3)
(d = twitteR::twListToDF(tw))

tweet_stats = data.frame(tweet = d$text, favoriteCount = d$favoriteCount, retweetCount = d$retweetCount)
tweet_loc = data.frame(tweet = d$text, lon = d$longitude, lat = d$latitude)
tweet_created = data.frame(tweet = d$text, date = d$created)

# cleaning the text from tweets
=======
tw = twitteR::searchTwitter('#realDonaldTrump + #HillaryClinton', n = 1e4, since = '2016-11-08', retryOnRateLimit = 1e3)
d = twitteR::twListToDF(tw)
>>>>>>> 0ed65c46138e4c1190e3b2e9106c0c0daca20b43
