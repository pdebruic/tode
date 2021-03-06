as yet unclassified
find
  "
  find amethod <method-spec> 
  find categories
  find category <regex-pattern>
  find class <regex-pattern>
  find hierarchy <class-name>
  find method [#]<selector>
  find methods <method-spec-1> <method-spec-2>
  find package <package-name>
  find project <project-name>
  find psender [#]<selector>
  find references <variableOrGlobalNameOrPathRef>
  find rmethod <regex-pattern>
  find rsender <regex-pattern>
  find sender [#]<selector>
  find source <regex-pattern>
  find symbolList <regex-pattern>
  find symbolLists
  find versions <method-spec>
"

  | findTokens command |
  findTokens := tokens copyFrom: 2 to: tokens size.
  command := findTokens at: 1.
  command = 'method'
    ifTrue: [ ^ self findMethod: (findTokens at: 2) ].
  command = 'methods'
    ifTrue: [ ^ self findMethods: findTokens ].
  command = 'psender'
    ifTrue: [ ^ self findPureSender: (findTokens at: 2) ].
  command = 'sender'
    ifTrue: [ ^ self findSender: (findTokens at: 2) ].
  command = 'versions'
    ifTrue: [ ^ self findVersions: findTokens ].
  command = 'references'
    ifTrue: [ ^ self findReferences: (findTokens at: 2) ].
  command = 'rmethod'
    ifTrue: [ ^ self findRegexMethod: (findTokens at: 2) ].
  command = 'rsender'
    ifTrue: [ ^ self findRegexSender: (findTokens at: 2) ].
  command = 'source'
    ifTrue: [ ^ self findSource: (findTokens at: 2) ].
  command = 'class'
    ifTrue: [ ^ self findClass: (findTokens at: 2) ].
  command = 'package'
    ifTrue: [ ^ self findPackageDefinitions: (findTokens at: 2) ].
  command = 'categories'
    ifTrue: [ ^ self findCategoryDefinitions ].
  command = 'symbolLists'
    ifTrue: [ ^ self findSymbolListDefinitions: (findTokens at: 2) ].
  command = 'category'
    ifTrue: [ ^ self findCategoryClassDefinitions: (findTokens at: 2) ].
  command = 'symbolList'
    ifTrue: [ ^ self findSymbolListClassDefinitions: (findTokens at: 2) ].
  command = 'project'
    ifTrue: [ ^ self findProjectDefinitions: (findTokens at: 2) ].
  command = 'hierarchy'
    ifTrue: [ ^ self findClassHierarchy: (findTokens at: 2) ]