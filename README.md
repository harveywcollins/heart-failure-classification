# Heart-failure-classification

This repository contains the code for predicting fatal myocardial infarctions (heart failure mortality) using various machine learning and deep learning models in R. The analysis explores data preprocessing, model fitting, hyperparameter tuning, performance assessment (via cross-validation and test sets), and calibration/threshold tuning to optimise sensiticity in a clinical context.

# Repository Structure
- analysis.Rmd
The primary R Markdown file containing data exploration, model training code, hyperparameter tuning, calibration plots, threshold analysis and final model evaluation.
- report.R
A master R script that runs the main analysis. This file would run to produce the final outputs (HTML report).
- data
- optimise_deepNN.r
A script employing `tfruns` for hyperparameter tuning of the deep neueral network.

# Usage
1. Clone or Download this repository to your local machine.
2. Open R/Rstudio and ensure you have the required packages installed (listed in `analysis.Rmd`).
3. Run `report.R` to reproduce figures and metrics.
4. View the final output (HTML).

# Requirements
- R.4.4.2 or later
- Packages: `caret`, `pROC`, `randomForest`, `gbm`, `e1071`, `nnet`, `rpart`, `keras`, `reticulate`, `mlr3verse`, `DataExplorer`, `tfruns`, etc.
- TensorFlow enviornment (if running deep Keras models) and a working Python environment with the appropiate packages if using `reticulate`.
