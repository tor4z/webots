cmake_minimum_required(VERSION 3.8)
project(glm_vendor)

# find dependencies
find_package(ament_cmake REQUIRED)

ament_export_include_directories(include/${PROJECT_NAME})

install(DIRECTORY glm/glm
  DESTINATION include/${PROJECT_NAME}
  PATTERN "*.txt" EXCLUDE
)

ament_package()
