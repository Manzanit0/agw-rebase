# Git rebase exercise

The repository has two branches: `main` and `feature-branch`. Whenever new code gets merged into
`main` there is a CI/CD pipeline which deploys it to the production server. Your job, as a developer,
is to merge successfully `feature-branch` into `main` without conflicts and with all the tests passing
so the pipeline can deliver the latest version of the application to its customers.

In order to achieve it, **make use of `git rebase`**. In case you run into any conflicts when rebasing,
choose the code in your feature branch and discard that of `main`.

To finalize, before finishing, **squash all the commits** of `feature-branch` into a single commit in order
to make the whole feature self-contained when merged.

## Helpful commands

For rebase:

```
$ git rebase -i <branch_to_merge>
$ git rebase --continue
$ git rebase --abort
$ git rebase -h
```

The project is using Ruby & RSpec, so in order to compile, run the tests,
etc. pick the following commands:

```
$ gem install bundler # In case you don't have bundler
$ bundler install     # To install dependencies
$ ./run               # To run the application
$ ruby <file_name>    # To execute a certain ruby script
$ rspec               # To run all tests
```
