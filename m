From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: ANNOUNCE: Tegra application notes, (and tegrarcm & cbootimage)
Date: Fri, 07 Dec 2012 18:08:58 -0700
Message-ID: <50C2932A.7040501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I'd like to announce or remind people of some documentation and tools we
have for Tegra development.

First up, we've just posted a few simple application notes describing
some details of how Tegra boots, the BCT format, etc. We intend to add
more articles to the series as time permits. Do let us know if there are
any burning topics you'd like covered, and I'll see if we can oblige.
You can find them at:

ftp://download.nvidia.com/tegra-public-appnotes/index.html

Second, a reminder of the tegrarcm tool (which has been published for a
while now). It interacts with the Tegra boot ROM of development-mode
devices to download code into SDRAM and executes it. This can be useful
for bootloader development, low-level "bricked" system recovery, etc.
It's available at:

http://nv-tegra.nvidia.com/gitweb/?p=tools/tegrarcm.git;a=summary

Third, we have just taken ownership of publishing a tool named
cbootimage, which can compile a text representations of a BCT into a
binary, or combine a binary and a bootloader into a flashable image.
This tool was previous available via the ChromiumOS project. It's
available at:

http://nv-tegra.nvidia.com/gitweb/?p=tools/cbootimage.git;a=summary

The latter two tools, used together with an upstream U-Boot, can be used
to create a completely Open-Source flashing system for Tegra devices;
compile U-Boot, create a flashable image using cbootimage, execute
U-Boot on the system using tegrarcm, get the flashable image onto the
system using an SD card or TFTP over the network, and use U-Boot to
write it to flash.

Finally, we hope to publish cbootimage configuration files for NVIDIA's
Tegra reference boards in the very near future. That will complete the
picture above.

Have fun!
