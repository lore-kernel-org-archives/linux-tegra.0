From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: nv u-boot for spring (was: building nv-uboot for nyan-big.)
Date: Tue, 4 Nov 2014 10:39:00 -0800
Message-ID: <CAL1qeaFzYRZHdsgZdwN5LV+OaSAPXgTQ+BRTWdsEurj22qC4Yg@mail.gmail.com>
References: <54575BFE.2010108@synkhronix.com>
	<54577D88.2070002@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54577D88.2070002-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: "S.J.R. van Schaik" <stephan-zGZ7W/ttz6xN8Ch2cx6nig@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephan, Andreas,

On Mon, Nov 3, 2014 at 5:05 AM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> =
wrote:
> Dear Stephan,
>
> Am 03.11.2014 um 11:42 schrieb S.J.R. van Schaik:
>> [...] I have done some research to figure out how to build
>> a working nv u-boot binary, and working instructions can be found on=
 the
>> linux-exynos wiki [1]. However, when I tried to apply them to the sn=
ow
>> and spring boards, by selecting a different branch and a different
>> u-boot configuration, those attempts were of no success. [...]
> [...]
>> The u-boot.bin binary seems to build fine. However, the problem is s=
imilar
>> to the snow and spring boards, where I can't seem to build the DTB-f=
iles.
>
> You didn't ask me. ;) My Spring branch with patches is located here:
> https://github.com/afaerber/u-boot/commits/spring
>
> For my convenience I changed the sources to default to the right devi=
ce
> tree, and I manually inlined exynos-periph-id.dtsi.
>
> If you need further info on my build steps, I can look them up in my
> scripts (on another machine) - I mainly derived them from the officia=
l
> instructions for Snow on the Chromium Wiki. I'm pretty sure I did not
> mess with the EC firmware at all.
>
> But whatever workarounds exist, the Chromium folks should really be
> working on upstreaming U-Boot support for all those Chromebooks, that
> usually sanitizes the build process as a side-effect, resulting in le=
ss
> user questions. :) For Snow I believe that to be done.

Unlike the Exynos Chromebooks, the Tegra Chromebooks do not use U-Boot
as their firmware/bootloader - they instead use Coreboot (firmware)
and Depthcharge (bootloader) like the x86 Chromebooks.  You can,
however, update your firmware with U-Boot as a legacy mode (Ctrl+L at
the dev screen) payload - I've added Julius who can provide more
detail about this process.

Note that we do not maintain U-Boot support for these devices, but
they are very similar to Venice2 which is well-supported upstream.  I
can't guarantee that a Venice2 U-Boot payload will "just work" though.

-Andrew
