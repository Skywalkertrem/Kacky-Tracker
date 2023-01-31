void Main() 
{
    CGameCtnApp@ app = GetApp();
    print("Hello from the new plugin system!");
    while ( )

    yield();
}

void RenderMenu()
{
    if (UI::MenuItem("Test menu item!")) {
        print("Clicked!");
    }
}