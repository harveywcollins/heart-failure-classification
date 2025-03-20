library(tfruns)
library(keras)

FLAGS <- flags(
  flag_integer("units", 32L),
  flag_numeric("dropout_rate", 0.01),
  flag_integer("epochs", 65L),
  flag_integer("batch_size", 90L),
  flag_numeric("learning_rate", 1e-03)
)

train_x <- readRDS("train_x.rds")
train_y <- readRDS("train_y.rds")
validation_x <- readRDS("validation_x.rds")
validation_y <- readRDS("validation_y.rds")

build_model <- function() {
  input <- layer_input(shape = c(ncol(train_x)))
  
  output <- input %>%
    layer_dense(units = FLAGS$units, activation = "relu") %>%
    layer_batch_normalization() %>%
    layer_dropout(rate = FLAGS$dropout_rate)  %>%
    layer_dense(units = FLAGS$units, activation = "relu")  %>%
    layer_batch_normalization() %>%
    layer_dropout(rate = FLAGS$dropout_rate) %>%
    layer_dense(units = 1, activation = "sigmoid")
  
  
  model <- keras_model(inputs = input, outputs = output)
  
  model$compile(
    loss = "binary_crossentropy",
    optimizer = optimizer_rmsprop(learning_rate = FLAGS$learning_rate),
    metrics = list("accuracy", metric_auc())
  )
  
  model
}

model <- build_model()

early_stop <- callback_early_stopping(monitor = "val_loss", patience = 5)
history <- model$fit(
  train_x, train_y,
  epochs = FLAGS$epochs,
  batch_size = FLAGS$batch_size,
  validation_data = list(validation_x, validation_y),
  callbacks = list(early_stop)
)

score <- model$evaluate(validation_x, validation_y)
cat("Validation accuracy:", score[[2]], "\n")
cat("Validation AUC:", score[[3]], "\n")

write_run_metadata(data = list(metric_auc = score[[3]]), type = "metrics")
