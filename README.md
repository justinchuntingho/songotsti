# SonGotSTI
A Package for Cantonese Tokenisation

## Notes about the name
<img src="man/figures/SonGotSTI.jpg" width="100%" />

The name of the package comes from the Cantonese phrase “兒子生性病母倍感安慰”, a famous newspaper headline due to its ambiguity. It can be segmented as “兒子/生性/病母/倍感/安慰” (the sick mother feels comfort as the son is well-behaved) and also as “兒子/生性病/母/倍感/安慰” (the mother feels comfort as the son catches sexually transmitted infections); both of them are grammatically correct.

## Introduction
Tokenization, or unit segmentation, is an often the first step in pre-processing textual data. For Latin languages, tokenization is in general not a big issue due to its syntax, as words are usually separated with whitespaces. However, for Asian languages such as Chinese and Japanese, there is no spaces between characters and therefore tokenizers have to be used to come up with basic word units to allow for further analysis. This package seeks to address this problem.

The package depends on `jiebaR`. The original model is supplemented by a Cantonese dictionary generated using Cantonese data from Facebook (for now, more will be added).

## Rationale for the package
There are many packages to perform tokenisation, but most of them are trained with Mandarin data and therefore perform poorly on Cantonese texts. There are also packages that you can train your own model, such as `quanteda`'s `text_collocation()` and `gensim`'s collocation detection. However, training a well-performed model often requires a large amount of data and time, which might not be practical for some researchers. Therefore, this package aims to offer an easier way to conduct Cantonese tokenisation by relying on a Cantonese dictionary generated and validated by the author.

## Installation
```r
devtools::install_github("justinchuntingho/SonGotSTI")
```

## Example
The current version supports using in conjunction with `quanteda`.

Setting up:
```r
library(quanteda)
txt <- c(doc1 = "兒子生性病母倍感安慰",
         doc2 = "今日下午三時半，高等法院就行政長官對梁頌恆、游蕙禎兩人的立法會議員資格提出司法覆核之案件頒發判詞，並判梁、游二人敗訴，亦即二人之議員資格被撤銷。")
txt_corpus <- corpus(txt)
```

The library adds `tokens_cantonese()` function to the `quanteda` toolbox, which can be put into the pipe line:
```r
txt_corpus %>% 
  tokens_cantonese() %>% 
  dfm()
```

## Disclaimer
This is a very raw version and more funtionalities will be added. Contributions, either in the form of pull request, data, or offer to validate new dictionaries, are most welcome.
