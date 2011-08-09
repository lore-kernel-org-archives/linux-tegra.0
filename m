From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 4/5 V2] ARM: tegra: paz00: add clocks required for usb operation
Date: Tue, 9 Aug 2011 12:24:35 -0700
Message-ID: <CAOesGMgGJM5v5dOruOAJLqNg8Geu-BtvSoyBSdgnZU-nu94aDQ@mail.gmail.com>
References: <cover.1312735430.git.marvin24@gmx.de>
	<201108092029.17546.marvin24@gmx.de>
	<CAOesGMiV-jrcGFUXBf=5H__-gXvwgxUias7WGouYTvAy+k=oMg@mail.gmail.com>
	<201108092118.43724.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201108092118.43724.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 9, 2011 at 12:18 PM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hi Olof,
>
> On Tuesday 09 August 2011 20:30:47 Olof Johansson wrote:
>> On Tue, Aug 9, 2011 at 11:29 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wro=
te:
>> >
>> > These clocks are required for usb operation.
>> > ---
>> > =A0arch/arm/mach-tegra/board-paz00.c | =A0 =A06 ++++++
>> > =A01 files changed, 6 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-teg=
ra/board-
> paz00.c
>> > index 45111f6..89a3dda 100644
>> > --- a/arch/arm/mach-tegra/board-paz00.c
>> > +++ b/arch/arm/mach-tegra/board-paz00.c
>> > @@ -145,6 +145,12 @@ static __initdata struct tegra_clk_init_table
> paz00_clk_init_table[] =3D {
>> > =A0 =A0 =A0 =A0/* name =A0 =A0 =A0 =A0 parent =A0 =A0 =A0 =A0 =A0r=
ate =A0 =A0 =A0 =A0 =A0 =A0enabled */
>> > =A0 =A0 =A0 =A0{ "uarta", =A0 =A0 =A0"pll_p", =A0 =A0 =A0 =A021600=
0000, =A0 =A0 =A0true },
>> > =A0 =A0 =A0 =A0{ "uartd", =A0 =A0 =A0"pll_p", =A0 =A0 =A0 =A021600=
0000, =A0 =A0 =A0true },
>> > +
>> > + =A0 =A0 =A0 { "pll_p_out4", "pll_p", =A0 =A0 =A0 =A024000000, =A0=
 =A0 =A0 true },
>> > + =A0 =A0 =A0 { "usbd", =A0 =A0 =A0 "clk_m", =A0 =A0 =A0 =A0120000=
00, =A0 =A0 =A0 true },
>> > + =A0 =A0 =A0 { "usb2", =A0 =A0 =A0 "clk_m", =A0 =A0 =A0 =A0120000=
00, =A0 =A0 =A0 true },
>> > + =A0 =A0 =A0 { "usb3", =A0 =A0 =A0 "clk_m", =A0 =A0 =A0 =A0120000=
00, =A0 =A0 =A0 true },
>>
>> Do they all have to be enabled here? Setting the parent and rate mak=
es
>> sense, but you shouldn't have to enable them.
>
> usb also works with all three usb* clocks set to disabled (they are e=
ven not
> required to be listed there at all). Honestly, the whole clock setup =
is a little
> obscure to me.
>
> Can these clocks be safly disabled in the clock table and hope that t=
he ehci
> host driver will enable them if required? Also independent to what th=
e
> bootloader does, which I don't know? I'm asking because we may switch=
 from the
> proprietary bootloader (fastboot?) to u-boot in the near future.


In general, the platform code needs to setup the parent/child
relationships, and in most cases the clock rates. But the individual
drivers will disable and enable clocks as needed. If you set them to
'true' in the table, that last enable will never be disabled, so the
clock will never be off. That might be suboptimal from a power
consumption point of view for your platform.

Unfortunately, u-boot does very little clock setup so the kernel has
to be able to do most of it. Fastboot is better at it, in some sense
of the word. We used to have some very large clock setup tables in the
chromeos board files, but we have recently pruned out most of it and
cut back to the bare minimum.

Note that you might have some issues with autosuspend and detecting
hotplugs, we have a chromeos patch for it that I should post sometime
soon.


-Olof
