choices <- "faithful"
input <- 30

x <- data.frame(rbind(data.frame(value = cars[,2],
                                           group = "cars"),
                                data.frame(value = faithful[,2],
                                           group = "faithful"),
                                data.frame(value = iris[,1],
                                           group = "iris"),
                                data.frame(value = BJsales,
                                           group = "bjsales")
) %>%
  filter(group == choices))[,1]
bins <- seq(min(x), max(x), length.out = input + 1)

hist(x, breaks = bins, col = 'darkgray', border = 'white')
