# Solutions for merge conflict quiz <!-- omit in toc -->

- [FAQ](#faq)
- [Command-line](#command-line)

## FAQ

  * Why did this merge not happen automatically?
    * If `merge_a` and`merge_b` were in family tree, they would not be parent-child they would be siblings. Git does not know which to favour so it lets you decide.
  * Why did some parts of the code merge automatically?
    * You can see this happen in the last line of `iris.R`. The `View()` of `merge_a` is accepted automatically.
    * The merge is done line-by-line. Since `merge_b` keeps the old `print()` statement but `merge_a` changes it to `View()`, the `View()` is a direct descendant of `print()` and is automatically kept.
  * Does the direction of the merge matter?
    * Not in this case, but it may matter in others. Whichever branch is the most "mainstream" one ought to be the target. You always want to merge your feature branches into your main branch.

## Command-line

Merge conflicts on the command-line are indicated by markers in text files. In this short demo you'll see examples of these.

First, start by switching to your target branch.

```console
$ git checkout merge_a
Switched to branch 'merge_a'
```

Then start the merge with the source branch.

```console
$ git merge merge_b
Auto-merging iris.R
CONFLICT (content): Merge conflict in iris.R
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```

Git has told you which files have conflicts. You can inspect these in a text editor, for example `nano iris.R`.

The file uses markers
  * `<<<<<<< HEAD` is the start of your current branch `merge_a`.
  * `=======` marks the end of `merge_a` and the start of `merge_b`. It's a separator.
  * `>>>>>>> merge_b` marks the end of `merge_b`, which is the source branch.

```
<<<<<<< HEAD
# Pivot and summarize R dataframe
#
# Requirements: tidyverse
# Tested in R 3.6.2
library(tidyr)
library(dplyr)

# Pivot iris dataset
iris_pivot <- pivot_longer(iris,
                           cols = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
                           names_to = "Measure")

# Calculate means of each Species and Measure combination
means <- group_by(iris_pivot, Species, Measure)
means <- summarise_all(means, mean)
means <- ungroup(means)
=======
library(tidyverse)

# Pivot and summarize
iris_pivot <- iris %>%
  pivot_longer(-Species, "Measure") %>%
  group_by(Species, Measure) %>%
  summarise_all(mean) %>%
  ungroup()
>>>>>>> merge_b

# Show results
View(means)
```

You get to choose the solution by just editing the file in your text editor. Get rid of all the markers and tweak the file until you're satisfied.

```
# Pivot and summarize R dataframe
#
# Requirements: tidyverse
# Tested in R 3.6.2
library(tidyverse)

# Pivot and summarize
iris_pivot <- iris %>%
  pivot_longer(-Species, "Measure") %>%
  group_by(Species, Measure) %>%
  summarise_all(mean) %>%
  ungroup()

# Show results
View(means)
```

Do the same for `README.md`. When you're done, treat this as any commit.

```console
$ git add .
$ git commit -m "Merge of merge_b into merge_a"
[merge_a 7b29e7d] Merge of merge_b into merge_a
```

If you look at the commit graph, you'll see that the two branches have fused together into a new commit.
