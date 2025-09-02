/system script
add name="Update-Brazil-IPv4-list" source={
:log info "Starting Brazil IPv4 list update script"

# Define URLs to your pre-processed GitHub .rsc files
:local ipv4Url "https://raw.githubusercontent.com/yvespires658/IP-Location-Brazil/refs/heads/main/mikrotik-ip-brazil.rsc"
:local ipv4File "list-ipv4.rsc"
:local ipv4ListName "IP2Location"


# Download the MikroTik Brazil IPv4 list
:log info "Downloading Brazil-IPv4-list"
/tool fetch url=$ipv4Url dst-path=$ipv4File mode=https
:log info "Wait 10 seconds"
:delay 10s

# Check if files were downloaded successfully
:if ([:len [/file find name=$ipv4File]] = 0) do={
:log error "Failed to download Brazil IPv4 list"
return 0
}

# Remove existing address list entries with previous and new names
:log info "Clearing existing Brazil IPv4 list"
/ip firewall address-list remove [/ip firewall address-list find list=$ipv4ListName]
:log info "Wait 30 seconds"
:delay 30s

# Import the scripts directly
:log info "Importing IPv4 addresses"
/import file-name=$ipv4File


:log info "Cleaning up temporary files"
/file remove $ipv4File
/file remove mikrotik-ip-brazil-updater.rsc

# Verify lists have entries
:local ipv4Count [/ip firewall address-list print count where list=$ipv4ListName]
:log info "Brazil IPv4 list update completed. IPv4 addresses: $ipv4Count"
}

# Create a scheduler to run the script monthly (30 days)
/system scheduler
add interval=4w2d name="Update Brazil IPv4 list" on-event="/system script run Update-Brazil-IPv4-list" policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=may/17/2025 start-time=03:00:00


# Run the script immediately for initial setup
/system script run Update-Brazil-IPv4-list
:log info "Wait 10 seconds"
:delay 10s

:log info "Brazil IPv4 list script completed successfully"