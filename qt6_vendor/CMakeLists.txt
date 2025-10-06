cmake_minimum_required(VERSION 3.8)
project(qt6_vendor)

# find dependencies
find_package(ament_cmake REQUIRED)


set(QT6_VERSION 6.5.3)
set(BUILD_PATH ${CMAKE_BINARY_DIR})
set(QT6_PATH ${BUILD_PATH}/.Qt/${QT6_VERSION}/gcc_64)

execute_process(
  COMMAND bash ${CMAKE_CURRENT_LIST_DIR}/qt6_installer.bash ${QT6_VERSION} ${BUILD_PATH}
)

install(DIRECTORY ${QT6_PATH}/
  DESTINATION Qt6
)

ament_export_include_directories(include/${PROJECT_NAME})
ament_export_libraries(${QT6_SO_LIST})

ament_package()
