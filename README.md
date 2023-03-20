Instruktioner för Ants AI challange 🐜
=============

### Installation:

*  [download this](https://raw.githubusercontent.com/0handersson0/Ants-aichallange/b74d91c712e5dcdebdfdd12884ce337c8cb32a8e/ants_aichallenge.ps1)
*  <a download="ants_aichallenge.ps1" href="[/path/to/image](https://raw.githubusercontent.com/0handersson0/Ants-aichallange/b74d91c712e5dcdebdfdd12884ce337c8cb32a8e/ants_aichallenge.ps1)" title="ImageName">ssda
</a>
*   Öppna Powershell
*   Klistra in följande i powershell consolen: Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass 
*   Tryck Enter => Y => Enter
*   Kör ants\_aichallenge.ps1 scriptet
*   .\\ants\_aichallenge.ps1
    *   Parameters
    *   (optional) -Path
    
## Skapa och registrera lag 🪖
För att skapa ett nytt team kör man powershell scriptet ”New-Team.ps1” i mappen ”combat”. Ange ett lagnamn som enbart består av bokstäver, siffror och underscore.

![image](https://user-images.githubusercontent.com/72985598/226278055-8294b5c7-9288-4a2f-8844-7210f4621011.png)

När väl lagnamnet registrerats korrekt (inget rött felmeddelande har erhållits) ska kommandot INTE köras igen. Anledningen är att det då skapas flera lag på servern som kommer att ingå i efterföljande myrkrig. För att ta bort ett lag som blivit fel måste en administratör hjälpa till, så undvik detta helst för att undvika merarbete för oss.

Följer man inte dessa regler får man ett felmeddelande tillbaka
 

Ladda upp sin myrbot för att kriga med de andra lagen
För att ladda upp en ny version av sin bot till servern (och således starta ett nytt myrkrig med de andra lagen) kör man powershell scriptet ”Publish-Bot.ps1”.  Scriptet kommer först bygga din myr-bot och sedan ladda upp den till servern.

![image](https://user-images.githubusercontent.com/72985598/226278124-f5c79736-4acf-4a25-96a4-cef3f26cb790.png)

 

Uppladdning av myrbot förutsätter att man först registrerat sitt lag med kommandot ”New-Team.ps1” ovan (det ska bara göras en gång). Försöker man ladda upp sin bot utan att först ha registrerat sitt lagnamn får man följande fel:
 
 ![image](https://user-images.githubusercontent.com/72985598/226278220-4bc55c3c-6036-4500-bd9f-75c3b7261215.png)


