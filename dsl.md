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

![dsl miss state](https://img.wangdongdong9264.xyz/dsl_miss_state.png)

[code](https://github.com/wangdongdong9264/dsl_tutarial/blob/main/src/step_1/index.ts)

[test](https://github.com/wangdongdong9264/dsl_tutarial/blob/main/tests/step_1/index.test.ts)

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

process: input > scannerPatterns scanRecognizer > tokens > stateMachineTokenizer

[code](https://github.com/wangdongdong9264/dsl_tutarial/blob/main/src/step_2/index.ts)

[test](https://github.com/wangdongdong9264/dsl_tutarial/blob/main/tests/step_2/index.test.ts)

### syntax parser

[code](https://github.com/wangdongdong9264/dsl_tutarial/blob/main/src/step_3/index.ts)

[test](https://github.com/wangdongdong9264/dsl_tutarial/blob/main/tests/step_3/index.test.ts)

### parser combinators

[code](https://github.com/wangdongdong9264/dsl_tutarial/blob/main/src/step_4/index.ts)

[test](https://github.com/wangdongdong9264/dsl_tutarial/blob/main/tests/step_4/index.test.ts)

### parser generator（antlr）

[code](https://github.com/wangdongdong9264/dsl_tutarial/blob/main/src/step_5/index.ts)

[test](https://github.com/wangdongdong9264/dsl_tutarial/blob/main/tests/step_5/index.test.ts)

## other

[wikipedia dsl](https://en.wikipedia.org/wiki/Domain-specific_language)

[jetbrains dsl](https://www.jetbrains.com/mps/concepts/domain-specific-languages/)

[domain specific language](https://www.amazon.com/Domain-Specific-Languages-Addison-Wesley-Signature-Fowler/dp/0321712943)

[language deplementation patterns](https://www.amazon.com/Language-Implementation-Patterns-Domain-Specific-Programming/dp/193435645X)

[antlr 4](https://www.amazon.com/Definitive-ANTLR-4-Reference/dp/1934356999)

[antlr.org](https://www.antlr.org/index.html)

[antlr 4 ts](https://github.com/tunnelvisionlabs/antlr4ts)
