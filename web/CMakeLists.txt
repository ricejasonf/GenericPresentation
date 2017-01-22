cmake_minimum_required(VERSION 3.4)

function(add_syntax_file filename)
  string(CONCAT src  CMAKE_CURRENT_SOURCE_DIR filename)
  string(CONCAT dest CMAKE_CURRENT_BINARY_DIR filename ".syntax.html")
  add_custom_command(
    OUTPUT ${dest}
    COMMAND vim -E +'TOhtml' + "w ${dest}" +'q!' + 'q!' -- "${name}"
    DEPENDS src
  )
endfunction()
