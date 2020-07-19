tokenize_jieba <- function(texts){
  return(purrr::map(texts, jiebaR::segment, .songotsti_tokenizer))
}

#' Tokenise Cantonese texts
#'
#' This function tokenises Cantonese texts and create a tokens object.
#'
#' @param x string, character vector, or quanteda corpus object
#'
#' @return a tokens object
#' @export
#'
#' @examples
#' \dontrun{
#' corpus %>% tokens_cantonese() %>% dfm()
#' }
tokens_cantonese <- function(x){
  if(quanteda::is.corpus(x)){  # if corpus
    raw_texts <- quanteda::texts(corpus)
    tokenised_texts <- tokenize_jieba(raw_texts)
    return(quanteda::as.tokens(tokenised_texts))
  } else if(is.character(x) & length(x) == 1){ # if string
    return(unlist(tokenize_jieba(x)))
  } else if(is.character(x)){ # if character vector
    return(tokenize_jieba(x))
  } else {
    cat("Unknown data type")
  }
}

