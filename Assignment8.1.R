# curl or httr package: These packages provide functions for making HTTP requests in R and might handle SSL connections differently.
library(curl)
library(ggplot2)
url="https://raw.githubusercontent.com/biocorecrg/CRG_RIntroduction/master/ex12_normalized_intensities.csv";
df=read.csv(curl(url));
#Q1 Create a simple scatter plot representing gene expression of “sampleB” on the x-axis and “sampleH” on the y-axis.
plot(df$sampleB,df$sampleH,xlab = "SampleB",ylab = "SampleH")

scatter_plot <- ggplot(df, aes(x = sampleB, y = sampleH)) +
  geom_point() +
  labs(title = "Scatter Plot of Gene Expression",
       x = "Expression in sampleB",
       y = "Expression in sampleH")

#Q2 Add a column to the data frame “project1” (call this column “expr_limits”), that will be filled the following way:
#i) if the expression of a gene is > 13 in both sampleB and sampleH, set to the value in “expr_limits” to “high
#ii) if the expression of a gene is < 6 in both sampleB and sampleH, set it to “low”
#iii) if different, set it to “normal”

df$expr_limits <- ifelse(df$sampleB > 13 & df$sampleH > 13, "high",
                               ifelse(df$sampleB < 6 & df$sampleH < 6, "low", "normal"))

#Q3  Color the points of the scatter plot according to the newly created column “expr_limits”. Save that plot in the object “p”.
scatter_plot_colored <- ggplot(df, aes(x = sampleB, y = sampleH, color = expr_limits)) +
  geom_point() +
  labs(title = "Scatter Plot with Expression Limits",
       x = "Expression in sampleB",
       y = "Expression in sampleH")

#Q4 Produce a boxplot of the expression of all samples (i.e. each sample is represented by a box).
#single sample
box_plot_single_samples <- ggplot(df, aes(x = factor(1), y = sampleB)) +
  geom_boxplot() +
  labs(title = "Boxplot of Expression for All Samples",
       x = "Sample",
       y = "Gene Expression")
#multiple sample
box_plot_all_samples <- ggplot(df, aes(x = factor(sample), y = sample, fill = sample)) +
  geom_boxplot() +
  labs(title = "Boxplot of Expression for All Samples",
       x = "Sample",
       y = "Gene Expression") +
  theme_minimal()

#Q5 Modify the previous boxplot so as to obtain 3 “sub-boxplots” per sample, each representing the expression of either “low”, “normal” or “high” genes.
box_plot_sub_samples <- ggplot(df, aes(x = factor(1), y = sampleB, fill = expr_limits)) +
  geom_boxplot() +
  labs(title = "Boxplot with Sub-Boxplots",
       x = "Sample",
       y = "Gene Expression")+
  scale_fill_manual(values = c("low" = "blue", "normal" = "green", "high" = "red"))

#Q6 Produce a bar plot of how many low/normal/high genes are in the column “expr_limits” of “project1”
bar_plot_expr_limits <- ggplot(project1, aes(x = expr_limits)) +
  geom_bar() +
  labs(title = "Bar Plot of Gene Expression Limits",
       x = "Expression Limits",
       y = "Count")
  
  