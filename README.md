# Git training

## Merging branches with conflicts

When you're collaborating with others on a git repository, you'll each be working in branches and eventually you'll want to merge them together.

If you've been working on separate pieces of code, git will keep both of your changes and everything will be good.

If you've been working on the same code, you will have to choose which pieces of code to keep and which to discard. This is known as resolving a merge conflict.

### Documentation

| GitHub guides | Atlassian tutorials | git-scm manual | Other blogs/guides |
|---------------|---------------------|----------------|--------------------|
| [About merge conflicts](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/about-merge-conflicts) | [Git Merge](https://www.atlassian.com/git/tutorials/using-branches/git-merge) | [3.2 Git Branching - Basic Branching and Merging](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) | [Creating and Merging Conflicts on Git Branches](https://codeforphilly.github.io/decentralized-data/tutorials/actually-using-git/lessons/conflicting-branches/) |

### Best of Stack Overflow

  * [Resolving merge conflicts in a text editor](https://stackoverflow.com/questions/161813/how-to-resolve-merge-conflicts-in-git-repository/7589612#7589612)

### Quiz

#### Setup

This repository has three branches: `merge_init`, `merge_a` and `merge_b`. Your goal is to merge `merge_a` and `merge_b` together.

What happened is that someone wrote an example script in base R on `merge_init`. Two team members decided separately to convert the code to tidyverse, on branches `merge_a` and `merge_b`. They approached the task differently, and their solutions have different strengths.

#### Goal

Merge `merge_a` and `merge_b` together while choosing the pieces of code you like most.

Hint: here is how you would start this on the command-line, assuming you're already in the repo folder

```
git checkout merge_a
git merge merge_b
```

#### Solutions

[See solutions](./merge_solutions.md)
