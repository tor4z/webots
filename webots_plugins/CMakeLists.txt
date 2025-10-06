cmake_minimum_required(VERSION 3.8)
project(webots_plugins)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)

ament_export_include_directories(include/${PROJECT_NAME})


install(DIRECTORY include/
  DESTINATION include
)

ament_package()
