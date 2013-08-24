# ~/.bash_logout
# executed by bash when login shell exits.

if which sync &>/dev/null; then
  SYNC_BIN= $(which sync)
  ${SYNC_BIN}
  ${SYNC_BIN}
fi

# when leaving the console clear the screen to increase privacy
if [ ${SHLVL} = 1 ]; then
    clear
fi
