From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: boot regression with AHCI on jetson-tk1
Date: Wed, 05 Nov 2014 13:10:58 -0700
Message-ID: <545A8452.2050404@wwwdotorg.org>
References: <1411724593-4037-1-git-send-email-cyndis@kapsi.fi> <1411724593-4037-3-git-send-email-cyndis@kapsi.fi> <20141105053414.GA24124@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141105053414.GA24124-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

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
