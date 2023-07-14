#include <cef>

#define LOGIN_BROWSER_ID 1

stock CreateMainLogin(playerid)
{
	cef_create_browser(playerid, LOGIN_BROWSER_ID, "E://SAMPVN//Cef//siteLogin//index.html", false, true);
	cef_emit_event(playerid, "login:name", CEFSTR(GetPlayerNameExt(playerid)));
	cef_focus_browser(playerid,LOGIN_BROWSER_ID, true);
	SetPVarInt(playerid, #open_login_cef, 1);
	return 1;
}
stock HideMainLogin(playerid)
{
	cef_destroy_browser(playerid, LOGIN_BROWSER_ID);
	SetPVarInt(playerid, #open_login_cef, 0);
	return 1;
}
CMD:cef(playerid, params[])
{
	if(GetPVarInt(playerid, #open_login_cef) == 0)
	{
		CreateMainLogin(playerid);
	}
	else HideMainLogin(playerid);
	return 1;
}