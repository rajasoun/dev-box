Git Guide
=========

###Pull/Commit/Push Commands
```
git pull --rebase # Do This EveryDay before modifing any code 

git add "File Names individually"
git commit -m "Message for the Commit"
git pull --rebase

git pull --rebase
git push origin master

git reset --hard <commit_id> # To Delete commits from remote
git reset --hard HEAD~1 # To Delete From Local
git commit --amend -m "New message here" #To Update Message Added
```

###Knowing what branch you are on
Shows the current branch and the number of unpushed commits.
Also lists the files you've changed and those you still need to add or commit
```
git status
```

###Feature Branching (Fast-Forward Merge)
Start a New Feature (in a New Branch) && Add/Edit Some Files
```
git branch # List branches in the repo with current branch
git checkout -b <branchname> # Create a new branch and switch to it

git add <file>
git commit -m "Start a feature"
```

###Checking out a remote branch
Check out a branch(created by someone else) on your remote repository as a branch on your local repository.
```
git checkout --track -b
  <local branch> <remote>/<tracked branch>
```

###Push the new-feature to Master
```
git push origin <branchname> # Push the branch to your remote repository
```

### Rebase & Merge the new-feature branch
```
git checkout master
git pull --rebase
git merge <branchname>

git push origin master
```

### To Move between Branch & Master
```
git checkout <branchname>
git checkout master
```

###Delete the new-feature branch
```
git branch -d <branchname> # Delete the feature branch:

```

###Productivity Commands
```
git diff # Compare Staging area and What’s last been committed
git whatchanged -n 1 # To View Last Commit Logs
git remote -v # List all currently configured remote repositories
```
