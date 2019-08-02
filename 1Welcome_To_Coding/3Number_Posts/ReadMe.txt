Number Posts
When we get_and_render_posts, we get 5 posts every time. What if we wanted to get more posts?
Let's add a variable to control this. Change the number following number_of_posts = to 10. Don't forget to enter your name between the quotes following user_name =.

require '/tmp/shadow_code'

user_name = "Scott Brown"

subreddit = "hardcoreaww"

number_of_posts = 10

get_and_render_posts(user_name, subreddit, number_of_posts)