#' Add Custom Words
#'
#' @param words string or character vector, words to be added
#'
#' @return
#' @export
#'
#' @examples
#' add_custom_words("\u662f\u5481\u7684")
add_custom_words <- function(words){
  if(jiebaR::new_user_word(.songotsti_tokenizer, words)){
    message("Done! \u652a\u6382!")
  }
}
