/// @description  get_from_list(value, list)
/// @param value
/// @param  list

value = argument0;
list = argument1;

listSize = ds_list_size(list);
for (a=0; a < listSize; a++)  {
    if (list[| a] == value)   {
        return a;
        break;
    }
}
