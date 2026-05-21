library(wordcloud)
library(dplyr)
library(stringr)

# Load data
data <- read.csv("Bunker Data for wordcloud.csv", stringsAsFactors = FALSE)

# =========================
# 1. PICK TEXT COLUMN
# =========================
sentences <- data$ORD

# =========================
# 2. CLEAN DATA
# =========================
sentences <- sentences %>%
  as.character() %>%
  tolower() %>%
  str_replace_all("[[:punct:]]", "") %>%
  str_replace_all("\\s+", " ") %>%
  str_trim()

# Remove bad values
sentences <- sentences[!is.na(sentences) & sentences != ""]

# =========================
# 3. COUNT FREQUENCY
# =========================
sentence_freq <- data.frame(table(sentences), stringsAsFactors = FALSE)
colnames(sentence_freq) <- c("word", "freq")
sentence_freq$word <- as.character(sentence_freq$word)
sentence_freq$freq <- as.numeric(sentence_freq$freq)

# =========================
# 4. DEBUG CHECK
# =========================
sentence_freq %>%
  arrange(desc(freq)) %>%
  head(10)

# =========================
# 5. WORDCLOUD
# =========================
wordcloud(
  words = sentence_freq$word,
  freq = sentence_freq$freq,
  min.freq = 1,
  max.words = 100,
  random.order = FALSE,
  scale = c(1.2, 0.3),   # <-- smaller max size so long sentences fit
  rot.per = 0,            # <-- keeps all sentences horizontal (easier to read)
  colors = brewer.pal(8, "Dark2")
)
# Save as PNG (high resolution for printing)
png("wordcloud.png", width = 3000, height = 2000, res = 300)

wordcloud(
  words = sentence_freq$word,
  freq = sentence_freq$freq,
  min.freq = 1,
  max.words = 100,
  random.order = FALSE,
  scale = c(1.2, 0.3),
  rot.per = 0,
  colors = brewer.pal(8, "Dark2")
)

dev.off()
