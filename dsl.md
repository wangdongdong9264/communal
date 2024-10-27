# domain specific language

A domain-specific language is created specifically to solve problems in a particular domain and is not intended to be able to solve problems outside of it (although that may be technically possible)

## category

1. internal dsl
2. external dsl
3. Language Workbench（dsl gui）

## relationship

### understandability

workbench >  external dsl > internal dsl（declarative） > command-query api (imperative)

### difficulty

workbench >  external dsl > internal dsl（declarative） > command-query api (imperative)

## when should i use it

when the benefits of using a dsl outweigh the cost of building it

## simple tutorial (external dsl)

base `domain specific language` book and use typescript translate

### state machine model



### custom syntax

```js

events
    doorClosed   D1CL
    drawerOpened D2OP
    lightOn      L1ON
    doorOpened   D1OP
    panelClosed  PNCL
end

resetEvents
    doorOpened
end

commands
    unlockPanel PNUL
    lockPanel   PNLK
    lockDoor    D1LK
    unlockDoor  D1UL
end

state idle
    actions {unlockDoor lockPanel}
    doorClosed => active
end

state active
    drawerOpened => waitingForLight
    lightOn => waitingForDrawer
end

state waitingForLight
    lightOn => unlockedPanel
end

state waitingForDrawer
    drawerOpened => unlockedPanel
end

state unlockedPanel
    actions {unlockPanel lockDoor}
    panelClosed => idle
end

```

### lexical parser

### syntax parser

### parser combinators

### parser generator（antlr）

## other

[wikipedia dsl](https://en.wikipedia.org/wiki/Domain-specific_language)

[jetbrains dsl](https://www.jetbrains.com/mps/concepts/domain-specific-languages/)

[domain specific language](https://www.amazon.com/Domain-Specific-Languages-Addison-Wesley-Signature-Fowler/dp/0321712943)

[language deplementation patterns](https://www.amazon.com/Language-Implementation-Patterns-Domain-Specific-Programming/dp/193435645X)

[antlr 4](https://www.amazon.com/Definitive-ANTLR-4-Reference/dp/1934356999)

[antlr.org](https://www.antlr.org/index.html)

[antlr 4 ts](https://github.com/tunnelvisionlabs/antlr4ts)
