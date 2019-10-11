## Why use dual-repo? 
It's easier to work with github pages this way, since the webpage needs to be published from master. Working with different branches to do this ends up being a pain.

## Initial Setup
1. Clone both this repository and the one at https://github.com/CSEPhd-council/CSEPhd-council.github.io in the same directory, this one named `webmaster`, the other one you should name `publish`.
2. Make sure to either clone this repository with `--recursive` or to run `git submodule update --init --recursive` after cloning to get the website's layout & theme.
3. Get Hugo:
   - [Instructions for MacOs, Linux, BSD](https://gohugo.io/getting-started/installing)
   - [Download for Windows](https://github.com/gohugoio/hugo/releases) the relevant zip and move the contents to `tools/` to have it easily accessible and not have to add it to your path.

## How to work on the dual-repo website?

### Editing
- You can preview your changes by running `hugo serve` (`tools/hugo serve` in Windows) from the root of the webmaster repo. This will start a local server you can access at `//localhost:1313`.
- Create new posts/pages in the `content/` directory. To have them properly published you need to add the *frontmatter*. See one of the already present posts for an example.
  - Right now only the categories "Get Involved" "General Information" "At the Start of Your PhD" "At the End of Your PhD" will show up in the home page.
- The content in the **News** section in the homepage can be edited from `content/news/index.md`.
  
### Publishing
- Once you have made changes, make sure to commit and push them to github so everyone can work from those later. If you have some changes you are working with not ready to be published, commit to a different branch and push it if you want. Make sure to merge it to master when they are ready to be published.
- Run `hugo` to generate the website. This will generate and save the files for the site in `../publish` (that's configured in `config.toml`).
- Go to the `publish` repo you cloned, commit and push the git repository (you should make sure the changes you made are okay, just in case). After that, the updated website should be available momentarily at https://csephd-council.github.io/

## As a contributor? 
You can mark things that need improving with a TODO comment in markdown. The following should be in its own line:

```
[//]: # (TODO: description here)
```
