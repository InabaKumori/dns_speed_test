#!/bin/ash

clear_dns_cache() {
    case "$(uname -s)" in
       Darwin)
          echo "Clearing DNS cache on macOS..."
          sudo killall -HUP mDNSResponder
          ;;
       Linux)
          echo "Clearing DNS cache on Linux..."
          # The following is a general approach; specific commands may vary by distribution
          # Uncomment and modify according to your specific Linux distro's DNS service
          # sudo systemctl restart systemd-resolved
          # sudo rndc flush
          ;;
       *)
          echo "Operating system not recognized. Skipping DNS cache clearing..."
          ;;
    esac
}

clear_dns_cache


# Predefined list of domains for testing
domains="\
google.com \
facebook.com \
youtube.com \
amazon.com \
yahoo.com \
wikipedia.org \
twitter.com \
instagram.com \
linkedin.com \
apple.com \
microsoft.com \
netflix.com \
twitch.tv \
reddit.com \
ebay.com \
spotify.com \
dropbox.com \
live.com \
pinterest.com \
tumblr.com \
stackoverflow.com \
github.com \
paypal.com \
imdb.com \
craigslist.org \
walmart.com \
target.com \
bestbuy.com \
cnn.com \
nytimes.com \
theguardian.com \
bbc.com \
foxnews.com \
washingtonpost.com \
forbes.com \
techcrunch.com \
engadget.com \
gizmodo.com \
lifehacker.com \
wired.com \
ign.com \
gamespot.com \
kotaku.com \
polygon.com \
eurogamer.net \
pcgamer.com \
steampowered.com \
battle.net \
origin.com \
epicgames.com \
gog.com \
minecraft.net \
roblox.com \
fortnite.com \
callofduty.com \
playstation.com \
xbox.com \
nintendo.com \
ea.com \
ubisoft.com \
rockstargames.com \
blizzard.com \
square-enix.com \
bethesda.net \
2k.com \
capcom.com \
konami.com \
namcobandaigames.com \
sega.com \
atlus.co.jp \
koeitecmoamerica.com \
nisa-america.com \
aksysgames.com \
xseedgames.com \
devolverdigital.com \
team17.com \
paradoxplaza.com \
cdprojekt.com \
deepsilver.com \
focus-home.com \
thqnordic.com \
curve-digital.com \
team-cherry.com \
motion-twin.com \
11bitstudios.com \
klei.com \
facepunch.com \
coffeestainstudios.com \
frozenbyte.com \
housemarque.com \
redbarrelsgames.com \
redlynx.com \
amanita-design.net \
daedalic.com \
telltalegames.com \
doublefine.com \
obsidian.net \
inxile-entertainment.com \
larian.com \
warhorsestudios.cz \
ninedotsstudio.com \
wube.net \
frictionalgames.com \
hempuli.com \
noio.nl \
mobygames.com \
gamespot.com \
giantbomb.com \
gamefaqs.com \
gametrailers.com \
eurogamer.net \
pcgamer.com \
rockpapershotgun.com \
destructoid.com \
gamesindustry.biz \
gamasutra.com \
trueachievements.com \
truetrophies.com \
opencritic.com \
metacritic.com \
gamestop.com \
amazon.com \
bestbuy.com \
target.com \
walmart.com \
newegg.com \
steam-tracker.com \
steamspy.com \
steamdb.info \
vgchartz.com \
resetera.com \
neogaf.com \
gamefaqs.gamespot.com \
gamesradar.com \
gameinformer.com \
gamepressure.com \
hardcoregamer.com \
dualshockers.com \
playstationlifestyle.net \
pushsquare.com \
purexbox.com \
nintendolife.com \
siliconera.com \
rpgsite.net \
gematsu.com \
usgamer.net \
vg247.com \
gamingbolt.com \
gamingonlinux.com \
indiedb.com \
moddb.com \
neowin.net \
dsogaming.com \
pcgamesn.com \
gamewatcher.com \
gamingonlinux.com \
linuxgameconsortium.com \
boilingsteam.com \
gogwiki.com \
pcgamingwiki.com \
porting.team \
back2gaming.com \
gamersonlinux.com \
icculus.org \
penguspy.com \
opengameart.org \
freegamedev.net \
itch.io \
gamejolt.com \
newgrounds.com \
kongregate.com \
armorgames.com \
addictinggames.com \
miniclip.com \
poki.com \
crazygames.com \
agame.com \
arkadium.com \
shockwave.com \
freeonlinegames.com \
gamesfreak.net \
gameforge.com \
mmohuts.com \
onrpg.com \
mmorpg.com \
mmobomb.com \
mmohive.com \
mmogames.com \
mmos.com \
mmosworld.com \
freemmogamer.com \
mmofacts.com \
mmobyte.tv \
mmomeltingpot.com \
onlinegamesector.com \
f2p.com \
mmoguidefinder.com \
mmovault.ign.com \
mmorpg-life.com \
mmorpgreporter.com \
mmorpgtips.com \
tentonhammer.com \
mmorpg-info.org \
mmo-population.com \
mmo-champion.com \
mmo-central.com \
mmo-play.com \
mmohunter.com \
mmo4ever.com \
mmojam.com \
mmoattack.com \
mmoculture.com \
mmomisadventures.com \
mmosite.com \
mmotop.ru \
mmofront.com \
mmohammer.com \
mmoreviews.com \
mmorpgfocus.com \
mmorpgmagazine.com \
mmorpgobserver.com \
mmorpgpress.com \
mmorpgreport.com \
mmorpgupdate.com \
mmorpgvault.com \
mmorpgwatch.com \
mmorpgzone.com \
mmotown.com \
mmoxe.com \
onlinerpggames.com \
rpgdot.com \
rpgdreamer.com \
rpgfan.com \
rpgwatch.com \
rpgcodex.net \
rpgamer.com \
rpgmakerweb.com \
rpgmakervxace.net \
rpgrevolution.com \
rpgsolo.com \
sinisterdesign.net \
aldorlea.org \
amaranthia.net \
basiliskgames.com \
blackshellmedia.com \
catacombkids.com \
dingogames.com \
drakkar.org \
enterbrain.co.jp \
falcom.co.jp \
fareastgizmos.com \
gaijinworks.com \
gust.co.jp \
hanakogames.com \
ixtl.org \
kemco.jp \
matrixsoft.co.jp \
natsume-game.co.jp \
nekonyan.com \
nihon-falcom.com \
playism-games.com \
renpy.org \
rpgmakerweb.com \
rpgmaker.net \
rpgmakervxace.net \
silverstagstudio.com \
spiderwebsoftware.com \
steampowered.com \
store.steampowered.com \
winterwolves.com \
wolfssl.com \
yanderesimulator.com \
zeiva.net \
zeboyd.com \
zenfoxstudios.com \
zeboydgames.com \
"

