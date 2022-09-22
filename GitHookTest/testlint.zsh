#! /bin/bash
export PATH="$PATH:/opt/homebrew/bin"

if which swiftlint > /dev/null; then
  echo "SwiftLint Start"
  swiftlint
else
  echo "SwiftLint does not exist"
fi

