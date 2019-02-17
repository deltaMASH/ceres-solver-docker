cmake_minimum_required(VERSION 3.2)

find_package(Ceres REQUIRED)
include_directories(${CERES_INCLIUDE_DIR})
add_executable(app main.cpp)
target_link_libraries(app ${CERES_LIBRARIES})
