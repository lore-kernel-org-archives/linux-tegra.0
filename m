From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Multi-platform, and secure-only ARM errata workarounds
Date: Wed, 27 Feb 2013 10:03:03 +0100
Message-ID: <22709540.96uJddbx1U@fb07-iapwap2.physik.uni-giessen.de>
References: <512BF81A.3080700@wwwdotorg.org> <4928288.ie8EUukfVD@fb07-iapwap2.physik.uni-giessen.de> <512CE533.6020005@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <512CE533.6020005-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, 26. Februar 2013, 09:39:15 schrieb Stephen Warren:
> On 02/26/2013 02:36 AM, Marc Dietrich wrote:
> > Am Montag, 25. Februar 2013, 16:47:38 schrieb Stephen Warren:
> >> ...
> >> Now, I can easily add those 3 errata workarounds to U-Boot, but that
> >> will require people to reflash their bootloader. This is probably
> >> acceptable for development/reference boards (although I'm sure people
> >> will find it annoying) but for re-purposed production boards (such as
> >> the Toshiba AC100 or various tablets) it will be impossible to update
> >> the factory bootloader. Switching to upstream U-Boot would currently
> >> lose some functionality, and significantly affect people's boot flow, so
> >> is likely unacceptable.
> > 
> > personally, I have no problem to require a certain u-boot version for a
> > given kernel. From a distro point of view, you will likely update the
> > bootloader/kernel on a distro update anyway.
> 
> So a distro will certainly update the kernel.
> 
> But updating a bootloader would be very unusual, I believe.

mmh? Every time I update to a new distro release, the bootloader gets also 
updated - even on arm, e.g. ftp://ports.ubuntu.com/ubuntu-ports/pool/main/u/u-boot-linaro lists four version of uboot - one for each supported distro 
release. I know for closed embedded device this is different, but that's not 
our target.

> Also, I hope that upstream U-Boot is never going to support the bizarre
> "Tegra partition table" cruft that our "fastboot" bootloader supports,
> so you'll end up completely re-programming the flash (BCT, bootloader,
> partition table, all filesystems) if you want to switch to U-Boot. That
> seems like a fair chunk for the installer to own, but I guess if you're
> comfortable with doing that, I won't complain.

Yes, that a huge pile of work and people are working on this already. One the 
other hand, why (if not for upgrade use) do we have u-boot support for all 
these legacy boards?

Marc
