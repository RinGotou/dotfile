# https://unix.stackexchange.com/questions/14895/duplicate-entries-in-path-a-problem
function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}
