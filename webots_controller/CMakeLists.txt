cmake_minimum_required(VERSION 3.8)
project(webots_controller)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  # add_compile_options(-Wall -Wextra -Wpedantic)
endif()

add_compile_definitions(
  LIBCONTROLLER_VERSION="R2025a"
)

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(stb_vendor REQUIRED)
find_package(webots_plugins REQUIRED)

ament_export_include_directories(include/${PROJECT_NAME})
ament_export_libraries(controller)

include_directories(
  ${CMAKE_CURRENT_LIST_DIR}/include/${PROJECT_NAME}
)

file(GLOB_RECURSE SRCS src *.c)

add_library(controller SHARED
  ${SRCS}
)

ament_target_dependencies(controller
  stb_vendor
  webots_plugins
)

install(TARGETS controller
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
)

install(DIRECTORY include/
  DESTINATION include
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
