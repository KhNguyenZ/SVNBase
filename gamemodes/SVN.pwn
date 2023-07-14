#define SERVER_GM_TEXT "SVN"
#pragma warning disable 208,219
#pragma disablerecursion
#include <a_samp>
#include <a_mysql>	
#include <streamer>
#include <yom_buttons>
#include <ZCMD>
#include <sscanf2>
#include <foreach>
#include <YSI\y_timers>
#include <YSI\y_utils>
#include <crashdetect>
#include <YSI\y_hooks>
#if defined SOCKET_ENABLED
#include <socket>
#endif
#include "./includes/core/_build.pwn"
#include "./includes/cef/login.pwn"
#include "./includes/cef/hud.pwn"
main() {}

public OnGameModeInit()
{
	print("Dang chuan bi tai gamemode, xin vui long cho doi...");
	g_mysql_Init();
	return 1;
}

public OnGameModeExit()
{
    g_mysql_Exit();
	return 1;
}
