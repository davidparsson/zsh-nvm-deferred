
zsh-defer zgen oh-my-zsh plugins/nvm

function load-nvmrc {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  local nvm_silent=""
  zstyle -t ':omz:plugins:nvm' silent-autoload && nvm_silent="--silent"

  if [[ -n "$nvmrc_path" ]]; then
    local nvmrc_node_version=$(nvm version $(cat "$nvmrc_path" | tr -dc '[:print:]'))

    if [[ "$nvmrc_node_version" = "N/A" ]]; then
      nvm install
    elif [[ "$nvmrc_node_version" != "$node_version" ]]; then
      nvm use $nvm_silent
    fi
  elif [[ "$node_version" != "$(nvm version default)" ]]; then
    if [[ -z $nvm_silent ]]; then
      echo "Reverting to nvm default version"
    fi

    nvm use default $nvm_silent
  fi
}

load-nvmrc-deferred() {
  zsh-defer load-nvmrc
}

autoload -U add-zsh-hook
add-zsh-hook chpwd load-nvmrc-deferred

load-nvmrc-deferred
