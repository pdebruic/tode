editting
editList: aCollectionOfObjects selection: selectedObject renderAttribute: renderAttribute templateElement: templateElement label: labelString inWindow: windowIdOrNil at: windowLocation
    | windowId label newWindow win selectedIndex |
    windowId := windowIdOrNil ifNil: [ windowId := self nextAvailableWindowId ].
    windowId == 0
        ifTrue: [ windowId := self nextAvailableWindowId ].
    self currentWindowId: windowId.
    label := labelString.
    newWindow := (self status windowAt: windowId) isNil.
    selectedIndex := 0.
    selectedObject ifNotNil: [ selectedIndex := aCollectionOfObjects indexOf: selectedObject ].
    (win := self editorWindowAt: windowId) model
        activateListEditor;
        setListIndex: selectedIndex;
        renderAttribute: renderAttribute;
        list: aCollectionOfObjects;
        windowId: windowId;
        label: label.
    win model activeEditor emptyTemplateElement: templateElement.
    newWindow
        ifTrue: [ 
            | bounds |
            bounds := self bounds
                at: windowLocation
                ifAbsent: [ self error: 'Unknown window location: ' , windowLocation printString ].
            win
                extent: bounds extent;
                position: bounds origin ].
    ^ ''