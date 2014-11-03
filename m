From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: nv u-boot for spring (was: building nv-uboot for nyan-big.)
Date: Mon, 03 Nov 2014 14:05:12 +0100
Message-ID: <54577D88.2070002@suse.de>
References: <54575BFE.2010108@synkhronix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <54575BFE.2010108@synkhronix.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: "S.J.R. van Schaik" <stephan@synkhronix.com>
Cc: Dylan Reid <dgreid@chromium.org>, linux-tegra@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Dear Stephan,

Am 03.11.2014 um 11:42 schrieb S.J.R. van Schaik:
> [...] I have done some research to figure out how to build
> a working nv u-boot binary, and working instructions can be found on =
the
> linux-exynos wiki [1]. However, when I tried to apply them to the sno=
w
> and spring boards, by selecting a different branch and a different
> u-boot configuration, those attempts were of no success. [...]
[...]
> The u-boot.bin binary seems to build fine. However, the problem is si=
milar
> to the snow and spring boards, where I can't seem to build the DTB-fi=
les.

You didn't ask me. ;) My Spring branch with patches is located here:
https://github.com/afaerber/u-boot/commits/spring

=46or my convenience I changed the sources to default to the right devi=
ce
tree, and I manually inlined exynos-periph-id.dtsi.

If you need further info on my build steps, I can look them up in my
scripts (on another machine) - I mainly derived them from the official
instructions for Snow on the Chromium Wiki. I'm pretty sure I did not
mess with the EC firmware at all.

But whatever workarounds exist, the Chromium folks should really be
working on upstreaming U-Boot support for all those Chromebooks, that
usually sanitizes the build process as a side-effect, resulting in less
user questions. :) For Snow I believe that to be done.

Regards,
Andreas

> 1. http://linux-exynos.org/wiki/ARM_Chromebook/Building_u-boot#Buildi=
ng_U-Boot_for_Peach_Pi.2FPit

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
