# Description:
#   Placeholder for / uri
#
# URLS:
#   /
#

Contents =
  """
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
  <title>Marvin</title>
  </head>
  <body>
    <div class="commands">
      <img src="https://res.cloudinary.com/teepublic/image/private/s--mvx-6lLG--/t_Preview/b_rgb:191919,c_lpad,f_jpg,h_630,q_90,w_1200/v1446147753/production/designs/3998_1.jpg" style="width: 100%">
    </div>
  </body>
</html>
  """

module.exports = (robot) ->
  robot.router.get "/", (req, res) ->
    res.end Contents
