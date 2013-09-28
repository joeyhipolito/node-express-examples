express = require 'express'
app = express()

app.get '/', (req,res) ->
  res.end 'Hello World'

app.listen(3000)
console.log "Express server started on port: 3000"

