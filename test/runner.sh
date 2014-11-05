#!/usr/bin/env bash

cwd="$( cd "${BASH_SOURCE[0]%/*}" && pwd )"
cd "$cwd/.."

failed=0
total=0

function runtest {
  let total=total+1
  programjava="$(basename $1)"
  program="${programjava%%.*}"
  javac -encoding UTF-8 -sourcepath . -d . "$1"
  hash="$(cat "$2" | java -client -Xss8m -Xmx2048m "$program" | sha512sum | awk '{print $1}')"
  rm "$program.class"
  if [ "$hash" == "$3" ]; then
    echo -e "\e[32mPASS: $programjava\e[00m"
    return 0
  else
    echo -e "\e[31mFAIL: $programjava\e[00m"
    let failed=failed+1
    return 1
  fi
}

runtest "io/NCases.java" "test/ncases.txt" "508fbe46fdbc714b037076ca98cc99941838b25760a39c1f08c58629edaa933713be4af6a7dea0e58e52e72c9ae612fe06bdf41bc3da3db1f656fe0157549105"

echo "Ran $total test(s). $failed failed."

[ $failed -eq 0 ] && exit 0 || exit 1
