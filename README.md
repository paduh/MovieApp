# MovieApp
This a movie listing app integrated with omdbapi api using Swift and MVVM.

I have enjoyed the journey of getting this app up and running. Currently I have a few test written and over the next couple of weeks as time would allow I will improve on this project

I decided to go with SDWebImage Pod for async downloading of movie image over the use of url session due to the reasons below:

iOS NSURLCache does memory and disk caching (since iOS 5) of raw HTTP responses. Each time the cache is hit, your app will have to transform the raw cached data into an UIImage. This involves extensive operations like data parsing (HTTP data are encoded), memory copy etc.

On the other side, SDWebImage caches the UIImage representation in memory and store the original compressed (but decoded) image file on disk. UIImage are stored as-is in memory using NSCache, so no copy is involved, and memory is freed as soon as your app or the system needs it.

Additionally, image decompression that normally happens in the main thread the first time you use UIImage in an UIImageView is forced in a background thread by SDWebImageDecoder.

Last but not least, SDWebImage will completely bypass the complex and often misconfigured HTTP cache control negotiation. This greatly accelerates cache lookup.
