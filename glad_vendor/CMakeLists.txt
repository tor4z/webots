cmake_minimum_required(VERSION 3.8)
project(glad_vendor)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  # add_compile_options(-Wall -Wextra -Wpedantic)
  add_compile_options(-Wall -Wextra)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)

add_library(glad SHARED
  src/glad.c
)

target_include_directories(glad
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include/${PROJECT_NAME}>
)

ament_export_include_directories(include/${PROJECT_NAME})
ament_export_libraries(glad)

install(TARGETS glad
  RUNTIME DESTINATION lib
)

install(DIRECTORY include/
  DESTINATION include/${PROJECT_NAME}
)

ament_package()
