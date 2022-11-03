cmake_minimum_required(VERSION 3.14)
cmake_policy(SET CMP0015 NEW)

SET (CMAKE_CXX_STANDARD 11)
SET (CMAKE_CXX_STANDARD_REQUIRED ON)

project(minimal-cmake-emscripten-playground)

set(CMAKE_VERBOSE_MAKEFILE on)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build.emscripten)


# add_library(mp4v2 STATIC IMPORTED)

# set_property(
#   TARGET mp4v2 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
# )

# set_target_properties(mp4v2 PROPERTIES
#   IMPORTED_LOCATION_RELEASE "${mp4v2_ROOT}/lib/libmp4v2.a"
# )
  
# set_target_properties(mp4v2 PROPERTIES
#   MAP_IMPORTED_CONFIG_MINSIZEREL Release
#   MAP_IMPORTED_CONFIG_RELWITHDEBINFO Release
# )

# message(STATUS "${mp4v2_ROOT}")
# target_include_directories(mp4v2 INTERFACE "${mp4v2_ROOT}/include")

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

add_executable(${PROJECT_NAME}
    "src/main.cpp"
)

# set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-s DEMANGLE_SUPPORT=1 --preload-file ${CMAKE_SOURCE_DIR}/assets --bind")

# target_link_libraries(${PROJECT_NAME} mp4v2)