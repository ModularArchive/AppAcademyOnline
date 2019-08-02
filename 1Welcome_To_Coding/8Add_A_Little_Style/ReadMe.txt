Add a little style
Congratulations! We've just built our first small web application.
To put on the finishing touches, change the strings in the style hash below.
Play around with different words. What works and what doesn't? Remember to fill in your name.
Click "complete task" when you're ready to move on! 

require '/tmp/shadow_code'

set_styles({
    background: "blue",
  title_size: 12,
  font_style: "arial",
  title_align: "middle",
  image_border_radius: 30
})

user_name = "Scott Brown"

subreddits = ["aww", "awww", "hardcoreaww", "puppies"]

filter_by(["!"])

posts = get_posts(subreddits)

posts = sort_posts(posts, "title")

render_posts(user_name, posts)