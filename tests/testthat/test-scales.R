df <- data.frame(
  x = 1:3,
  y = 1:3,
  color = c(1, 4, 9)
)

library(ggplot2)

test_that("scale_*_mn_d correctly assigns colors", {
  p1 <- ggplot(df, aes(x, y, color = as.factor(color))) +
    geom_point() +
    scale_color_mn_d()

  p2 <- ggplot(df, aes(x, y, fill = as.factor(color))) +
    geom_raster() +
    scale_fill_mn_d()

  expect_equal(layer_data(p1)$colour, c("#003865", "#78BE21", "#8D3F2B"))
  expect_equal(layer_data(p2)$fill, c("#003865", "#78BE21", "#8D3F2B"))
})

test_that("scale_*_mn_d works when called from another function", {
  colour_fun <- function() {
    ggplot(df, aes(x, y, colour = as.factor(color))) +
      geom_point() +
      scale_colour_mn_d()
  }
  
  color_fun <- function() {
    ggplot(df, aes(x, y, colour = as.factor(color))) +
      geom_point() +
      scale_color_mn_d()
  }
  
  fill_fun <- function() {
    ggplot(df, aes(x, y, colour = as.factor(color))) +
      geom_point() +
      scale_fill_mn_d()
  }
  
  gg_colour_real <- ggplot(df, aes(x, y, colour = as.factor(color))) +
    geom_point() +
    scale_colour_mn_d()
  
  gg_color_real <- ggplot(df, aes(x, y, colour = as.factor(color))) +
    geom_point() +
    scale_color_mn_d()
  
  gg_fill_real <- ggplot(df, aes(x, y, colour = as.factor(color))) +
    geom_point() +
    scale_fill_mn_d()
  
  gg_colour_fun <- colour_fun()
  gg_color_fun <- color_fun()
  gg_fill_fun <- fill_fun()
  
  expect_equal(
    layer_data(gg_colour_real)$colour,
    layer_data(gg_colour_fun)$colour
  )
  
  expect_equal(
    layer_data(gg_color_real)$colour,
    layer_data(gg_color_fun)$colour
  )
  
  expect_equal(
    layer_data(gg_fill_real)$fill,
    layer_data(gg_fill_fun)$fill
  )
})

test_that("scale_*_mn_c works with named and index colors", {
  p1 <- ggplot(df, aes(x, y, colour = color)) +
    geom_point() +
    scale_colour_mn_c(
      high_color = "minnesota_blue"
    )
  
  p2 <- ggplot(df, aes(x, y, colour = color)) +
    geom_point() +
    scale_colour_mn_c(
      high_color = 1
    )
  
  p3 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_mn_c(
      high_color = "minnesota_green"
    )
  
  p4 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_mn_c(
      high_color = 2
    )
  
  p5 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_mn_c(
      high_color = "accent_teal"
    )
  
  p6 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_mn_c(
      high_color = 3
    )
  
  expect_equal(
    layer_data(p1)$colour, 
    layer_data(p2)$colour
  )
  
  expect_equal(
    layer_data(p3)$colour, 
    layer_data(p4)$colour
  )
  
  expect_equal(
    layer_data(p5)$fill, 
    layer_data(p6)$fill
  )
})

test_that("scale_*_mn_c calculates diverging colors correctly", {
  p1 <- ggplot(df, aes(x, y, colour = color)) +
    geom_point() +
    scale_colour_mn_c(
      high_color = "minnesota_blue",
      low_color = "minnesota_green",
      diverge = TRUE,
      midpoint = median(df$color)
    )
  
  p2 <- ggplot(df, aes(x, y, colour = color)) +
    geom_point() +
    scale_color_gradient2(
      low = "#78BE21", 
      high = "#003865",
      midpoint = median(df$color))
  
  p3 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_colour_mn_c(
      high_color = "minnesota_blue",
      low_color = "minnesota_green",
      diverge = TRUE,
      midpoint = median(df$color)
    )
  
  p4 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_gradient2(
      low = "#78BE21", 
      high = "#003865",
      midpoint = median(df$color))
  
  p5 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_mn_c(
      high_color = "minnesota_blue",
      low_color = "minnesota_green",
      diverge = TRUE,
      midpoint = median(df$color)
    )
  
  p6 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_gradient2(
      low = "#78BE21", 
      high = "#003865",
      midpoint = median(df$color))
  
  expect_equal(
    layer_data(p1)$colour, 
    layer_data(p2)$colour
  )
  
  expect_equal(
    layer_data(p3)$colour, 
    layer_data(p4)$colour
  )
  
  expect_equal(
    layer_data(p5)$fill, 
    layer_data(p6)$fill
  )
})

