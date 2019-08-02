Factoring out
Up until now we've been grabbing the posts and rendering them in one fell swoop.
We're going to seperate out our getter and our render method. We'll see why in the next step.
Take a look at the code: can you see how it is slightly different? Click Run Code and move on to the next step. Again, fill in your name between the quotes following user_name =.

require '/tmp/shadow_code'

user_name = "Scott Brown"

subreddit = "hardcoreaww"

number_of_posts = 10

posts = get_posts(subreddit, number_of_posts)

render_posts(user_name, posts)