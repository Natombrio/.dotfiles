{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      bat
      clang
      exa
      fd
      fzf
      gh
      git
      neovim
      nodejs_20
      ripgrep
      starship
      tldr
      unzip
      wget
      zoxide
    ];
  };
  programs = {
    git.enable = true;
    fish = {
      enable = true;
      functions = {
        fish_ssh_agent = ''
          function __ssh_agent_is_started -d "check if ssh agent is already started"
            if begin; test -f $SSH_ENV; and test -z "$SSH_AGENT_PID"; end
                source $SSH_ENV > /dev/null
            end

            if test -z "$SSH_AGENT_PID"
                return 1
            end

            ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep -q ssh-agent
            #pgrep ssh-agent
            return $status
          end


          function __ssh_agent_start -d "start a new ssh agent"
            ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
            chmod 600 $SSH_ENV
            source $SSH_ENV > /dev/null
            true  # suppress errors from setenv, i.e. set -gx
          end


          function fish_ssh_agent --description "Start ssh-agent if not started yet, or uses already started ssh-agent."
            if test -z "$SSH_ENV"
                set -xg SSH_ENV $HOME/.ssh/environment
            end

            if not __ssh_agent_is_started
                __ssh_agent_start
            end
          end
        '';
      };
      interactiveShellInit = ''
        # Shell configuration
          set fish_greeting

        # Aliases
          alias ls exa
          alias l "exa -la"
          alias ll "exa -l"
          alias vim nvim
          alias cat bat
          alias grep rg
          abbr g git
          abbr -a c cat
          abbr -a gf "git fetch --all"
          abbr -a gP "git push"
          abbr -a gp "git pull"
          abbr -a gd "git diff"
          abbr -a gl "git log"
          abbr -a gs "git status"
          abbr -a gco "git checkout"
          abbr -a gc "git commit -m"
          abbr -a ga "git add"
          abbr -a gwl "git worktree list"
          abbr -a gwa "git worktree add"
          abbr -a gwr "git worktree remove"
          abbr -a v nvim


        # Environment configuration
          set -x EDITOR nvim
          set -x RUSTC_WRAPPER ~/.cargo/bin/sccache
          set -x FZF_DEFAULT_COMMAND fd

        # Paths
          fish_add_path ~/.cargo/bin
          fish_add_path ~/.local/share/bob/nightly/nvim-linux64/bin/
          fish_add_path ~/.local/bin/

        # Programs
        ## Starship
          if type -q starship
              mkdir -p ~/.cache/starship/
              starship init fish | source
          end

        ## Zoxide
          if type -q zoxide
              zoxide init fish | source
          end

        ## SSH agent
          fish_ssh_agent

        ## Pyenv
          if type -q starship
              pyenv init - | source
          end

      '';
    };
  };
}
