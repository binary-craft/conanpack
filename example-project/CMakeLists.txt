cmake_minimum_required(VERSION 3.27)
project(example-project)

set(CMAKE_CXX_STANDARD 23)

add_executable(example-project src/main.cpp)

install(TARGETS example-project DESTINATION "."
        RUNTIME DESTINATION bin
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
)
