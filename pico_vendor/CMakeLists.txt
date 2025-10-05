cmake_minimum_required(VERSION 3.8)
project(pico_vendor)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)

ament_export_include_directories(include/${PROJECT_NAME})
ament_export_libraries(pico)

set(WEBOTS_DEPENDS_URL
  https://cyberbotics.com/files/repository/dependencies/linux64/release
)

set(PICO_TARBALL
  libpico.tar.bz2
)

set(PICO_TARBALL_URL ${WEBOTS_DEPENDS_URL}/${PICO_TARBALL})
set(PICO_TARBALL_PATH ${CMAKE_BINARY_DIR}/${PICO_TARBALL})
set(PICO_EXTRACTED ${CMAKE_BINARY_DIR}/pico)

file(DOWNLOAD ${PICO_TARBALL_URL} ${PICO_TARBALL_PATH})
file(ARCHIVE_EXTRACT INPUT ${PICO_TARBALL_PATH}
    DESTINATION ${PICO_EXTRACTED}
)

file(GLOB PICO_SO_FILES
  ${PICO_EXTRACTED}/lib/webots/*.so
)

file(GLOB PICO_HEADERS ${PICO_EXTRACTED}/include/libpico/*.h)

install(FILES ${PICO_HEADERS}
  DESTINATION include/${CMAKE_PROJECT_NAME}
)

install(DIRECTORY ${PICO_EXTRACTED}/resources/pico/
  DESTINATION share
)

install(FILES ${PICO_SO_FILES}
  DESTINATION lib
)

ament_package()
