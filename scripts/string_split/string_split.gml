/// @description string_split(str, character to split at);
/// @param str
/// @param  character to split at

str = argument0;
char = argument1;

split_string = ds_list_create();
index = 0;

while (true)  {
    if (string_count(char,str)>0) {
        for (step=0; step<string_length(str); step++)  {  
            if (string_char_at(str, step+1) == char)  {
                
                if (string_copy(str, 0, step) != "")    {
                    ds_list_insert(split_string, index, string_copy(str, 0, step));
                }
                
                str = string_copy(str, step+2, string_length(str)-(step+1));
                
                //ds_list_insert(consoleMessages, 0, str);
                index++;
                break;
            }           
        }
    }
    else    {
        ds_list_insert(split_string, index, str);
        break;
    }
}

return split_string;
