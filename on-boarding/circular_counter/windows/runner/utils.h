#ifndefRUNNER_UTILS_H_
#defineRUNNER_UTILS_H_

#include<string>
#include<vector>

//Createsaconsolefortheprocess,andredirectsstdoutandstderrto
//itforboththerunnerandtheFlutterlibrary.
voidCreateAndAttachConsole();

//Takesanull-terminatedwchar_t*encodedinUTF-16andreturnsastd::string
//encodedinUTF-8.Returnsanemptystd::stringonfailure.
std::stringUtf8FromUtf16(constwchar_t*utf16_string);

//Getsthecommandlineargumentspassedinasastd::vector<std::string>,
//encodedinUTF-8.Returnsanemptystd::vector<std::string>onfailure.
std::vector<std::string>GetCommandLineArguments();

#endif//RUNNER_UTILS_H_
