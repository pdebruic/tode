as yet unclassified
limit
  "limit chars [<item-count>]
  limit list [<item-count>]
  limit oops [<item-count>]
"

  | cmd cmdTokens |
  cmd := tokens at: 1.
  cmdTokens := tokens copyFrom: 2 to: tokens size.
  (cmdTokens at: 1) = 'chars'
    ifTrue: [ ^ self limitChars: cmdTokens ].
  (cmdTokens at: 1) = 'list'
    ifTrue: [ ^ self limitList: cmdTokens ].
  (cmdTokens at: 1) = 'oops'
    ifTrue: [ ^ self limitOops: cmdTokens ].
  self error: 'Unknown limit item: ' , (cmdTokens at: 1)