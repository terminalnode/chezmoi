# Execute a command and mercilessly disconnect it from the terminal.
function opig {
  nohup $@ &> /dev/null & disown
}

# Parses a markdown (actually any valid input for pandoc) and pipes it into Zathura
function zathura-md() {
  pandoc "$@" -t pdf | zathura -
}

# Takes a python expression, evaluates it and prints it
function pyprint() {
  python -c "print($@)"
}
