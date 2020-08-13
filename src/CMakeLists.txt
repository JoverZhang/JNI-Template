set(JNI_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR})

include_directories(./include)

add_library(
    HelloJNI SHARED
    com_ttmo_HelloJNI.h com_ttmo_HelloJNI.cc
)

add_library(
    ObjectJNI SHARED
    com_ttmo_ObjectJNI.h com_ttmo_ObjectJNI.cc
)

add_custom_command(
    TARGET HelloJNI POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    "${PROJECT_SOURCE_DIR}/src/java"
    $<TARGET_FILE_DIR:HelloJNI>
)
