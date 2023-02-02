bool isVisible = true;

class KackyMapData
{
    string mapNum;
    string position;
    string mapID;
    string mapperName;
    string wr;
    string pb;
    bool fined;
    
    KackyMapData()
    {
        this.position = "1";
        this.mapNum = "199";
        this.mapperName = "Wirtual";
        this.wr = "0.15.325";
        this.pb = "0.15.325";
        this.fined = true;
    }
}

void RenderMapAsTable(KackyMapData@ data)
{
    string position = data.position;
    string mapNum = data.mapNum;
    string mapperName = data.mapperName;
    string wr = data.wr;
    string pb = data.pb;

    UI::PushStyleVar(UI::StyleVar::ItemSpacing, vec2(0, 0));
    UI::Dummy(vec2(0, 0));
    UI::PopStyleVar();

    if(UI::BeginTable("alsjkdhak,sjhdklaj", 5, UI::TableFlags::SizingFixedFit))
    {
        KackyMapData testMap = KackyMapData();

        UI::TableNextColumn();
        UI::TableNextRow();
        UI::TableNextColumn();
        UI::Text(testMap.mapNum);

        UI::TableNextColumn();
        UI::Text(testMap.mapperName);

        UI::TableNextColumn();
        UI::Text(testMap.wr);

        UI::TableNextColumn();
        UI::Text(testMap.pb);

        UI::TableNextColumn();
        UI::Text(testMap.position);

        UI::EndTable();
    }
}


void Main() 
{
    CGameCtnApp@ app = GetApp();
    print("Hello from the new plugin system!");
    while (app.CurrentProfile is null )
    {
        yield();
    }
    

}

void RenderMenu()
{
    if (UI::MenuItem("Kacky Tracker Window")) {
        print("Clicked!");
        isVisible =  !isVisible;
        
    }
}

void RenderInterface()
{
    if(isVisible)
    {
        int wFlags = UI::WindowFlags::NoDocking | UI::WindowFlags::AlwaysAutoResize;

        UI::SetNextWindowSize(1000, 500);

        UI::Begin("Kacky Tracker", wFlags);

        UI::BeginGroup();
        int tFlags = UI::TableFlags::SizingFixedFit;
        int tCFlags = UI::TableColumnFlags::WidthFixed;
        // int tRFlags = UI::Tabl

        KackyMapData@ test = KackyMapData();

        UI::Text("\\$aaaGrey?");

        if(UI::BeginTable("KR1", 3, tFlags))
        {
            UI::TableSetupColumn("Col1", tCFlags, 225);
            UI::TableSetupColumn("Col2", tCFlags, 225);
            UI::TableSetupColumn("Col3", tCFlags, 225);
            UI::TableSetupScrollFreeze(0,1);
            UI::TableHeadersRow();

            UI::TableNextColumn();
            RenderMapAsTable(test);

            UI::TableNextColumn();
            RenderMapAsTable(test);

            UI::TableNextColumn();
            RenderMapAsTable(test);

            UI::EndTable();
        }
        UI::EndGroup();

        UI::End();
    }
}