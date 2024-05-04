secure_read() {
  echo "Enter value for "$(echo $1)
  read -s -r "$1"
  export "$1"
}
alias s_export='secure_read'

# -----------------------------------





alias stripped_printenv='full_printenv | grep -i -v -E "(_PASS|SECRET|TOKEN)"'

alias printenv='stripped_printenv; full_printenv | grep -i -E "(_PASS|SECRET|TOKEN)" | awk -F= '\''{print $1 "=" substr($2, 1, 1) "****" substr($2, length($2))}'\'
