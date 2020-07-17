.onLoad <- function(libname, pkgname) {
  # Generating JiebaR worker
  .songotsti_tokenizer <<- jiebaR::worker(type = "mix")
  # Adding songotsti dictionary
  jiebaR::new_user_word(.songotsti_tokenizer, songotsti_dictionary)
  # packageStartupMessage("\u570b\u5bb6\u7d42\u65bc\u6709\u4efb\u52d9\u6bd4\u6211\u5587\uff01")
}
