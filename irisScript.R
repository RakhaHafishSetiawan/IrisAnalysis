---
  title: "iris"
author: "Rakha Hafish Setiawan"
date: "`r Sys.Date()`"
output:
  word_document: default
html_document: default
---
  
  ```{r echo=FALSE,include=FALSE}
library(tidyverse)
library(skimr)
library(validate)
```

```{r}
skim(iris)
```



```{r}
iris %>%
  rename(Petal_Length = Petal.Length) %>%
  rename(Petal_Width = Petal.Width) %>%
  rename(Sepal_Width = Sepal.Width) %>%
  rename(Sepal_Length = Sepal.Length) %>%
  mutate(ID = row_number()) %>%
  select(ID, Species, Sepal_Width, Sepal_Length) %>%
  ggplot(aes(Sepal_Length, Sepal_Width)) +
  geom_point(size = 2.5) +
  facet_wrap(~Species) +
  theme_light()
```

```{r}
iris %>%
  ggplot(aes(Sepal.Width))+
  geom_histogram(stat = "count", binwidth = 5) +
  facet_wrap(~Species) +
  labs(y = "")
```
```{r}
iris %>%
  ggplot(aes(Sepal.Length))+
  geom_histogram(stat = "count", binwidth = 5) +
  facet_wrap(~Species)
```

```{r}
iris %>%
  group_by(Species) %>%
  summarise(Count = n())
```
```{r}
test<- validator(
  Sepal.Length > 3.5,
  Sepal.Width > 3.5
)
```

```{r}
cf <- confront(iris, test)
barplot(cf, main = "iris")
```

```{r}
summary(lm(Sepal.Length~Sepal.Width, data = iris))
```
```{r}

iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width)) +
  geom_point(aes(color = Species), size = 1.85) +
  facet_wrap(~Species) +
  geom_smooth(method = "lm", se = FALSE)

```




