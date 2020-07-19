#' Add Custom Words
#'
#' @param words string or character vector, words to be added
#'
#' @return
#' @export
#'
#' @examples
#' add_custom_words("\u662f\u5481\u7684")
add_custom_words <- function(words, worker = .songotsti_tokenizer){
  if(jiebaR::new_user_word(worker, words)){
    message("Done! \u652a\u6382!")
  }
}
