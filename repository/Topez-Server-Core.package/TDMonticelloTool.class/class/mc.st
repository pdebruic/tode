as yet unclassified
mc
  <topezCommand: 'mc' manPage: #'mcManPage'>
  ^ [ :topez :objIn :tokens :windowId | 
  self
    performSubCommand: topez
    objIn: objIn
    tokens: tokens
    windowId: windowId ]