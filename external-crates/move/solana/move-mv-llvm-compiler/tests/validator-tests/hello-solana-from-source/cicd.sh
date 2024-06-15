#!/bin/bash
# Script to build move project using the move-cli
# It also builds move-cli if not built already

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
output_file=""
verbose=""
rebuild=""
OPTSTRING=":h?:v:r"

while getopts ${OPTSTRING} opt; do
  case "$opt" in
    h|\?)
      exit 0
      ;;
    v)  verbose="-vv --message-format=json"
      ;;
    r)  rebuild="1"
  esac
done

shift $((OPTIND-1))

[ "${1:-}" = "--" ] && shift

echo "verbose='$verbose', output_file='$output_file', rebuild='$rebuild', Leftovers: $@"

if [ -n "${rebuild}" ]; then
  echo "Rebuilding the move cli"
  cargo build -p move-cli --bin move --features solana-backend $verbose
fi

../../../../../target/debug/move build --arch solana -p sources/hello.move -v

