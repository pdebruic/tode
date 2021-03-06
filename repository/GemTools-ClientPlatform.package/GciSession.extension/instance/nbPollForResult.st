*gemtools-clientplatform
nbPollForResult
  | debuggerChoice terminated |
  GciUserInterruptHandler reset.
  [ 
  | i assoc trigger |
  i := 0.
  trigger := Time now addSeconds: 1.
  [ 
  assoc := self library nbEnd.
  assoc key < 2 ]
    whileTrue: [ 
      i := i + 5 min: 50.
      Time now > trigger
        ifTrue: [ 
          "don't need to be flashing wildly ... an update per second will do"
          [ World displayWorldSafely ] fork.
          trigger := Time now addSeconds: 1 ].
      (Delay forMilliseconds: i) wait.
      GciUserInterruptHandler interrupted
        ifTrue: [ GciUserInterrupt signal ] ].
  ^ assoc value ]
    on: GciUserInterrupt
    do: [ :ex | 
      false
        ifTrue: [ 
          debuggerChoice := UIManager default
            chooseFrom:
              #('Interrupt GemStone/S' 'Interrupt Squeak' 'Ignore Interrupt')
            title: 'User Interrupt Detected'.
          debuggerChoice = 2
            ifTrue: [ 
              [ 
              "interrupte Squeak"
              terminated := true.
              Processor activeProcess debugWithTitle: 'User Interrupt'.
              terminated := false ]
                ensure: [ 
                  terminated
                    ifTrue: [ [ self terminateCurrentNbCall ] fork ] ] ].
          debuggerChoice = 3
            ifTrue: [ 
              "Ignore interrupt"
              ex resume ] ].
      self hardBreak.	"Interrupt GemStone/S"
      ^ self nbPollForResult ]