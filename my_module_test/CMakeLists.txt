cmake_minimum_required(VERSION 3.8)
project(my_module_test)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(stb_vendor REQUIRED)
find_package(glm_vendor REQUIRED)
find_package(qt6_vendor REQUIRED)
find_package(glad_vendor REQUIRED)
find_package(ois_vendor REQUIRED)
find_package(assimp_vendor REQUIRED)
find_package(pico_vendor REQUIRED)

add_executable(${PROJECT_NAME}
  src/main.cpp
)

install(TARGETS ${PROJECT_NAME}
  RUNTIME DESTINATION lib/${PROJECT_NAME}
)

ament_target_dependencies(${PROJECT_NAME}
  stb_vendor
  glm_vendor
  qt6_vendor
  glad_vendor
  ois_vendor
  assimp_vendor
  pico_vendor
)

ament_package()
