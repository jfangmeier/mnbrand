df <- data.frame(
  x = 1:3,
  y = 1:3,
  color = as.character(c(1, 4, 9))
)

library(ggplot2)

test_that("scale_*_mn_d correctly assigns colors", {
  p1 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_mn_d()

  p2 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_mn_d()

  expect_equal(layer_data(p1)$colour, c("#003865", "#78BE21", "#8D3F2B"))
  expect_equal(layer_data(p2)$fill, c("#003865", "#78BE21", "#8D3F2B"))
})
