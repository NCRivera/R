library(tidyverse) # Loading the package we will use

# Creating a ggplot
ggplot(data = mpg) + # Data = mpg DataFrame
  geom_point(mapping = aes(x = displ, y = hwy)) # X and Y are in aes() func
# dv_Rplot_1

# displ is engine size (x)
# hwy is highway mileage (y)

ggplot(data = mpg) # This creates the first layer of the graphic, nothing shows.

str(mpg) # 234 rows, 11 columns.

?mpg # drv is drive type: 4wheel, front, rear

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cyl)) # A silly plot, doesn't show me anything.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
# 2 seaters are the unusual points on the plot

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
# Not a good idea to tie size to the plot

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
# Shades of grey don't tell me too much as well, in this case.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
# shapes makes more sense but SUV is missing in my plot, it's blank
# book indicates 6 shapes are plotted at one time

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
# plots are now blue

ggplot(data = mpg) + 
  geom_point(
    mapping = aes(x = displ, y = hwy, color = "blue")
  )
# I'm not exactly sure why this is red instead of blue, to fix it color arg has to be outside
# the aes() argument

# Facets argument
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2) # 2 rows for 7 plots/classes of cars

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl) # creates a plot for each combination of variable 
                        # drv at top, cyl to right

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ cyl) # cyl at the top

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl)) # silly plot, these are categorical, no sense.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ .) # first arg indicates the categories on the right, a plot for each value

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ cyl) # second arg indicates categories to the top, plot for each value

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))  # The original scatterplot

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy)) # I think this plots the mean(hwy) by displ

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) # Separate lines for each drv

# Next three demonstrate the differences between the different ways to "group"
ggplot(data = mpg) + # Regular
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + # With drv groups
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv)) 

ggplot(data = mpg) + # drv groups by colors
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

ggplot(data = mpg) + # double mapping with a scatter and line plot
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy)) # There's too much duplication

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + # same as previous code
  geom_point() + 
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping =  aes(color = class)) + 
  geom_smooth(mapping = aes(linetype = drv)) # I added mapping to geom_smooth arg

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + # Our data
  geom_point(mapping = aes(color = class)) + # class is scatterpoints, colored
  geom_smooth(
    data = filter(mpg, class == "subcompact"), # subcompact is a line plot
    se = FALSE
  )

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy, color = drv)
) + 
  geom_point() + # drv values are in color
  geom_smooth(se = FALSE) # lines are in color, based on drv value

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + # These next two are the same
  geom_point() + 
  geom_smooth()

ggplot() + # same as above
  geom_point(
    data = mpg, 
    mapping = aes(x = displ, y = hwy)
  ) + 
  geom_smooth(
    data = mpg, 
    mapping = aes(x = displ, y = hwy)
  )

# Below is practice based on exercises.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(mapping = aes(group = drv), se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv)) + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv)) + 
  geom_smooth(mapping = aes(linetype = drv), se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv))


# Now Bar Plots
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

??geom_bar # help regarding the function

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut)) # same as the previous plot

demo <- tribble(
  ~a, ~b,
  "bar_1", 20,
  "bar_2", 30,
  "bar_3", 40
)
ggplot(data = demo) + # Overriding the default stat transformation
  geom_bar(
    mapping = aes(x = a, y = b), stat = "identity"
  )

ggplot(data = diamonds) + # Overriding the count
  geom_bar(
    mapping = aes(x = cut, y = ..prop.., group = 1)
  )

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

?stat_bin

?stat_summary # Default geom is "pointrange"

ggplot(data = diamonds, mapping = aes(x = cut, y = depth)) + 
  geom_pointrange(mapping = aes(ymin = min, ymax = max)) 
# I couldn't get this to work, will try later

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, color = cut)) # There is a colored line around the bars

ggplot(data = diamonds) + # See plot 32
  geom_bar(mapping = aes(x = cut, fill = cut)) # Bars are filled now with this code

ggplot(data = diamonds) + # Plot 33
  geom_bar(mapping = aes(x = cut, fill = clarity)) # Added another category to fill

ggplot( # Plot 34
  data = diamonds,
  mapping = aes(x = cut, fill = clarity)
) + 
  geom_bar(alpha = 1/5, position = "identity") # Identity position is creating overlap

ggplot( # Plot 35
  data = diamonds,
  mapping = aes(x = cut, color = clarity)
) + geom_bar(fill = NA, position = "identity") # Easier to see the overlap. see bottom V. good

ggplot(data = diamonds) + # Plot 36
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "fill"
  ) # This is great to check the proportion of each clarity 

ggplot(data = diamonds) + # Plot 37
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "dodge"
  ) # Each clairy is a separate bar for comparison

ggplot(data = mpg) + # Plot 38
  geom_point( # The previous scatterplot suffered from overplotting
    mapping = aes(x = displ, y = hwy),
    position = "jitter" # Add noise to the plot
  )

?geom_jitter

# How do I fix the plot below?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()

?mpg

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() # Need another solution

?geom_boxplot

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + # Plot 39
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + # Plot 40
  geom_boxplot() + 
  coord_flip()

nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) + 
  geom_polygon(fill = "white", color = "black")

ggplot(nz, aes(long, lat, group = group)) + 
  geom_polygon(fill = "white", color = "black") + 
  coord_quickmap()