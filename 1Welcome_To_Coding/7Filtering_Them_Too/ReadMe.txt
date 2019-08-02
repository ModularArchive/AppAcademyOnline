Filtering them too
We've gotten our posts sorted in a good order, but maybe we want to filter them?
Let's try getting just the best animals by only fetching posts that have a "!" in the title.
Inside of the filter_by call, inside the array, [], add the string "!" to filter out all the posts that don't have an exclamation point. Trying adding other filters or more filters by adding more strings and separating them by commas. Fill in your name as well.

require '/tmp/shadow_code'

user_name = "Scott Brown"

subreddits = ["aww", "awww", "hardcoreaww", "puppies"]

filter_by(["!", "dog"])

posts = get_posts(subreddits)

posts = sort_posts(posts, "title")

render_posts(user_name, posts)