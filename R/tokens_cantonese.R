#' Tokenise Cantonese texts
#'
#' This function tokenises Cantonese texts and create a tokens object.
#'
#' @param corpus a quanteda corpus object
#'
#' @return a tokens object
#' @export
#'
#' @examples
#' \dontrun{
#' corpus %>% tokens_cantonese() %>% dfm()
#' }
tokens_cantonese <- function(corpus){
  sonpath <- find.package("SonGotSTI")
  tokenizer <- jiebaR::worker(type = "mix", dict = file.path(sonpath,"dict", "dict.txt.big"),
                              user = file.path(sonpath,"dict", "SonGotSTI.txt"))
  raw_texts <- quanteda::texts(corpus)
  tokenised_texts_list <- purrr::map(raw_texts, jiebaR::segment, tokenizer)
  tokenised_texts <- purrr::map(tokenised_texts_list, paste, collapse = " ")
  quanteda::texts(corpus) <- tokenised_texts
  return(quanteda::tokens(corpus, what = "fastestword"))
}


