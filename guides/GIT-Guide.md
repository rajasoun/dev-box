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

git reset --hard <commit_id> # To Delete commits from remote or Reset Master To The Commit
git reset --hard HEAD~1 # To Delete From Local or Reset local to one commmit before
git commit --amend -m "New message here" #To Update Message Added
```
### Git Workflow 
1. Execute below command , before starting daily work, in that component/sub-system:
```
git pull --rebase
``` 
2. Make changes in your file(s).
3. Do the following:
    1. Check the status of your workspace using:
                ```                                
                   git status
                ```
    2. To see all your changes, please do:
                ```
                   git diff --color
                ```
    3. To add all files:
                ```
                    git add *
                ```
    4. To add one file at a time:
                ```
                    git add  filePath/fileName.ext
                ```
    5. Then, do:
                ```
                    git commit -m "Commit reason(s)"
                ```
 
4. Execute the following (this is done so that your changes made above, will be re-based on top of the remote commits):
                ```
                    git pull --rebase
                ```
5. On any conflicts, do the following:
                                1. Open the file in an editor.
                                2. Keep your or both the changes by editing the file. (e.g)The system displays as below (please note that the conflict is shown with separators - The top portion is your current change(s).
                                                ```
                                                <<<<<<< HEAD
                                                                                <h1> Activity Settings!!!! - !!!!</h1>
                                                =======
                                                                                <h1> Activity Settings!!!!!!!! </h1>
                                                >>>>>>> Test.pls ignore.
                                               ```
                                3. The lines with <<<<  , ==== and >>>> show the changes from you & others changes.
                                4. Edit the contents to have the required changes.
                                                        ```
                                                                                <h1> Activity Settings!!!!!!!! </h1>
                                                        ```
6. Now, do
                            ```
                                git add *
                                git rebase --continue
                            ```
                               
7. Please note that, With the above two commands, the branch has switched to your original branch name.
 
8. Please do:
                            ```
                                git push origin master
                            ```
9. Now your code is pushed into the branch called 'master'  !

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
