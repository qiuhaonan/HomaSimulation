#!/usr/bin/Rscript

library(ggplot2)
penaltyPerRho <- read.table("output/ideal_vs_simple_penalty_ver1")
penaltyPerRho$avg_delay <- factor(penaltyPerRho$avg_delay)
plotPenaltyPerRho <- ggplot(penaltyPerRho, aes(x = rho, y = penalty))
pdf('plots/PenaltyPerRho.pdf')
plotPenaltyPerRho + geom_line(color = "red", size = 3, alpha = 1/2) + labs(title = expression(frac(1,N)*Sigma*frac(CompletionTime[simple]-CompletionTime[ideal], CompletionTime[ideal]) * "   VS.   Average Load"))
dev.off()

cumDist <- read.table("input/SizeDistribution", col.names=c('CDF','message_size'))
plotDist <- ggplot(cumDist, aes(x = message_size, y = CDF))
pdf('plots/DistributionPlot.pdf')
plotDist + geom_bar(stat = "identity", color = "red", size = 1, alpha = 1/2) + labs(title = "Cumulative Distribution of Message Size")
dev.off()

penaltyPerSize <- read.table("output/ideal_vs_simple_rho_fixed_ver1", header=TRUE)
penaltyPerSize$rho = factor(penaltyPerSize$rho)
plotPenaltyPerSize <- ggplot(penaltyPerSize, aes(x = size, y = penalty))
pdf("plots/PenaltyPerSize.pdf")
plotPenaltyPerSize + geom_line(aes(color = rho), size = 3, alpha = 1/2) + labs(title = expression(frac(1,N)*Sigma*frac(CompletionTime[simple]-CompletionTime[ideal], CompletionTime[ideal]) * "   VS.  Message Sizes"))
dev.off()
