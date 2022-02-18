# 词法扫描

version: 4.6.0

代码位置 `/src/compiler/scanner.ts`

## 标记

`textToToken` 关键词&符号标记

## 字符

ECMAScript 3th -> next 的Unicode

## 判断

is

## 实践

```ts

const a:number = 123

```

产生的标记（token）

1. ConstKeyword
2. WhitespaceTrivia
3. Identifier
4. ColonToken
5. NumberKeyword
6. WhitespaceTrivia
7. EqualsToken
8. WhitespaceTrivia
9. NumericLiteral
10. EndOfFileToken

## 其它

[scanner.md](https://github.com/microsoft/TypeScript-Compiler-Notes/blob/main/codebase/src/compiler/scanner.md)

[在线工具 生成token](https://5d39df23407c626e65aee7ef--ts-scanner-tokens.netlify.app/)
