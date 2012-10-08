class initialization
initialize
    "super initialize.
	self initialize"

    self
        at: #'error'
            forClasses: #('TZHeaderGemStone' 'TZHeaderNative')
            put: [ :proxy :aStream :indent | proxy renderWith: (TextColor color: Color red) on: aStream indent: indent ];
        at: #'breakpoint'
            forClasses: #('TZHeaderGemStone' 'TZHeaderNative')
            put: [ :proxy :aStream :indent | proxy renderWith: (TextColor color: Color magenta) on: aStream indent: indent ];
        at: #'basic'
            forClasses: #('TZHeaderGemStone' 'TZHeaderNative')
            put: [ :proxy :aStream :indent | proxy renderWith: (TextColor color: Color blue) on: aStream indent: indent ];
        at: #'basic' forClass: 'TZMethodElement' put: [ :proxy :aStream :indent | aStream nextPutAll: proxy selector ];
        at: #'basic'
            forClass: 'TZClassHierarchyElement'
            put: [ :proxy :aStream :indent | 
                    | space |
                    space := ''.
                    proxy indent timesRepeat: [ space := space , '   ' ].
                    aStream
                        nextPutAll:
                            (Text
                                string: space , proxy elementName
                                attribute:
                                    (proxy inExtensionClassList
                                        ifTrue: [ TextEmphasis italic ]
                                        ifFalse: [ TextEmphasis bold ])) ];
        at: #'basic'
            forClass: 'TZStack'
            put: [ :stack :aStream :indent | 
                    | currentFrameIndex size |
                    currentFrameIndex := stack currentFrameIndex.
                    size := stack indexed size.
                    1 to: size do: [ :frameIndex | 
                        | stackFrame |
                        stackFrame := stack at: frameIndex.
                        frameIndex = currentFrameIndex
                            ifTrue: [ 
                                aStream
                                    nextPutAll:
                                        (Text
                                            string: '==> '
                                            attributes:
                                                {(TextEmphasis bold).
                                                (TextColor red)}) ].
                        stackFrame renderText: #'basic' on: aStream indent: indent.
                        frameIndex < size
                            ifTrue: [ aStream cr ] ] ];
        at: #'basic'
            forClass: 'TZStackFrame'
            put: [ :proxy :aStream :indent | 
                    aStream
                        tab: indent;
                        nextPutAll: proxy frameIndex proxyPrintString;
                        space;
                        nextPutAll: (Text string: proxy inClass className attribute: TextEmphasis bold);
                        nextPutAll:
                                (Text
                                        string: ' >> '
                                        attributes:
                                            {(TextEmphasis bold).
                                            (TextColor gray)});
                        nextPutAll:
                                (Text
                                        string: proxy selector proxyPrintString
                                        attributes:
                                            {(TextEmphasis bold).
                                            (TextColor blue)});
                        tab: 2;
                        nextPutAll: '@' , proxy stepPoint proxyPrintString;
                        nextPutAll: ' line ';
                        nextPutAll: proxy stepPointLineNumber proxyPrintString;
                        cr;
                        tab: indent + 1;
                        nextPutAll: 'receiver';
                        space.
                    proxy receiver renderText: #'basic' on: aStream ];
        at: #'basic'
            forClass: 'TZNativeStackFrame'
            put: [ :proxy :aStream :indent | 
                    aStream
                        tab: indent;
                        nextPutAll: proxy frameIndex proxyPrintString;
                        space;
                        nextPutAll: (Text string: proxy inClass className attribute: TextEmphasis bold);
                        nextPutAll:
                                (Text
                                        string: ' >> '
                                        attributes:
                                            {(TextEmphasis bold).
                                            (TextColor gray)});
                        nextPutAll:
                                (Text
                                        string: proxy selector proxyPrintString
                                        attributes:
                                            {(TextEmphasis bold).
                                            (TextColor blue)});
                        cr;
                        tab: indent + 1;
                        nextPutAll: 'receiver';
                        space.
                    proxy receiver renderText: #'basic' on: aStream ];
        at: #'basic'
            forClasses: #('TZProxyError' 'TZProxyBreakpoint')
            put: [ :proxy :aStream :indent | proxy header renderText: proxy renderAttribute on: aStream ]