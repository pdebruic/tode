writing
encodeIndexed: anObject
    | listWriter |
    listWriter := STONListWriter on: self.
    writeStream nextPut: $[.
    self
        indentedDo: [ 
            self newlineIndent.
            1 to: anObject basicSize do: [ :each | listWriter add: (anObject basicAt: each) ] ].
    self newlineIndent.
    writeStream nextPut: $]