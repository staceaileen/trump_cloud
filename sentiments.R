# Getting all the data from Twitter

# importing packages
library(twitteR)
library(tidytext)
library(dplyr)
library(tidyr)
library(stringr)
library(ggplot2)
library(RCurl)
library(gutenbergr)

# configuration
consumer_key <- "ul0zL1WmoQ9tKWgv0f5AZhiDn"
consumer_secret <- "TJ3i0v6wNFx91nqfNNbVFSYyDC9vXp1QuOYo0gZ8HdiSTnDmcF"
access_token <- "76037206-OCx8lq0rB3hiHz8WQfw9QRBv0S6ViEcZB8v9gUHcW"
access_secret <- "OvTdlW1GHZ9MhBBypUq70gnSgfB5Pah13Bg7d5yh3wFmH"


# getting tweets using twitteR API
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tw = twitteR::searchTwitter('@realDonaldTrump', n = 100, lang = 'en', since = '2017-01-08', retryOnRateLimit = 1e3)
d = twitteR::twListToDF(tw)

tweet_stats = data.frame(tweet = d$text, favoriteCount = d$favoriteCount, retweetCount = d$retweetCount)
tweet_loc = data.frame(tweet = d$text, lon = d$longitude, lat = d$latitude)
tweet_created = d %>% select(text, created)

tweet_created$text <- gsub("@\\w+ *", "", tweet_created$text)
tweet_created$text <- gsub("(R)T ", "", tweet_created$text)
tweet_created$text <- gsub("https", "", tweet_created$text)
tweet_created$text <- gsub("t.co", "", tweet_created$text)

# cleaning the text from tweets
word_bag <- tweet_created %>% mutate(line = 1:nrow(.))
(word_bag <- word_bag %>% unnest_tokens(word, text))

data(stop_words)
word_bag <- word_bag %>% anti_join(stop_words)
word_bag


scored_words <- word_bag %>% inner_join(get_sentiments("afinn"))

scored_words

avg_scored_tweets <- scored_words %>% 
  group_by(line) %>%
  summarize(avg_score = mean(score))

avg_scored_tweets

final_scoring <- left_join(word_bag, avg_scored_tweets, by = "line", all.X = TRUE)
final_scoring[is.na(final_scoring)] <- 0
final_scoring
