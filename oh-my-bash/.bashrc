# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

OMB_USE_SUDO=true
completions=(
  git
  composer
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

# Custom pastebin/image host
ez-paste() {
    local apikey="apikey"
    local file="$1"
    
    if [ ! -f "$file" ]; then
        echo "File not found: $file"
        return 1
    fi
    
    local response=$(curl -s -X POST \
        -F "file=@$file;type=text/plain" \
        -H "key: $apikey" \
        https://api.e-z.host/paste/file)
    
    local pasteUrl=$(echo "$response" | jq -r '.pasteUrl')
    local deletionUrl=$(echo "$response" | jq -r '.deletionUrl')
    local error=$(echo "$response" | jq -r '.error')


    echo "Paste URL: $pasteUrl"
    echo "Deletion URL: $deletionUrl"
    

    if [ "$error" != "null" ]; then
        echo "Error Message: $error"
    fi
}

ez-media() {
    local apikey="apikey"
    local file="$1"
    
    if [ ! -f "$file" ]; then
        echo "File not found: $file"
        return 1
    fi
    
    local mimetype=$(file -b --mime-type "$file")
    
    local response=$(curl -s -X POST \
        -F "file=@$file;type=$mimetype" \
        -H "key: $apikey" \
        https://api.e-z.host/files)
    
    local imageUrl=$(echo "$response" | jq -r '.imageUrl')
    local deletionUrl=$(echo "$response" | jq -r '.deletionUrl')
    local error=$(echo "$response" | jq -r '.error')

    if [ "$imageUrl" != "null" ]; then
        echo "Image URL: $imageUrl"
    fi
    if [ "$deletionUrl" != "null" ]; then
        echo "Deletion URL: $deletionUrl"
    fi

    if [ "$error" != "null" ]; then
        echo "Error Message: $error"
    fi
}

#custom path
PATH=$PATH:/c/tools/
PATH=$PATH:/c/tools/C/
PATH=$PATH:/c/Users/cyadine/.local/bin/

#custom alias
alias ff='fastfetch'
alias c='clear'
alias mpv='mpv.com'

eval "$(zoxide init bash)"
eval "$(fzf --bash)"
eval "$(starship init bash)"
