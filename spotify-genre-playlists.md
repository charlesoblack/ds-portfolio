# Genre Playlists on Spotify

## Summary

[Spotify](www.spotify.com) does not offer song playlists by genre. The closest you get is artist genres, but these are sometimes not accurate for a given song, since artists can change their music styles. I made an attempt to remedy this myself by using [Spotify's API](https://developer.spotify.com/documentation/web-api/) and [LastFM's API](https://www.last.fm/api/) to get information on songs, cluster them, then create a playlist on Spotify with those songs. The entire project can be viewed [on my GitHub](https://github.com/charlesoblack/spotify-genre-playlists).

## Initial approach to data collection

To start off, I read through Spotify's API documentation in order to determine what endpoints best to use. I settled on the ["Get a User's Saved Tracks"](https://developer.spotify.com/documentation/web-api/reference/library/get-users-saved-tracks/) endpoint for gathering what the songs in my library are and the ["Get Audio Features for Several Tracks"](https://developer.spotify.com/documentation/web-api/reference/tracks/get-several-audio-features/) endpoint for determining song metadata. This allowed me to use only the songs I actually have "Liked" on Spotify and provided simple audio features that could be used for eventual song clustering.

Since the Spotify API has a rate limit, I used the `multiprocessing` library to manage calling the API endpoints. Getting a user's saved tracks comes in pages of 50 tracks each, and getting the track audio features has a maximum of 100 tracks per API call. This parallelized approach allowed me to finish gathering the data I needed in a fraction of the time, if compared to single-process API calls. The crucial component of the entire `multiprocessing` library usage is its `Queue` and `Manager` objects which allowed me to communicate between processes simply and effectively.

## Clustering songs

In order to cluster the song data I had, I used a [DBSCAN](https://scikit-learn.org/stable/modules/generated/sklearn.cluster.DBSCAN.html) clustering algorithm. I figured this would give me decent results with the correct EPS. This ended up being a vain hope, since most songs were too far apart for any decent clustering to actually occur.

## Intermediary results

The initial DBSCAN clustering yielded only two clusters, and approximately 3000 outliers. Obviously this was not a good result. I did take a look at one of the clusters:

1. TC - April Fools
2. Excision, Messinian - Destroid 4: Flip The Switch
3. Sub Focus, Culture Shock, TC - You Make It Better
4. Pendulum - Plasticworld (ft. Fats & TC)
5. Smooth - WTF
6. Drumsound & Bassline Smith - Violator
7. Delta Heavy - Event Horizon

It turns out that these songs are actually really similar! The clustering worked for these 7 tracks! Now I just needed to fix the 3000 outliers.

## Revised data collection

At this point, I looked more closely at the audio features provided by Spotify, as listed on [this page](https://developer.spotify.com/documentation/web-api/reference/tracks/get-audio-features/). It turns out that a lot of these features do not have very good descriptions on how Spotify actually came up with them (e.g. a track's valence). Since I also did not have access to the tracks themselves in order to create my own track features, I had to think of something else.

I then thought of perhaps using the LastFM API to gather tags given by actual listeners. LastFM provides an endpoint for this [here](https://www.last.fm/api/show/track.getTopTags). I set up another function that also worked with `multiprocessing`, but it doesn't work too well because it relies on artist and track names instead of Spotify IDs.

## Results

Unfortunately, there are still issues collecting tags from LastFM because of track and artist name mismatches. As such, the current results don't actually accomplish any sort of genre clustering as wished for.
