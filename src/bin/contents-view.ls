
contentsjs = require \../contents

# assume third argument is the directory to load
dir-to-load = process.argv[2]

if !dir-to-load? then
  console.log "missing argument, path to contents required"
  process.exit 1

[data, path] = contentsjs.loadContents dir-to-load

console.log data
console.log path