#include <a_samp>
#include <ZCMD>
#include <cef>
#include <foreach>

new cefobj;

hook OnGameModeInit()
{
    cefobj = CreateDynamicObject(7909, 1185.675292, -1376.301513, 18.787693, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(cefobj, 0, 10101, "2notherbuildsfe", "ferry_build14", 0xFFFFFFFF);
    SetDynamicObjectMaterial(cefobj, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    print("CEF Dang Tai Du Lieu");
}

CMD:ceflink(playerid, params[])
{
    ShowPlayerDialog(playerid,15000, DIALOG_STYLE_INPUT, "Link", "", ">>", "<<");
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == 15000 && response == 1)
    {
        foreach(new i:Player)
        {
            if(!strlen(inputtext)) {
                ShowPlayerDialog(playerid,15000, DIALOG_STYLE_INPUT, "Link", "", ">>", "<<");
            }
            else{
                cef_create_ext_browser(i, 39, "", inputtext, 3);
                SetObjectMaterial(cefobj, 0, 10101, "2notherbuildsfe", "ferry_build14", 0xFFFFFFFF);
                SetObjectMaterial(cefobj, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
                cef_append_to_object(i, 39, cefobj);
                cef_set_audio_settings(i, 39, 30.0, 20.0);
            }
        }
    }
    return 1;
}

CMD:cpos(playerid, params[])
{
    SetPlayerPos(playerid, 1192.78, -1292.68, 13.38);
    return 1;
}
