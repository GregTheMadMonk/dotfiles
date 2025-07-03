var ALLOW = "DIRECT";
var BLOCK = "PROXY 127.0.0.1:1080";

function FindProxyForURL(url, host)
{
  // Youtube
  if (dnsDomainIs(host,"youtu.be")) return BLOCK; 
  if (dnsDomainIs(host,"youtube.com")) return BLOCK; 
  if (dnsDomainIs(host,"youtube-nocookie.com")) return BLOCK;
  if (dnsDomainIs(host,"yt3.ggpht.com")) return BLOCK;
  if (dnsDomainIs(host,"ytimg.com")) return BLOCK;
  if (dnsDomainIs(host,"googlevideo.com")) return BLOCK; 

  // Instagram
  if (dnsDomainIs(host,"instagram.com")) return BLOCK; 
  if (dnsDomainIs(host,"cdninstagram.com")) return BLOCK; 
  if (dnsDomainIs(host,"instagram.frix7-1.fna.fbcdn.net")) return BLOCK; 

  // Discord
  if (dnsDomainIs(host,"discord.com")) return BLOCK;
  if (dnsDomainIs(host,"discord.gg")) return BLOCK;
  if (dnsDomainIs(host,"vencord.dev")) return BLOCK;
  if (dnsDomainIs(host,"discordapp.com")) return BLOCK;
  if (dnsDomainIs(host,"discord.media")) return BLOCK;
  if (dnsDomainIs(host,"discordapp.net")) return BLOCK;
  if (dnsDomainIs(host,"discord-attachments-uploads-prd.storage.googleapis.com")) return BLOCK;

  // Medium
  if (dnsDomainIs(host,"medium.com")) return BLOCK; 

  // Quora
  if (dnsDomainIs(host,"quora.com")) return BLOCK; 

  // Torrents
  if (dnsDomainIs(host,"nnmclub.to")) return BLOCK; 
  if (dnsDomainIs(host,"rutracker.org")) return BLOCK;
  if (dnsDomainIs(host,"rutracker.cc")) return BLOCK;
  if (dnsDomainIs(host,"torrentbay.st")) return BLOCK;

  // What is it even?
  if (dnsDomainIs(host,"catbox.moe")) return BLOCK;

  // Brave AI
  if (dnsDomainIs(host,"ai-chat.bsg.brave.com")) return BLOCK;

  // Twitter (doesn't work?)
  if (dnsDomainIs(host,"x.com")) return BLOCK;
  if (dnsDomainIs(host,"twimg.com")) return BLOCK;
  if (dnsDomainIs(host,"twitter.com")) return BLOCK;
  if (dnsDomainIs(host,"vxtwitter.com")) return BLOCK;

  // WebArchive
  if (dnsDomainIs(host,"archive.org")) return BLOCK;

  // Misc
  if (dnsDomainIs(host, "wikidot.com")) return BLOCK;
  if (dnsDomainIs(host, "knowyourmeme.com")) return BLOCK;
  if (dnsDomainIs(host, "kym-cdm.com")) return BLOCK;
  if (dnsDomainIs(host, "rule34.xxx")) return BLOCK;

  // YUMI multiboot
  if (dnsDomainIs(host, "yumiusb.com")) return BLOCK;

  // Imgur
  if (dnsDomainIs(host, "imgur.com")) return BLOCK;

  // Intel
  if (dnsDomainIs(host, "intel.com")) return BLOCK;

  // ARM
  if (dnsDomainIs(host, "arm.com")) return BLOCK;
  if (dnsDomainIs(host, "visualstudio.com")) return BLOCK;

  // FCC
  if (dnsDomainIs(host, "fcc.report")) return BLOCK;

  // Other Google stuff
  if (dnsDomainIs(host, "googleusercontent.com")) return BLOCK;

  // Archlinux and other Linux stuff
  if (dnsDomainIs(host, "archlinux.org")) return BLOCK;
  if (dnsDomainIs(host, "archlinuxarm.org")) return BLOCK;
  if (dnsDomainIs(host, "libreoffice.org")) return BLOCK;
  if (dnsDomainIs(host, "gmplib.org")) return BLOCK;

  // /e/OS
  if (dnsDomainIs(host, "e.foundation")) return BLOCK;
  if (dnsDomainIs(host, "ecloud.global")) return BLOCK;
  if (dnsDomainIs(host, "grapheneos.org")) return BLOCK;

  // Xiaomi firmware
  if (dnsDomainIs(host, "xiaomifirmwareupdater.com")) return BLOCK;

  // GH
  if (dnsDomainIs(host, "githubcopilot.com")) return BLOCK;

  // Dosbox
  if (dnsDomainIs(host, "dosbox-x.com")) return BLOCK;

  // ?
  if (dnsDomainIs(host, "narkive.com")) return BLOCK;

  // Redis
  if (dnsDomainIs(host, "redis.io")) return BLOCK;

  // gamingonlinux
  if (dnsDomainIs(host, "gamingonlinux.com")) return BLOCK;
  if (dnsDomainIs(host, "protondb.com")) return BLOCK;

  // Datalore
  if (dnsDomainIs(host, "datalore.jetbrains.com")) return BLOCK;

  if (dnsDomainIs(host, "magnetdl.com")) return BLOCK;

  // Some domain
  if (dnsDomainIs(host, "www.ti.com")) return BLOCK;

  // QCDE
  if (dnsDomainIs(host, "your-server.de")) return BLOCK;

  // LinkedIn
  if (dnsDomainIs(host, "linkedin.com")) return BLOCK;

  // Brainrot
  if (dnsDomainIs(host, "elevenlabs.io")) return BLOCK;

  // 1337x
  if (dnsDomainIs(host, "1337x.to")) return BLOCK;

  // Sony dev
  if (dnsDomainIs(host, "developer.sony.com")) return BLOCK;

  // GH
  // if (dnsDomainIs(host, "github.com")) return BLOCK;

  // Steamdb
  if (dnsDomainIs(host, "steamdb.info")) return BLOCK;

  // Epic Games
  if (dnsDomainIs(host, "epicgames.com")) return BLOCK;

  // Weather?!
  if (dnsDomainIs(host, "wttr.in")) return BLOCK;

  // SIgame
  if (dnsDomainIs(host, "vladimirkhil.com")) return BLOCK;

  return ALLOW;
}
