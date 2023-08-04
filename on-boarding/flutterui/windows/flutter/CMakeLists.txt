#ThisfilecontrolsFlutter-levelbuildsteps.Itshouldnotbeedited.
cmake_minimum_required(VERSION3.14)

set(EPHEMERAL_DIR"${CMAKE_CURRENT_SOURCE_DIR}/ephemeral")

#Configurationprovidedviafluttertool.
include(${EPHEMERAL_DIR}/generated_config.cmake)

#TODO:Movetherestofthisintofilesinephemeral.See
#https://github.com/flutter/flutter/issues/57146.
set(WRAPPER_ROOT"${EPHEMERAL_DIR}/cpp_client_wrapper")

#===FlutterLibrary===
set(FLUTTER_LIBRARY"${EPHEMERAL_DIR}/flutter_windows.dll")

#Publishedtoparentscopeforinstallstep.
set(FLUTTER_LIBRARY${FLUTTER_LIBRARY}PARENT_SCOPE)
set(FLUTTER_ICU_DATA_FILE"${EPHEMERAL_DIR}/icudtl.dat"PARENT_SCOPE)
set(PROJECT_BUILD_DIR"${PROJECT_DIR}/build/"PARENT_SCOPE)
set(AOT_LIBRARY"${PROJECT_DIR}/build/windows/app.so"PARENT_SCOPE)

list(APPENDFLUTTER_LIBRARY_HEADERS
"flutter_export.h"
"flutter_windows.h"
"flutter_messenger.h"
"flutter_plugin_registrar.h"
"flutter_texture_registrar.h"
)
list(TRANSFORMFLUTTER_LIBRARY_HEADERSPREPEND"${EPHEMERAL_DIR}/")
add_library(flutterINTERFACE)
target_include_directories(flutterINTERFACE
"${EPHEMERAL_DIR}"
)
target_link_libraries(flutterINTERFACE"${FLUTTER_LIBRARY}.lib")
add_dependencies(flutterflutter_assemble)

#===Wrapper===
list(APPENDCPP_WRAPPER_SOURCES_CORE
"core_implementations.cc"
"standard_codec.cc"
)
list(TRANSFORMCPP_WRAPPER_SOURCES_COREPREPEND"${WRAPPER_ROOT}/")
list(APPENDCPP_WRAPPER_SOURCES_PLUGIN
"plugin_registrar.cc"
)
list(TRANSFORMCPP_WRAPPER_SOURCES_PLUGINPREPEND"${WRAPPER_ROOT}/")
list(APPENDCPP_WRAPPER_SOURCES_APP
"flutter_engine.cc"
"flutter_view_controller.cc"
)
list(TRANSFORMCPP_WRAPPER_SOURCES_APPPREPEND"${WRAPPER_ROOT}/")

#Wrappersourcesneededforaplugin.
add_library(flutter_wrapper_pluginSTATIC
${CPP_WRAPPER_SOURCES_CORE}
${CPP_WRAPPER_SOURCES_PLUGIN}
)
apply_standard_settings(flutter_wrapper_plugin)
set_target_properties(flutter_wrapper_pluginPROPERTIES
POSITION_INDEPENDENT_CODEON)
set_target_properties(flutter_wrapper_pluginPROPERTIES
CXX_VISIBILITY_PRESEThidden)
target_link_libraries(flutter_wrapper_pluginPUBLICflutter)
target_include_directories(flutter_wrapper_pluginPUBLIC
"${WRAPPER_ROOT}/include"
)
add_dependencies(flutter_wrapper_pluginflutter_assemble)

#Wrappersourcesneededfortherunner.
add_library(flutter_wrapper_appSTATIC
${CPP_WRAPPER_SOURCES_CORE}
${CPP_WRAPPER_SOURCES_APP}
)
apply_standard_settings(flutter_wrapper_app)
target_link_libraries(flutter_wrapper_appPUBLICflutter)
target_include_directories(flutter_wrapper_appPUBLIC
"${WRAPPER_ROOT}/include"
)
add_dependencies(flutter_wrapper_appflutter_assemble)

#===Fluttertoolbackend===
#_phony_isanon-existentfiletoforcethiscommandtoruneverytime,
#sincecurrentlythere'snowaytogetafullinput/outputlistfromthe
#fluttertool.
set(PHONY_OUTPUT"${CMAKE_CURRENT_BINARY_DIR}/_phony_")
set_source_files_properties("${PHONY_OUTPUT}"PROPERTIESSYMBOLICTRUE)
add_custom_command(
OUTPUT${FLUTTER_LIBRARY}${FLUTTER_LIBRARY_HEADERS}
${CPP_WRAPPER_SOURCES_CORE}${CPP_WRAPPER_SOURCES_PLUGIN}
${CPP_WRAPPER_SOURCES_APP}
${PHONY_OUTPUT}
COMMAND${CMAKE_COMMAND}-Eenv
${FLUTTER_TOOL_ENVIRONMENT}
"${FLUTTER_ROOT}/packages/flutter_tools/bin/tool_backend.bat"
windows-x64$<CONFIG>
VERBATIM
)
add_custom_target(flutter_assembleDEPENDS
"${FLUTTER_LIBRARY}"
${FLUTTER_LIBRARY_HEADERS}
${CPP_WRAPPER_SOURCES_CORE}
${CPP_WRAPPER_SOURCES_PLUGIN}
${CPP_WRAPPER_SOURCES_APP}
)
