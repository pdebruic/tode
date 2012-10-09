tests
testRun1
    | result doit x |
    self pushPrintBlocks.
    doit := '{ 1. 0. -1. {true. false.}. nil }'.
    result := self runNoError: doit.
    self
        assert:
            (x := result printString)
                =
                    '[Array] anArray( 1, 0, -1, a...etc...
#1 [SmallInteger] 1
#2 [SmallInteger] 0
#3 [SmallInteger] -1
#4 [Array] anArray( true, false...etc...
#5 [UndefinedObject] nil'