From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Tegra PCIe system hangs
Date: Sun, 25 Aug 2013 19:14:00 +0200
Message-ID: <1377450840.1622.15.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi all,

I've been experimenting with the Nouveau driver on Tegra for a few days
now and made some promising progress. The one thing that keeps throwing
me back is that I get seemingly random system lockups, which are not
recoverable.

I think this could be the same issue that was reported by Jay Agarwal
earlier. (Message-id:
<C79B248886DD134989C8FF6B096A91AB91B603D82B-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>)
I also found a WAR for a system hang issue in the NVidia downstream
kernel [1], but when tried on upstream it had no effect on the issue.

I'm reasonably sure that this is not driver software related, as I've
already hunted down most of the caching issues and acceleration seems to
work at this point. So either this is a random HW hang, or there is some
software condition I'm not aware of.

I'm running a NV92 connected to the NVidia Beaver board. Kernel is
next-20130809 with the PCIe series + the LP2 workaround applied.

Could you please investigate if there are any other known errata for the
Tegra PCIe controller, which could hang the entire system?

Thanks,
Lucas

[1]
http://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=blobdiff;f=arch/arm/mach-tegra/pcie.c;h=9fab5de016cfd3cd2ebd8176da5bdbedfac73cd8;hp=44749685e2bf822665c9345aec45151b8d2447c4;hb=c5d1bcfb7249b291453a80122148155a00e5456a;hpb=704125ef90e12bc41de057001cc96d81d7cc0376
