as yet unclassified
executeCommandSpecs: commandSpecs
  "tokens command expected [ block ]"

  commandSpecs
    do: [ :ar | 
      | tool expected actual tokens command block answer actualPrintString |
      tokens := ar at: 1.
      command := ar at: 2.
      expected := ar at: 3.
      ar size == 4
        ifTrue: [ block := ar at: 4 ]
        ifFalse: [ block := [ :ans | ans ] ].
      tool := self toolClass
        topez: self topez
        objIn: nil
        tokens: tokens
        windowId: nil.
      actual := tool perform: command.
      actualPrintString := actual printString.
      answer := block value: actual.
      expected ifNotNil: [ self assert: expected = answer ] ]