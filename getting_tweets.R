# Getting all the data from Twitter

library(twitteR)

consumer_key <- "ul0zL1WmoQ9tKWgv0f5AZhiDn"
consumer_secret <- "TJ3i0v6wNFx91nqfNNbVFSYyDC9vXp1QuOYo0gZ8HdiSTnDmcF"
access_token <- "76037206-OCx8lq0rB3hiHz8WQfw9QRBv0S6ViEcZB8v9gUHcW"
access_secret <- "OvTdlW1GHZ9MhBBypUq70gnSgfB5Pah13Bg7d5yh3wFmH"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tw = twitteR::searchTwitter('#realDonaldTrump + #HillaryClinton', n = 1e4, since = '2016-11-08', retryOnRateLimit = 1e3)
d = twitteR::twListToDF(tw)