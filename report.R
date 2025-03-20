
# This file renders the complete analysis report from the R Markdown file.

#Aim is to predict whether a patient will suffer a fatal myocardial infarction
#Target variable: fatal_mi

# author: "Z0173057"

library(rmarkdown)

set.seed(123)

# Set directory 
#setwd("")

rmarkdown::render(input = "analysis.Rmd",
                  output_file = "analysis_report.html")