private-formatting
formatPragmasFor: aNode
	aNode pragmas do: [ :each | self visitNode: each; indent ]