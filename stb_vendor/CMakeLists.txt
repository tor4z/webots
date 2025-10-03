cmake_minimum_required(VERSION 3.8)
project(stb_vendor)

find_package(ament_cmake REQUIRED)

ament_export_include_directories(include/${PROJECT_NAME})

file(GLOB STB_HEADERS stb/*.h)

install(FILES ${STB_HEADERS}
  DESTINATION include/${PROJECT_NAME}/stb
)

ament_package()
