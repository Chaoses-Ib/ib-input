cmake_minimum_required(VERSION 3.14)

project(IbInput)

include(FetchContent)
FetchContent_Declare(IbWinCpp
    GIT_REPOSITORY https://github.com/Chaoses-Ib/IbWinCppLib.git
    GIT_TAG        a29ac95537f403ac5ae221cb744d3e82076efbf7
)
FetchContent_MakeAvailable(IbWinCpp)

set(sourceFiles
    
)
list(TRANSFORM sourceFiles PREPEND source/)
add_library(IbInput ${sourceFiles})
target_include_directories(IbInput PUBLIC include)
target_compile_features(IbEverything PUBLIC cxx_std_17)
target_link_libraries(IbInput PRIVATE IbWinCpp)