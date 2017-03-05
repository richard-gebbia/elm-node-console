# elm-node-console

An Elm wrapper around the [Node.js Console API](https://nodejs.org/api/console.html). 

At the moment, you cannot use this wrapper to create or use consoles other than the global one present in Node.

To run your Elm code inside of Node rather than in a browser:

1. Put the output from `elm make` into a JS file.
  ```
  elm make MyAwesomeElmProgram.elm --output=elm.js
  ```

2. `require` the outputted JS file and call `.worker()` on it from inside your Node.js script.
  ```javascript
  var Elm = require('./elm.js');
  var app = Elm.MyAwesomeElmProgram.worker();
  ```
