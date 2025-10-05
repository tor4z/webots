cmake_minimum_required(VERSION 3.8)
project(webots_wren)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(glm_vendor REQUIRED)
find_package(glad_vendor REQUIRED)
find_package(webots_external REQUIRED)
find_package(Freetype REQUIRED)

add_compile_definitions(
  GLM_ENABLE_EXPERIMENTAL
)

ament_export_include_directories(include/${PROJECT_NAME})
ament_export_libraries(wren)

file(GLOB SRCS src/*.cpp)

add_library(wren
  ${SRCS}
)

include_directories(
    ${CMAKE_CURRENT_LIST_DIR}/include/${PROJECT_NAME}
    ${FREETYPE_INCLUDE_DIRS}
)

ament_target_dependencies(wren
  glm_vendor
  glad_vendor
  webots_external
)

install(TARGETS wren
  RUNTIME DESTINATION lib
)

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION include/${PROJECT_NAME}
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
