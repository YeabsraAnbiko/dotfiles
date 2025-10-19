export FZF_DEFAULT_OPTS="
  --layout=reverse
  --height=40%
  --info=inline
  --border=rounded
  --margin=1,2
  --preview '
    if [ -d {} ]; then
      tree -C {} | head -100
    elif [ -f {} ]; then
      bat --style=numbers --color=always --line-range :500 {}
    else
      file --brief {}
    fi
  '
  --preview-window=right:50%
  --bind 'ctrl-e:toggle-preview,ctrl-o:execute(nvim {}),ctrl-y:execute-silent(echo {} | xclip -selection clipboard)+abort,ctrl-f:toggle-sort'
  --tiebreak=begin,length
  --color=\
fg:#c0caf5,\
bg:#1a1b26,\
hl:#7dcfff,\
fg+:#ffffff,\
bg+:#24283b,\
hl+:#bb9af7,\
info:#7aa2f7,\
prompt:#7dcfff,\
pointer:#ff9e64,\
marker:#9ece6a,\
spinner:#bb9af7,\
header:#565f89
"
