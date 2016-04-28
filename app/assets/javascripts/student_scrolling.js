var page = 2;

// stop default event from happening
$('.next').on('click', function(event) {
  event.preventDefault();

//ajax request to tweets api
  var request = $.ajax({
   method: "GET",
   url: ("/schools?page=" + page),
  });

//appending it to list
  request.done(function(newTweets) {
    for (var i = 0; i < newTweets.length; i++) {
      tweetBody = newTweets[i]["text"];
      tweetUser = newTweets[i]["username"];
      tweets_list.append("<li class='tweet'>" + "<div class='body'>" + tweetBody + "</div>" + "<div class='user'>" + tweetUser + "</div>" + "</li>");
    }
    page++
  });
});
