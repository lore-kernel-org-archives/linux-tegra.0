From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 4/5 V2] ARM: tegra: paz00: add clocks requiredforusboperation
Date: Wed, 10 Aug 2011 03:59:41 -0700
Message-ID: <CAOesGMjmkchniG5Nd2M3wW8_RXQbSQQzspMVGGvbmF5Naf94SA@mail.gmail.com>
References: <201108092126.28521.marvin24@gmx.de>
	<74CDBE0F657A3D45AFBB94109FB122FF04A06873BB@HQMAIL01.nvidia.com>
	<201108101024.57494.marvin24@gmx.de>
	<201108101250.48324.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201108101250.48324.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 10, 2011 at 3:50 AM, Marc Dietich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
>> > Marc Dietrich wrote at Tuesday, August 09, 2011 1:26 PM:
>> > > On Tuesday 09 August 2011 20:35:45 you wrote:
>> > > > [...]
>> > > > Do you need the pll_p_out4 entry? What's that driving? Check i=
n
>> > > > /sys/kernel/debug/clock/clock_tree (/sys/kernel/debug is debug=
fs).
>> > >
>> > > I think it is only required to setup the correct (non-standard?)
>> > > frequency. Seems all other boards use 108 MHz which cause one of=
 the
>> > > ports to fail. Don't ask me for details ...
>> >
>> > ...
>> >
>> > > root@ac100:~# cat /sys/kernel/debug/clock/clock_tree
>> > >
>> > > =A0 =A0clock =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
state =A0ref div =A0 =A0 =A0rate
>> > >
>> > > --------------------------------------------------------------
>> > >
>> > > =A0 =A0clk_m =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
on =A0 =A0 9 =A0 =A0 =A0 =A0 =A0 =A012000000
>> >
>> > ...
>> >
>> > > =A0 =A0 =A0 pll_p =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 on=
 =A0 =A0 10 =A0x18 =A0 =A0 =A0216000000
>> >
>> > ...
>> >
>> > > =A0 =A0 =A0 =A0 =A0pll_p_out4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 on =A0=
 =A0 3 =A0 9 =A0 =A0 =A0 =A024000000
>> > >
>> > > =A0 =A0 =A0 =A0 =A0 =A0 sclk =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
on =A0 =A0 2 =A0 =A0 =A0 =A0 =A0 =A024000000
>> > >
>> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0avp.sclk =A0 =A0 =A0 =A0 =A0 off =
=A0 =A00 =A0 =A0 =A0 =A0 =A0 =A024000000
>> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cop =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
on =A0 =A0 1 =A0 =A0 =A0 =A0 =A0 =A024000000
>> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hclk =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
on =A0 =A0 2 =A0 1 =A0 =A0 =A0 =A024000000
>> > >
>> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pclk =A0 =A0 =A0 =A0 =A0 =A0=
on =A0 =A0 2 =A0 2 =A0 =A0 =A0 =A012000000
>> > >
>> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0apbdma =A0 =A0 =A0 on=
 =A0 =A0 1 =A0 1 =A0 =A0 =A0 =A012000000
>> >
>> > Hmm. That's pretty odd.
>> >
>> > With the standard kernel the device ships with, what does the cloc=
k tree
>> > under pll_p_out4 look like? It'd be very interesting to compare th=
at. If
>> > that setup is the same as what this patch sets up, the patch seems=
 fine.
>>
>> unfortunately, there is no such think in .32 kernel (the kernel deli=
verd
>> with the device), and I don't think I can port it over.
>>
>> > As far as I know all the clocks there are both unrelated to USB, a=
nd
>> > internal to the device, so the board shouldn't have any effect. In
>> > particular, avp.sclk/cop are for the internal media CPU/DSP, hclk/=
pclk
>> > are the internal AHB/APB bus clocks, and apbdma is for an internal=
 DMA
>> > engine, currently only used for audio in the mainline kernel at le=
ast.
>>
>> Does this mean that the internal busses you mentioned are also runni=
ng at
>> low speed? Would this be a hugh performance penality?
>
> maybe this is why in the commit mentioned below sclk is bind to pll_c=
_out1 and
> set to 108 MHz again.
>
> But I cannot see this change in the current seaboard clock table (opt=
imized
> away?). Maybe someone with a seaboard could check this.

We moved some of this to common.c, and should be posting those patches
in a while. It doesn't make sense to run sclk on pll_m, since that one
scales with memory clock scaling.


-Olof
