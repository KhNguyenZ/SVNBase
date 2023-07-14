#include <cef>

#define HUD_CUSTOM 0x12346

hook OnPlayerUpdate(playerid)
{
    cef_subscribe("pwd:try", "CefInterface");
    return 1;
}

hook OnPlayerSpawn(playerid)
{
    cef_create_browser(playerid, HUD_CUSTOM, "E://SAMPVN//Cef//Hud//hud.html", false, false);
    return 1; 
}

//cef
forward OnCefInitialize(player_id, success);
forward OnCefBrowserCreated(player_id, browser_id, status_code);
forward CefInterface(player_id);

public OnCefInitialize(player_id, success) {
    if (success == 1) {
        return;
    }

}

public OnCefBrowserCreated(player_id, browser_id, status_code) {
}
public CefInterface(player_id)
{
    new money = PlayerInfo[player_id][pCash], Float:armour, Float:hp, name[40];
    GetPlayerName(player_id, name, sizeof(name));
    GetPlayerHealth(player_id, hp);
    GetPlayerArmour(player_id, armour);
    cef_emit_event(player_id, "pwd:allitem", CEFINT(money), CEFSTR(name), CEFINT(armour), CEFINT(hp));
}
