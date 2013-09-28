express = require 'express'
_ = require 'underscore'


app = express()

defeat = {rock: "scissors", paper: "rock", scissors: "paper"}
throws = _.keys defeat

app.get '/throw/:type', (req, res) ->
  player_throw = req.params['type']
  if not _.contains throws, player_throw
    res.end "Halt! You must throw one of the following #{throws}"

  computer_throw = _.sample(throws)
  if player_throw == computer_throw
    res.end "tie"
  else if computer_throw == defeat[player_throw]
    res.end "you won!"
  else
    res.end "ouch #{computer_throw} beats #{player_throw}"

app.listen 3000
console.log "Express server started at port 3000"

