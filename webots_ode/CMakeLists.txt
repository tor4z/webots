cmake_minimum_required(VERSION 3.8)
project(webots_ode)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  # add_compile_options(-Wall -Wextra)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)

add_compile_definitions(
  dTRIMESH_ENABLED
  dTRIMESH_OPCODE
  ODE_MT
  ODE_LIB
  ODE_THREADMODE_PTHREAD
)

ament_export_include_directories(include/${PROJECT_NAME})
ament_export_libraries(ode)

file(GLOB_RECURSE ODE_SRCS src/ode/src *.cpp)
file(GLOB_RECURSE CCD_SRCS src/libccd/src *.cpp)
file(GLOB_RECURSE OPCODE_SRCS src/OPCODE/src *.cpp)

add_library(ode SHARED
  ${ODE_SRCS}
  ${CCD_SRCS}
  ${OPCODE_SRCS}
)

include_directories(
    ${CMAKE_CURRENT_LIST_DIR}/include/${PROJECT_NAME}
    ${CMAKE_CURRENT_LIST_DIR}/src/OPCODE
    ${CMAKE_CURRENT_LIST_DIR}/src/libccd/src
    ${CMAKE_CURRENT_LIST_DIR}/src/libccd/src/custom
    ${CMAKE_CURRENT_LIST_DIR}/src/ode/src
)

# ament_target_dependencies(ode
# )

install(TARGETS ode
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
