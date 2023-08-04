cmake_minimum_required(VERSION3.14)
project(runnerLANGUAGESCXX)

#Definetheapplicationtarget.Tochangeitsname,changeBINARY_NAMEinthe
#top-levelCMakeLists.txt,notthevaluehere,or`flutterrun`willnolonger
#work.
#
#Anynewsourcefilesthatyouaddtotheapplicationshouldbeaddedhere.
add_executable(${BINARY_NAME}WIN32
"flutter_window.cpp"
"main.cpp"
"utils.cpp"
"win32_window.cpp"
"${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
"Runner.rc"
"runner.exe.manifest"
)

#Applythestandardsetofbuildsettings.Thiscanberemovedforapplications
#thatneeddifferentbuildsettings.
apply_standard_settings(${BINARY_NAME})

#Addpreprocessordefinitionsforthebuildversion.
target_compile_definitions(${BINARY_NAME}PRIVATE"FLUTTER_VERSION=\"${FLUTTER_VERSION}\"")
target_compile_definitions(${BINARY_NAME}PRIVATE"FLUTTER_VERSION_MAJOR=${FLUTTER_VERSION_MAJOR}")
target_compile_definitions(${BINARY_NAME}PRIVATE"FLUTTER_VERSION_MINOR=${FLUTTER_VERSION_MINOR}")
target_compile_definitions(${BINARY_NAME}PRIVATE"FLUTTER_VERSION_PATCH=${FLUTTER_VERSION_PATCH}")
target_compile_definitions(${BINARY_NAME}PRIVATE"FLUTTER_VERSION_BUILD=${FLUTTER_VERSION_BUILD}")

#DisableWindowsmacrosthatcollidewithC++standardlibraryfunctions.
target_compile_definitions(${BINARY_NAME}PRIVATE"NOMINMAX")

#Adddependencylibrariesandincludedirectories.Addanyapplication-specific
#dependencieshere.
target_link_libraries(${BINARY_NAME}PRIVATEflutterflutter_wrapper_app)
target_link_libraries(${BINARY_NAME}PRIVATE"dwmapi.lib")
target_include_directories(${BINARY_NAME}PRIVATE"${CMAKE_SOURCE_DIR}")

#RuntheFluttertoolportionsofthebuild.Thismustnotberemoved.
add_dependencies(${BINARY_NAME}flutter_assemble)
