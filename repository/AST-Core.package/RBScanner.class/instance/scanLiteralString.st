private-scanning
scanLiteralString
	self step.
	
	[currentCharacter isNil 
		ifTrue: [self scannerError: 'Unmatched '' in string literal.'].
	currentCharacter = $' and: [self step ~= $']] 
			whileFalse: 
				[buffer nextPut: currentCharacter.
				self step].
	^RBLiteralToken 
		value: buffer contents
		start: tokenStart
		stop: self previousStepPosition