as yet unclassified
installOn: aTDTopezServer
  aTDTopezServer ensureChildrenExistIn: self commandPath.
  super installOn: aTDTopezServer.
  TDTopezServer
    registerEditorClass: TDMergerClientListElementBuilder
      for: TDMerger
      aspect: #'merge';
    registerEditorClass: TDClientMergeOperationSourceElementBuilder
      for: TDMergeOperation
      aspect: #'edit'