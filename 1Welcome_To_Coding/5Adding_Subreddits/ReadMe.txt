Adding subreddits
Let's now combine posts from multiple subreddits into a single feed.
Add another subreddit name (like "puppies") to the list (called an array) on line 5 and increase the number of posts to 20 so you can be sure and see something from each subreddit in your array. Don't forget to fill in your name.

require '/tmp/shadow_code'

user_name = "Scott Brown"

subreddits = ["aww", "awww", "hardcoreaww", "puppies"]

number_of_posts = 20

posts = get_posts(subreddits, number_of_posts)

render_posts(user_name, posts)