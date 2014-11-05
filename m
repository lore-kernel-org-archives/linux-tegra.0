From: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: boot regression with AHCI on jetson-tk1
Date: Wed, 5 Nov 2014 21:08:09 +0000
Message-ID: <f1451de182a0439f96abf8ed9dacd272@HQMAIL103.nvidia.com>
References: <1411724593-4037-1-git-send-email-cyndis@kapsi.fi>
 <1411724593-4037-3-git-send-email-cyndis@kapsi.fi>
 <20141105053414.GA24124@nvidia.com>,<545A8452.2050404@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545A8452.2050404-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I have a retail rev D jetson-tk1, I'm in the lab with Greg Roth, and I tried my sdcard on his rev C and it boots fine.  I've never used SATA on this board, but the l4t kernel boots ok, which at least probes sata without issue.

I thought of u-boot dependencies as well, but I updated to:

commit 46b7b2e8025770fb29f7810c2d7d15a6650b9643
Merge: a8b972b 265072b
Author: Tom Rini <trini-l0cyMroinI0@public.gmane.org>
Date:   Mon Nov 3 12:46:12 2014 -0500

    Merge branch 'master' of git://git.denx.de/u-boot-mips

and it still fails
________________________________________
From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sent: Wednesday, November 5, 2014 12:10 PM
To: Allen Martin; Mikko Perttunen
Cc: Mikko Perttunen; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: Re: boot regression with AHCI on jetson-tk1

On 11/04/2014 10:34 PM, Allen Martin wrote:
> I tried booting 3.18-rc3 on jetson-tk1 and I'm seeing a hang during
> boot right before user space normally comes up.  I bisected the
> regression back to this commit which just turns on AHCI.  I don't have
> any SATA device connected to the board.

I just tried this, and everything works out OK for me with 3.18-rc3 or
next-20141016 which I had lying around.

Which board revision are you using? I'm using rev D.

Which U-Boot revision are you using? Perhaps this is an issue with old
U-Boots that don't initialize the full pinmux, now that the kernel
doesn't and hence relies on U-Boot. I tested there weren't any kernel
regressions when I updated it not to program the static pinmux, but
perhaps SATA wasn't enabled when I did that.
