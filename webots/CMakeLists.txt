cmake_minimum_required(VERSION 3.8)
project(webots)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(qt6_vendor REQUIRED)
find_package(webots_wren REQUIRED)

file(GLOB_RECURSE SRCS src *.cpp)

include_directories(
  ${CMAKE_CURRENT_LIST_DIR}/include
  ${CMAKE_CURRENT_LIST_DIR}/src/nodes
  ${CMAKE_CURRENT_LIST_DIR}/src/nodes/utils
  ${CMAKE_CURRENT_LIST_DIR}/src/vrml
  ${CMAKE_CURRENT_LIST_DIR}/src/maths
  ${CMAKE_CURRENT_LIST_DIR}/src/core
  ${CMAKE_CURRENT_LIST_DIR}/src/engine
  ${CMAKE_CURRENT_LIST_DIR}/src/wren
  ${CMAKE_CURRENT_LIST_DIR}/src/ode
  ${CMAKE_CURRENT_LIST_DIR}/src/control
)

add_executable(${PROJECT_NAME}
  ${SRCS}
)

ament_target_dependencies(${PROJECT_NAME}
  qt6_vendor
  webots_wren
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
