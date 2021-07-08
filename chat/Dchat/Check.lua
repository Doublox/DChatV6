local label =
[[ 

$$$$$$$\   $$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$$\       $$\    $$\  $$$$$$\  
$$  __$$\ $$  __$$\ $$ |  $$ |$$  __$$\ \__$$  __|      $$ |   $$ |$$  __$$\ 
$$ |  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |   $$ |         $$ |   $$ |$$ /  \__|
$$ |  $$ |$$ |      $$$$$$$$ |$$$$$$$$ |   $$ |         \$$\  $$  |$$$$$$$\  
$$ |  $$ |$$ |      $$  __$$ |$$  __$$ |   $$ |          \$$\$$  / $$  __$$\ 
$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |   $$ |           \$$$  /  $$ /  $$ |
$$$$$$$  |\$$$$$$  |$$ |  $$ |$$ |  $$ |   $$ |            \$  /    $$$$$$  |
\_______/  \______/ \__|  \__|\__|  \__|   \__|             \_/     \______/ 
                                                                             
                                                                             
                                                                             

  ||                        Created by Doublox#9803
  ||]]

-- Returns the current version set in fxmanifest.lua
function GetCurrentVersion()
    return GetResourceMetadata( GetCurrentResourceName(), "version" )
end

-- Grabs the latest version number from the web GitHub
PerformHttpRequest( "https://raw.githubusercontent.com/Doublox/DChatV6/master/chat/Dchat/version.txt", function( err, text, headers )
    -- Wait to reduce spam
    Citizen.Wait( 2000 )

    -- Print the branding!
    print( label )

    -- Get the current resource version
    local curVer = GetCurrentVersion()

    print( "  ||    Current version: " .. curVer )

    if ( text ~= nil ) then
        -- Print latest version
        print( "  ||    Latest recommended version: " .. text .."\n  ||" )

        -- If the versions are different, print it out
        if ( text ~= curVer ) then
            print( "  ||    ^2Your ChatV6 is up to date!\n^0  ||\n  \\\\\n" )
            print( "  ||    ^1But if you see that the last version and yours and not the same one look on the forum or on github, visit the FiveM forum post to get the latest version.\n^0  \\\\\n" )
            print( "  ||    ^2https://github.com/Doublox/DChatV6/\n^0  ||\n  \\\\\n" )
        else
            print( "  ||    ^2Your ChatV6 is up to date!\n^0  ||\n  \\\\\n" )
            print( "  ||    ^1But if you see that the last version and yours and not the same one look on the forum or on github, visit the FiveM forum post to get the latest version.\n^0  \\\\\n" )
            print( "  ||    ^2https://github.com/Doublox/DChatV6/\n^0  ||\n  \\\\\n" )
        end
    else
        -- In case the version can not be requested, print out an error message
        print( "  ||    ^1There was an error getting the latest version information.\n^0  ||\n  \\\\\n" )
    end

    -- Warn the console if the resource has been renamed, as this will cause issues with the resource's functionality.
    if ( GetCurrentResourceName() ~= "chat" ) then
        print( "^1ERROR: Resource name is not chat, expect there to be issues with the resource. To ensure there are no issues, please leave the resource name as chat^0\n\n" )
    end
end )