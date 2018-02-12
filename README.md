## Why using dual-repo? 
  This way we can seperate the concern of:  
  1) website maintenance  
  2) website content contributors  

  Ideally, we should have a larger group of content contributors, i.e. the whole division, but it would be more harmful to have everyone synchronized with the fully rendered repo.  

## How to work on the dual-repo website? 
  Despites it's name, dual-repo solution actually involves 3 git repositories:  
  1) fully rendered static repo (only pushed using ``deploy.sh`` by the web master)
  2) This repo: the generating repo, controlled and maintained by the web master
  3) content repo: `./content`
  

## As a web master? 
  You should inherit the access right to the rendered repo & this one (see section above) from your predecessor.  
  On top of this, make sure you also clone the `./content` correctly.  
  As a web master your job is to (to some degree) keep an eye on the `./content` material before hitting the `deploy.sh`  
  

## As a contributor? 
  Well, you should NOT be here! take a look at the [content repo]().  
