# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

export OSH='/c/Users/cyadine/.oh-my-bash'
OSH_THEME="rana"
alias mpv='mpv.com'
PATH=$PATH:/c/tools/
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

source "$OSH"/oh-my-bash.sh
source ".env"
export ezapi

function ez-paste() {
    local apikey=$ezapi
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

function ez-media() {
    local apikey=$ezapi
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


fastfetch
