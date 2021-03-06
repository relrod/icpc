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

  local hash
  if [ "$2" == "" ]; then
    hash="$(java -client -Xss8m -Xmx2048m "$program" | sha512sum | awk '{print $1}')"
  else
    hash="$(cat "$2" | java -client -Xss8m -Xmx2048m "$program" | sha512sum | awk '{print $1}')"
  fi

  rm *.class

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
runtest "io/CharacterByCharacter.java" "test/ncases.txt" "e749e661422cbeb89933e80b65347db570fa961a314cfaffa8d818cab866224dee1b1eb3b586dd40566d4b075b78fbec83d7d7de816508ac96d4599d42d8e1cd"
runtest "algorithm/SuffixArray.java" "" "40b45e97b0609c8b209afe762362eb9abdf34edcf5d7832450da8772760fdc1ac5a072f2656d5daf409434c2747379273a2aae8e20d77d88d3959e4273e60af3"

echo "Ran $total test(s). $failed failed."

[ $failed -eq 0 ] && exit 0 || exit 1
