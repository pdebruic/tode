initialize-release
selectorParts: tokenCollection arguments: variableNodes 
	super selectorParts: tokenCollection arguments: variableNodes.
	isList := (tokenCollection first value at: 2) == self listCharacter