library(jsonlite)
#library(RJSONIO)
data1 <- read_json("Demo1.json")
data1
json_file <- lapply(data1, function(x) {
  x[sapply(x, is.null)] <- NA
  unlist(x)
})
final=matrix(unlist(json_file),ncol = 8, byrow = TRUE)

#file=data.frame(final)
file=data.frame(data1)
file
output <-- do.call("rbind", json_file)
write.csv(a, file="json.csv",row.names = FALSE)
file.show("json.csv")

m <- matrix(data=cbind(rnorm(30, 0), rnorm(30, 2), rnorm(30, 5)), nrow=30, ncol=3)
m
apply(m, 1, mean)
