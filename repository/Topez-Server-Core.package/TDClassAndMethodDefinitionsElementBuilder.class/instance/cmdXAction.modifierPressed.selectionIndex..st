as yet unclassified
cmdXAction: listElement modifierPressed: modifierPressed selectionIndex: selectionIndex
  "CMD-x - cut object"

  | itemAttribute def |
  itemAttribute := listElement itemCache at: selectionIndex.
  def := itemAttribute object.
  self objectClipboard: def.
  def removeFromSystem.
  listElement topez commitTransaction.
  ^ STON
    toString:
      {#'addToClipboard:'.
      (def label)}