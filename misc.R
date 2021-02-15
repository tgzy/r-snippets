load("/cloud/project/overall_bigrams.Rda")
load("/cloud/project/overall_trigrams.Rda")
load("/cloud/project/overall_unigrams.Rda")

nrow0 <- function(x) dim(x)[1]
chunk2 <- function(x,n) split(x, cut(seq_along(x), n, labels = FALSE))
coverage_words <- function(percentage, count_tibble){
  i <- 1
  total <- sum(count_tibble$n)
  help <- 0
  a <- 0
  while(a < percentage){
    summe <- count_tibble$n[i] + help
    help <- summe
    i <- i + 1
    a <- summe/total
  }
  return(i)
}

vectors <- vector(mode="list", length = 3)
vectors <- list("overall_bigrams" = overall_bigrams,
             "overall_trigrams" = overall_trigrams,
             "overall_unigrams" = overall_unigrams)

nameOf <- function(vector, index) {
  return(names(vector[index]))
}
nameOf(vectors, 2)
# save(overall_bigrams, file="overall_bigrams.Rda")
# save(overall_trigrams, file="overall_trigrams.Rda")
# save(overall_unigrams, file="overall_unigrams.Rda")
