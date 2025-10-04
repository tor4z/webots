cmake_minimum_required(VERSION 3.8)
project(assimp_vendor)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)

ament_export_include_directories(include/${PROJECT_NAME})
ament_export_libraries(assimp)

set(WEBOTS_DEPENDS_URL
  https://cyberbotics.com/files/repository/dependencies/linux64/release
)

set(ASSIMP_TARBALL
  libassimp-5.2.3.tar.bz2
)

set(ASSIMP_TARBALL_URL ${WEBOTS_DEPENDS_URL}/${ASSIMP_TARBALL})
set(ASSIMP_TARBALL_PATH ${CMAKE_BINARY_DIR}/${ASSIMP_TARBALL})
set(ASSIMP_EXTRACTED ${CMAKE_BINARY_DIR}/assimp)

file(DOWNLOAD ${ASSIMP_TARBALL_URL} ${ASSIMP_TARBALL_PATH})
file(ARCHIVE_EXTRACT INPUT ${ASSIMP_TARBALL_PATH}
    DESTINATION ${ASSIMP_EXTRACTED}
)

file(GLOB ASSIMP_SO_FILES
  ${ASSIMP_EXTRACTED}/lib/webots/*.so
)

install(DIRECTORY ${ASSIMP_EXTRACTED}/include/libassimp/include/assimp
  DESTINATION include/${CMAKE_PROJECT_NAME}
)

install(FILES ${ASSIMP_SO_FILES}
  DESTINATION lib
)


ament_package()
