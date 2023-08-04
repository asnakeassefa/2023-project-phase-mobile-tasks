#Project-levelconfiguration.
cmake_minimum_required(VERSION3.14)
project(flutteruiLANGUAGESCXX)

#Thenameoftheexecutablecreatedfortheapplication.Changethistochange
#theon-disknameofyourapplication.
set(BINARY_NAME"flutterui")

#ExplicitlyoptintomodernCMakebehaviorstoavoidwarningswithrecent
#versionsofCMake.
cmake_policy(SETCMP0063NEW)

#Definebuildconfigurationoption.
get_property(IS_MULTICONFIGGLOBALPROPERTYGENERATOR_IS_MULTI_CONFIG)
if(IS_MULTICONFIG)
set(CMAKE_CONFIGURATION_TYPES"Debug;Profile;Release"
CACHESTRING""FORCE)
else()
if(NOTCMAKE_BUILD_TYPEANDNOTCMAKE_CONFIGURATION_TYPES)
set(CMAKE_BUILD_TYPE"Debug"CACHE
STRING"Flutterbuildmode"FORCE)
set_property(CACHECMAKE_BUILD_TYPEPROPERTYSTRINGS
"Debug""Profile""Release")
endif()
endif()
#DefinesettingsfortheProfilebuildmode.
set(CMAKE_EXE_LINKER_FLAGS_PROFILE"${CMAKE_EXE_LINKER_FLAGS_RELEASE}")
set(CMAKE_SHARED_LINKER_FLAGS_PROFILE"${CMAKE_SHARED_LINKER_FLAGS_RELEASE}")
set(CMAKE_C_FLAGS_PROFILE"${CMAKE_C_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_PROFILE"${CMAKE_CXX_FLAGS_RELEASE}")

#UseUnicodeforallprojects.
add_definitions(-DUNICODE-D_UNICODE)

#Compilationsettingsthatshouldbeappliedtomosttargets.
#
#Becautiousaboutaddingnewoptionshere,aspluginsusethisfunctionby
#default.Inmostcases,youshouldaddnewoptionstospecifictargetsinstead
#ofmodifyingthisfunction.
function(APPLY_STANDARD_SETTINGSTARGET)
target_compile_features(${TARGET}PUBLICcxx_std_17)
target_compile_options(${TARGET}PRIVATE/W4/WX/wd"4100")
target_compile_options(${TARGET}PRIVATE/EHsc)
target_compile_definitions(${TARGET}PRIVATE"_HAS_EXCEPTIONS=0")
target_compile_definitions(${TARGET}PRIVATE"$<$<CONFIG:Debug>:_DEBUG>")
endfunction()

#Flutterlibraryandtoolbuildrules.
set(FLUTTER_MANAGED_DIR"${CMAKE_CURRENT_SOURCE_DIR}/flutter")
add_subdirectory(${FLUTTER_MANAGED_DIR})

#Applicationbuild;seerunner/CMakeLists.txt.
add_subdirectory("runner")


#Generatedpluginbuildrules,whichmanagebuildingthepluginsandadding
#themtotheapplication.
include(flutter/generated_plugins.cmake)


#===Installation===
#Supportfilesarecopiedintoplacenexttotheexecutable,sothatitcan
#runinplace.Thisisdoneinsteadofmakingaseparatebundle(asonLinux)
#sothatbuildingandrunningfromwithinVisualStudiowillwork.
set(BUILD_BUNDLE_DIR"$<TARGET_FILE_DIR:${BINARY_NAME}>")
#Makethe"install"stepdefault,asit'srequiredtorun.
set(CMAKE_VS_INCLUDE_INSTALL_TO_DEFAULT_BUILD1)
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
set(CMAKE_INSTALL_PREFIX"${BUILD_BUNDLE_DIR}"CACHEPATH"..."FORCE)
endif()

set(INSTALL_BUNDLE_DATA_DIR"${CMAKE_INSTALL_PREFIX}/data")
set(INSTALL_BUNDLE_LIB_DIR"${CMAKE_INSTALL_PREFIX}")

install(TARGETS${BINARY_NAME}RUNTIMEDESTINATION"${CMAKE_INSTALL_PREFIX}"
COMPONENTRuntime)

install(FILES"${FLUTTER_ICU_DATA_FILE}"DESTINATION"${INSTALL_BUNDLE_DATA_DIR}"
COMPONENTRuntime)

install(FILES"${FLUTTER_LIBRARY}"DESTINATION"${INSTALL_BUNDLE_LIB_DIR}"
COMPONENTRuntime)

if(PLUGIN_BUNDLED_LIBRARIES)
install(FILES"${PLUGIN_BUNDLED_LIBRARIES}"
DESTINATION"${INSTALL_BUNDLE_LIB_DIR}"
COMPONENTRuntime)
endif()

#Fullyre-copytheassetsdirectoryoneachbuildtoavoidhavingstalefiles
#fromapreviousinstall.
set(FLUTTER_ASSET_DIR_NAME"flutter_assets")
install(CODE"
file(REMOVE_RECURSE\"${INSTALL_BUNDLE_DATA_DIR}/${FLUTTER_ASSET_DIR_NAME}\")
"COMPONENTRuntime)
install(DIRECTORY"${PROJECT_BUILD_DIR}/${FLUTTER_ASSET_DIR_NAME}"
DESTINATION"${INSTALL_BUNDLE_DATA_DIR}"COMPONENTRuntime)

#InstalltheAOTlibraryonnon-Debugbuildsonly.
install(FILES"${AOT_LIBRARY}"DESTINATION"${INSTALL_BUNDLE_DATA_DIR}"
CONFIGURATIONSProfile;Release
COMPONENTRuntime)
