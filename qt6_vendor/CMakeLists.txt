cmake_minimum_required(VERSION 3.8)
project(qt6_vendor)

# find dependencies
find_package(ament_cmake REQUIRED)


set(QT6_VERSION 6.5.3)
set(BUILD_PATH ${CMAKE_BINARY_DIR})
set(QT6_PATH ${BUILD_PATH}/.Qt/${QT6_VERSION}/gcc_64)

# execute_process(
#   COMMAND bash ${CMAKE_CURRENT_LIST_DIR}/qt6_installer.bash ${QT6_VERSION} ${BUILD_PATH}
# )

macro(lib_installer file_path file_name)
    file(GLOB FILE_PATH ${file_path}/*${file_name}*)

    install(FILES ${FILE_PATH}
      DESTINATION lib
    )
endmacro()

macro(bin_installer file_path file_name)
    file(GLOB FILE_PATH ${file_path}/*${file_name}*)

    install(FILES ${FILE_PATH}
      DESTINATION lib
    )
endmacro()

macro(translation_installer file_path file_name)
    file(GLOB FILE_PATH ${file_path}/*${file_name}*)

    install(FILES ${FILE_PATH}
      DESTINATION share/translations
    )
endmacro()

set(QT6_HEADER_DIR_LIST
  QtConcurrent
  QtCore
  QtGui
  QtNetwork
  QtOpenGL
  QtOpenGLWidgets
  QtPrintSupport
  QtQml
  QtWebSockets
  QtWidgets
  QtXml
)

set(QT6_SO_LIST
  Qt6Concurrent
  Qt6Core
  Qt6DBus
  Qt6Gui
  Qt6Network
  Qt6OpenGL
  Qt6OpenGLWidgets
  Qt6PrintSupport
  Qt6Qml
  Qt6WaylandClient
  Qt6WaylandEglClientHwIntegration
  Qt6WebSockets
  Qt6Widgets
  Qt6XcbQpa
  Qt6Xml
  icudata
  icui18n
  icuuc
)

set(QT6_PLUGIN_SO_LIST
  platforms/libqxcb.so
  platforms/libqwayland-egl.so
  platforms/libqwayland-generic.so
  platforminputcontexts/libcomposeplatforminputcontextplugin.so
  platforminputcontexts/libibusplatforminputcontextplugin.so
  printsupport/libcupsprintersupport.so
  imageformats/libqjpeg.so
  xcbglintegrations/libqxcb-glx-integration.so
  wayland-graphics-integration-client/
  wayland-shell-integration/
  wayland-decoration-client/
  tls/
  platformthemes/
)

set(QT6_TRANSLATION_FILES
  qt_*
  qtbase_*
  qtdeclarative_*
  qtwebsockets_*
)

set(QT6_BIN_FILES
  bin/lrelease
  bin/lupdate
  libexec/moc
)


foreach(filename IN LISTS QT6_SO_LIST)
  lib_installer(${QT6_PATH}/lib ${filename})
endforeach(filename IN LISTS QT6_SO_LIST)

foreach(filename IN LISTS QT6_PLUGIN_SO_LIST)
  lib_installer(${QT6_PATH}/plugins ${filename})
endforeach(filename IN LISTS QT6_PLUGIN_SO_LIST)

foreach(filename IN LISTS QT6_BIN_FILES)
  bin_installer(${QT6_PATH} ${filename})
endforeach(filename IN LISTS QT6_BIN_FILES)

foreach(filename IN LISTS QT6_TRANSLATION_FILES)
  translation_installer(${QT6_PATH}/translations ${filename})
endforeach(filename IN LISTS QT6_TRANSLATION_FILES)

foreach(dir_name IN LISTS QT6_HEADER_DIR_LIST)
  install(
    DIRECTORY ${QT6_PATH}/include/${dir}
    DESTINATION include/${PROJECT_NAME}
  )
endforeach(dir_name IN LISTS QT6_HEADER_DIR_LIST)

ament_export_include_directories(include/${PROJECT_NAME})
ament_export_libraries(${QT6_SO_LIST})

ament_package()
