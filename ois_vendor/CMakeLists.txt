cmake_minimum_required(VERSION 3.8)
project(ois_vendor)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)

ament_export_include_directories(include/${PROJECT_NAME})
ament_export_libraries(OIS)

set(WEBOTS_DEPENDS_URL
  https://cyberbotics.com/files/repository/dependencies/linux64/release
)

set(OIS_TARBALL
  libOIS.1.4.tar.bz2
)

set(OIS_TARBALL_URL ${WEBOTS_DEPENDS_URL}/${OIS_TARBALL})
set(OIS_TARBALL_PATH ${CMAKE_BINARY_DIR}/${OIS_TARBALL})
set(OIS_EXTRACTED ${CMAKE_BINARY_DIR}/OIS)

file(DOWNLOAD ${OIS_TARBALL_URL} ${OIS_TARBALL_PATH})
file(ARCHIVE_EXTRACT INPUT ${OIS_TARBALL_PATH}
    DESTINATION ${OIS_EXTRACTED}
)

file(GLOB OIS_SO_FILES
  ${OIS_EXTRACTED}/lib/webots/*.so
)

install(DIRECTORY ${OIS_EXTRACTED}/include/libOIS/OIS
  DESTINATION include/${CMAKE_PROJECT_NAME}
)

install(FILES ${OIS_SO_FILES}
  DESTINATION lib
)

ament_package()
