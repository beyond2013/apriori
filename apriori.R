library(arules)
#setwd("D:/TransactionFiles")
files <- list.files(path = "./transactionfiles", pattern = "*.txt")
for(i in 1:length(files))
{
f <-   file(paste0("./transactionfiles/", files[i]))
transactions = read.transactions(file = f ,format = "basket", sep = ",")
close(f)
freqItemsets <- apriori(transactions,parameter = list(minlen=2, maxlen=3,sup=0.6,target="frequent itemsets"))

write.csv(as(freqItemsets, "data.frame"), file= paste0("Output", i, ".txt"))
}