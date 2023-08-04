#include"utils.h"

#include<flutter_windows.h>
#include<io.h>
#include<stdio.h>
#include<windows.h>

#include<iostream>

voidCreateAndAttachConsole(){
if(::AllocConsole()){
FILE*unused;
if(freopen_s(&unused,"CONOUT$","w",stdout)){
_dup2(_fileno(stdout),1);
}
if(freopen_s(&unused,"CONOUT$","w",stderr)){
_dup2(_fileno(stdout),2);
}
std::ios::sync_with_stdio();
FlutterDesktopResyncOutputStreams();
}
}

std::vector<std::string>GetCommandLineArguments(){
//ConverttheUTF-16commandlineargumentstoUTF-8fortheEnginetouse.
intargc;
wchar_t**argv=::CommandLineToArgvW(::GetCommandLineW(),&argc);
if(argv==nullptr){
returnstd::vector<std::string>();
}

std::vector<std::string>command_line_arguments;

//Skipthefirstargumentasit'sthebinaryname.
for(inti=1;i<argc;i++){
command_line_arguments.push_back(Utf8FromUtf16(argv[i]));
}

::LocalFree(argv);

returncommand_line_arguments;
}

std::stringUtf8FromUtf16(constwchar_t*utf16_string){
if(utf16_string==nullptr){
returnstd::string();
}
inttarget_length=::WideCharToMultiByte(
CP_UTF8,WC_ERR_INVALID_CHARS,utf16_string,
-1,nullptr,0,nullptr,nullptr)
-1;//removethetrailingnullcharacter
intinput_length=(int)wcslen(utf16_string);
std::stringutf8_string;
if(target_length<=0||target_length>utf8_string.max_size()){
returnutf8_string;
}
utf8_string.resize(target_length);
intconverted_length=::WideCharToMultiByte(
CP_UTF8,WC_ERR_INVALID_CHARS,utf16_string,
input_length,utf8_string.data(),target_length,nullptr,nullptr);
if(converted_length==0){
returnstd::string();
}
returnutf8_string;
}