echo "Starting DNS speed test for predefined domains."

total_time=0
count=0

# Loop through the list of domains and test each one
for domain in $domains
do
    # Perform a DNS query using dig and extract the query time
    result=$(dig +noall +stats $domain | grep "Query time")
    query_time=$(echo $result | awk '{print $4}')
    
    # If query_time is empty or not a number, skip
    if ! [ "$query_time" -eq "$query_time" ] 2>/dev/null; then
        echo "$domain - Query failed"
        continue
    fi
    
    echo "$domain - Query time: $query_time ms"
    
    total_time=$((total_time + query_time))
    count=$((count + 1))
done

echo "DNS speed test completed."

# Avoid division by zero
if [ "$count" -eq 0 ]; then
    echo "No successful DNS queries to calculate average."
    exit 1
fi

# Calculate the average query time
average_time=$((total_time / count))

echo "Average query time: $average_time ms"

# Evaluate the DNS speed based on the average query time
if [ "$average_time" -le 10 ]; then
    echo "DNS speed: Perfect"
elif [ "$average_time" -le 30 ]; then
    echo "DNS speed: Super Good"
elif [ "$average_time" -le 50 ]; then
    echo "DNS speed: Good"
elif [ "$average_time" -le 100 ]; then
    echo "DNS speed: Average"
else
    echo "DNS speed: Poor"
fi
