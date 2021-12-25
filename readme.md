# Neovim config in nix flake
## todo:
- [x] create git repo with neovim as a dependency
- [x] run nix-shell with this flake as a installed program
- [x] run neovim for shell
	* [x] make config echo something inline
	* [x] make nvim read config from other file
	* [ ] make nvim require multiple files
			
## run the flake
``` bash
nix run .#neovim-telescope 
```

## problems to solve 
- [ ] loading lua files without wrapping them with a vimrc.vim file
- [ ] requiring lua files frim the nvim runtime
	            i have solved loading a lua file into the nvim runtime, but when this file requires other lua files it will error out, since the lua runtime does not know to look for in the neovim store for libraries it is trying to load

## initiating basic flake

a flake needs to be set up in a git repo
```bash
git init flake
cd flake
nix flake init
```

## loading vim config in flake

For a file to be included in the nix store, it need to be added to the git repo, it does not need to be committed, but you will need to run `git add file` in neovims case it would be `git add ./config/init.lua`. And this init file is what is read as a custom rc for the vim runtime in the flake.nix file;
``` nix
		config = final.neovimUtils.makeNeovimConfig {
        customRC = builtins.readFile ./config/init.vim;
```

