# Solutions for merge quiz <!-- omit in toc -->

- [FAQ](#faq)
- [Solutions](#solutions)
  - [Using GitHub](#using-github)
  - [The command line](#the-command-line)

## FAQ

  * Why did this merge happen automatically?
    * Git was able to fast-forward this merge because `merge_a` is a direct descendant of `merge_init`. Because `merge_a` is just a later version of `merge_init`, the merge is unambiguous.
    * Another way of thinking about this is that `merge_a` is not really a branch of `merge_init`. If this were a tree, these would both be part of the trunk.
  * Does the direction of the merge matter?
    * Yes. Git won't let you merge `merge_init` (source) into `merge_a` (target). Because `merge_a` is a direct descendant of `merge_init`, Git will say that there's nothing to do (`Already up to date.`).

## Solutions

### Using GitHub

If you have a GitHub account, you can merge this code with a fork. There is no need to copy any code to your computer.

First, start by creating a fork of the `git_training` repository. You can find the fork button at the top-right.

![The fork button](./images/merge/github_fork.png)

GitHub will ask you where to fork the project. If you fork it to your personal workspace, you'll have a new personal copy of the `git_training` repository.

Next, ask GitHub to start a new pull request. Click on the "Pull requests" tab and you will see bright green button for a "New pull request".

![Starting a new pull request](./images/merge/github_new_pull_request.png)

On the new pull request screen, you can select the branches to merge. In the case of `merge_init <- merge_a`, the merge is automatic!

![Automatic merge is possible](./images/merge/github_auto_merge.png)

### The command line

Using `merge` on the command line will result in a fast-forward merge, which is automatic.

Start by switching to the "base" branch, the branch whose name you want to keep.

```console
$ git checkout merge_init
Switched to branch 'merge_init'
```

Next you can use the merge command to complete the merge.

```console
$ git merge merge_a
Updating acf402a..622e5e4
Fast-forward
 README.md | 13 ++++++++++++-
 iris.R    | 26 ++++++++++++++------------
```
 
The merge is now complete.

```console
$ git status
On branch merge_init
nothing to commit, working tree clean
```
