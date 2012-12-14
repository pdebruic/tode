as yet unclassified
nscNode: nsc
    | node |
    node := TDObjectNode new
        name: 'nsc';
        topez: topez;
        basicContents: nsc;
        listBlock: [ :theNode | #('indexedPaths') , ((1 to: nsc size) collect: [ :each | each asString ]) ];
        elementBlock: [ :theNode :elementName :absentBlock | 
                    | childNode |
                    childNode := elementName = 'indexedPaths'
                        ifTrue: [ self indexListNode: nsc _indexedPaths ]
                        ifFalse: [ 
                            elementName isAllDigits
                                ifFalse: [ ^ self error: 'No such node: ' , elementName printString ].
                            self indexElementNode: (nsc _at: elementName asNumber) ].
                    childNode
                        name: elementName;
                        parent: theNode;
                        yourself ];
        yourself.
    ^ node