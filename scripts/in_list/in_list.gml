/// @description in_list(listId,value);
/// @param listId
/// @param value

listId = argument0;
value = argument1;

inList = false;
listSize = ds_list_size(listId);

for (i = 0; i < listSize; i++) {
    if (listId[| i] == value)   {
        inList = true;
        break;
    }
}

return inList;
