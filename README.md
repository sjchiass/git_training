# Git training <!-- omit in toc -->

- [Start here :bulb:](#start-here-bulb)
  - [How to copy this to your computer](#how-to-copy-this-to-your-computer)
  - [Download a zip file](#download-a-zip-file)
  - [View the raw files](#view-the-raw-files)
- [Topics](#topics)
  - [Merging branches with and without conflicts](#merging-branches-with-and-without-conflicts)
    - [Documentation](#documentation)
    - [Best of Stack Overflow](#best-of-stack-overflow)
    - [Quiz: simple merge :fast_forward:](#quiz-simple-merge-fast_forward)
    - [Quiz: merge conflicts :collision:](#quiz-merge-conflicts-collision)

# Start here :bulb:

## How to copy this to your computer

This repository includes its own examples, which are used in the exercises below. In order to get all of this on your computer, you need to use these commands to do a deep clone of the repository ([Stack Overflow](https://stackoverflow.com/a/7216269)):

```
git clone https://github.com/sjchiass/git_training.git ./git_training/.git --mirror
cd git_training/
git config --bool core.bare false
git reset --hard
git config user.email "someone@example.com" && git config user.name "someone"
```
The commands above will set a *local* user name and e-mail that will only affect `git_training`. Using local configurations is a good idea! If you're using git for both work and hobby, it's not a good idea to set a global configuration because you might accidentally switch the two!

![Cloning in Ubuntu](./images/clone_success.png)

The repository with all of its extras will appear in a folder called `git_training`.

Don't worry about breaking anything! You can always delete the `git_training` folder and `clone` yourself a replacement.

## Download a zip file

You can find specially-made zip files that include the configured git repository from the above commands.

The files called `git_training.zip` here are repository copies: <https://github.com/sjchiass/git_training/releases/tag/v0.1.0>

The other zip files only have the source code, and you won't have a git repository when you open them. In order to do the quiz questions below, you need to have a copy of the git repository.

## View the raw files

This repository includes branches that are used for the exercises below. These branches are also available as folders in the default branch of this repository.

You can also view these branches in the [raw_branches subfolder](./raw_branches).

If you wanted to recreate one of these branches,

  * use `git checkout -b my_new_branch` to start a new branch
  * delete everything in the repo (except the `.git` folder)
  * paste the contents of the raw folder
  * then `git commit -m "Made new branch"`

# Topics

## Merging branches with and without conflicts

When you're collaborating with others on a git repository, you'll each be working in branches and eventually you'll want to merge them together.

If you've been working on separate pieces of code, git will keep both of your changes and everything will be good.

If you've been working on the same code, you will have to choose which pieces of code to keep and which to discard. This is known as resolving a merge conflict.

### Documentation

| GitHub guides | Atlassian tutorials | git-scm manual | Other blogs/guides |
|---------------|---------------------|----------------|--------------------|
| [About merge conflicts](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/about-merge-conflicts) | [Git Merge](https://www.atlassian.com/git/tutorials/using-branches/git-merge) | [3.2 Git Branching - Basic Branching and Merging](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) | [Creating and Merging Conflicts on Git Branches](https://codeforphilly.github.io/decentralized-data/tutorials/actually-using-git/lessons/conflicting-branches/) |

### Best of Stack Overflow

  * [What is git fast forwarding](https://stackoverflow.com/questions/29673869/what-is-git-fast-forwarding)
  * [How to resolve conflicts in a text editor and other merge advice](https://stackoverflow.com/questions/161813/how-to-resolve-merge-conflicts-in-git-repository/7589612#7589612)

### Quiz: simple merge :fast_forward:

__Setup__ This repository has two branches: `merge_init` and `merge_a`.

__Story__ You wrote an example script in base R on `merge_init` and then forgot about it. One of your colleagues decided to improve the script in the `merge_a` branch. They've let you know that their work is done and you can merge the changes whenever you want. As the project leader, you want to incorporate these changes to the main branch.

__Goal__ Merge `merge_a` onto `merge_init`.

__Solutions__ [See solutions](./merge_solutions.md)

### Quiz: merge conflicts :collision:

__Setup__ This repository has three branches: `merge_init`, `merge_a` and `merge_b`.

__Story__ You wrote an example script in base R on `merge_init` and then forgot about it. Two team members decided separately to convert the code to tidyverse, on branches `merge_a` and `merge_b`. They approached the task differently, and their solutions have different strengths. As the project leader, you are in charge of choosing what to keep.

__Goal__ Merge `merge_a` and `merge_b` together while choosing the pieces of code you like most.

Hint: here is how you would start this on the command-line, assuming you're already in the repo folder

```console
$ git checkout merge_a
$ git merge merge_b
Auto-merging iris.R
CONFLICT (content): Merge conflict in iris.R
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```

__Solutions__ [See solutions](./merge_conflicts_solutions.md)
