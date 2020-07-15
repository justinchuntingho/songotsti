

# SonGotSTI
A Package for Cantonese Tokenisation

## Notes about the name
![](https://github.com/justinchuntingho/SonGotSTI/blob/master/SonGotSTI.jpg)

The name of the package comes from the Cantonese phrase “兒子生性病母倍感安慰”, a famous newspaper headline due to its ambiguity. It can be segmented as “兒子/生性/病母/倍感/安慰” (the sick mother feels comfort as the son is well-behaved) and also as “兒子/生性病/母/倍感/安慰” (the mother feels comfort as the son catches sexually transmitted infections); both of them are grammatically correct.

## Introduction
Tokenization, or unit segmentation, is an often the first step in pre-processing textual data. For Latin languages, tokenization is in general not a big issue due to its syntax, as words are usually separated with whitespaces. However, for Asian languages such as Chinese and Japanese, there is no spaces between characters and therefore tokenizers have to be used to come up with basic word units to allow for further analysis. This package addresses this problem.

