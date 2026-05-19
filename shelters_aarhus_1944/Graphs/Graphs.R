#first I will load the library
library(ggplot2)

# Read the SCL Funds CSV file
data <- read.csv("Data/SCL_funds.csv", 
                 sep = ";", 
                 header = TRUE,
                 fileEncoding = "UTF-8-BOM")

# Remove the "Sum" row
data <- data[data$Fiscal_year != "Sum", ]

# Create the line graph
ggplot(data, aes(x = Fiscal_year, y = Expenditures, group = 1)) +
  geom_line(color = "#2C3E50", size = 1.2) +
  geom_point(color = "#E74C3C", size = 3) +
  labs(
    title = "SCL expenditures by Fiscal Year",
    x = "Fiscal Year",
    y = "Expenditures DKK",
    caption = "Source: SCL_funds.csv"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major = element_line(color = "gray90"),
    panel.grid.minor = element_blank()
  ) +
  scale_y_continuous(labels = scales::comma)

# Save the plot
ggsave("Plots/scl_funds_plot.png", 
       width = 10, 
       height = 6, 
       dpi = 300)


# Read the Municipal funds CSV file
data2 <- read.csv("data/Municipal_funds.csv", 
                 sep = ";", 
                 header = TRUE,
                 fileEncoding = "UTF-8-BOM")

# Create the bar chart
ggplot(data2, aes(x = Additional_municipal_funds, y = Expenditures)) +
  geom_bar(stat = "identity", fill = "#3498DB", alpha = 0.8) +
  labs(
    title = "Municipal Funds Expenditures by Category",
    x = "Category",
    y = "Expenditures DKK",
    caption = "Source: Municipal_funds.csv"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 9),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = "gray90"),
    panel.grid.minor = element_blank()
  ) +
  scale_y_continuous(labels = scales::comma, expand = c(0, 0), 
                     limits = c(0, max(data2$Expenditures) * 1.1))

# Save the plot
ggsave("Plots/municipal_funds_plot.png", 
       width = 12, 
       height = 6, 
       dpi = 300)


# Read the allocation CSV file
data3 <- read.csv("data/Allocation.csv", 
                  sep = ";", 
                  header = TRUE,
                  fileEncoding = "UTF-8-BOM")


# Create the bar chart
ggplot(data3, aes(x = Use_of_state_funds, y = Expenditures)) +
  geom_bar(stat = "identity", fill = "#3498DB", alpha = 0.8) +
  labs(
    title = "State Expenditures by Category",
    x = "Category",
    y = "Expenditures DKK",
    caption = "Source: Municipal_funds.csv"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 9),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = "gray90"),
    panel.grid.minor = element_blank()
  ) +
  scale_y_continuous(labels = scales::comma, expand = c(0, 0), 
                     limits = c(0, max(data3$Expenditures) * 1.1))

# Save the plot
ggsave("Plots/Allocation_plot.png", 
       width = 12, 
       height = 6, 
       dpi = 300)

