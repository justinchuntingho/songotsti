# songotsti
A Package for Cantonese Tokenisation

## Notes about the name
<img src="man/figures/SonGotSTI.jpg" width="100%" />

The name of the package, Son Got STI, comes from the Cantonese phrase “兒子生性病母倍感安慰”, a famous newspaper headline due to its ambiguity. It can be segmented as “兒子/生性/病母/倍感/安慰” (the sick mother feels comfort as the son is well-behaved) and also as “兒子/生性病/母/倍感/安慰” (the mother feels comfort as the son catches sexually transmitted infections); both of them are grammatically correct.

## Introduction
Tokenization, or unit segmentation, is an often the first step in pre-processing textual data. For Latin languages, tokenization is in general not a big issue due to its syntax, as words are usually separated with whitespaces. However, for Asian languages such as Chinese and Japanese, there is no spaces between characters and therefore tokenizers have to be used to come up with basic word units to allow for further analysis. This package seeks to address this problem.

The package depends on `jiebaR`. The original model is supplemented by the following Cantonese dictionaries (for now, more will be added):
1. Cantonese dictionary generated using Cantonese data from Facebook
2. Cantonese dictionary generated using Cantonese data from Telegram
3. Word list of [粵典](https://words.hk/)
4. Words from [Hong Kong Cantonese Corpus (HKCanCor)](http://compling.hss.ntu.edu.sg/hkcancor/)

## Rationale for the package
There are many packages to perform tokenisation, but most of them are trained with Mandarin data and therefore perform poorly on Cantonese texts. There are also packages that you can train your own model, such as `quanteda`'s `text_collocation()` and `gensim`'s collocation detection. However, training a well-performed model often requires a large amount of data and time, which might not be practical for some researchers. Therefore, this package aims to offer an easier way to conduct Cantonese tokenisation by relying on a Cantonese dictionary generated and validated by the author.

## Installation
```r
devtools::install_github("justinchuntingho/songotsti")
```

## Example
The `tokens_cantonese()` function currently accepts three data types. If the input is a string, it will return a vector:
```r
tokens_cantonese("兒子生性病母倍感安慰")
```

If the input is a vector, it will return a list of vectors:
```r
txt <- c(doc1 = "兒子生性病母倍感安慰",
         doc2 = "今日下午三時半，高等法院就行政長官對梁頌恆、游蕙禎兩人的立法會議員資格提出司法覆核之案件頒發判詞，並判梁、游二人敗訴，亦即二人之議員資格被撤銷。")
tokens_cantonese(txt)
```

The current version supports using in conjunction with `quanteda`. If the input is a corpus, The `tokens_cantonese()` function will return a tokens object. It can also be put into a pipeline:
```r
library(quanteda)
txt_corpus <- corpus(txt)

txt_corpus %>% 
  tokens_cantonese() %>% 
  dfm()
```

## Disclaimer
This is a very raw version and more funtionalities will be added. Contributions, either in the form of pull request, data, or offer to validate new dictionaries, are most welcome.
