From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: tegra: Automatic UART selection for earlyprintk
Date: Wed, 4 Jan 2012 15:47:52 -0800
Message-ID: <CAD=FV=WE51BbXdkQ9zjVCR_vjuHR5qn0YR+RteL-Q30bZ59BCA@mail.gmail.com>
References: <1325629520-23018-1-git-send-email-swarren@nvidia.com>
	<CAD=FV=X8p5RXKc0CW4KYzmoCw7tkOrahD2tnqKfXqqRR6MEAJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=X8p5RXKc0CW4KYzmoCw7tkOrahD2tnqKfXqqRR6MEAJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

(repost, since gmail seems to have mangled my message)

=46or the series,

Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Thank you for picking this up.

A few overall comments on the patch set:
1. This patch has the side effect of requiring the use of zImage to
=A0 =A0get the proper behavior. =A0If we ever try to move decompression
=A0 =A0of the kernel to the bootloader (as has been talked about, since
=A0 =A0u-boot supports it) we'll lose earlyprintk behavior. =A0...of co=
urse,
=A0 =A0this does match how some other ARM boards do things. =A0I'm OK w=
ith
=A0 =A0this.
2. I'm slightly concerned about cramming stuff into IRAM, since
=A0 =A0I don't have a good concept of what IRAM adresses are used when.
=A0 =A0When I grep for IRAM users in our kernel, I see
=A0 =A0TEGRA_AVP_RESUME_ADDR is using the base of IRAM. =A0We're not go=
ing
=A0 =A0to be hosing suspend/resume or anything else with this CL, are w=
e?
=A0 =A0In the very least, I'd perfer to see a #define for the '0x100' a=
nd
=A0 =A0the '0x55415254' so that we can correlate the constants in
=A0 =A0uncompress.h and debug-macro.S

Tested:
Tested the series on a Tegra2-based board (Kaen) with
CONFIG_TEGRA_DEBUG_UART_NONE defined on the current ToT chromium-os
tree with the following pre-changes:
1. Reverted hack from our tree: 63b76a4638f3934e69c8724881060f121845184=
c
2. Added "arm/tegra: Support Tegra30 in decompressor UART setup" as
=A0 =A0described in the patch header.
3. Adjusted patch 4 to apply cleanly to our older "common.c"
4. Added missing #include <linux/kernel.h> to uncompress.h, as
=A0 =A0indicated by swarren on tegra IRC.

Also tried stopping in the bootloader and clearing the 'D' with:
=A0 mw.b 0x7000605c 0
=2E..and validated that I missed the earlyprintks (as expected) but
still booted.

---

On Wed, Jan 4, 2012 at 3:45 PM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> w=
rote:
> For the series,
> Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Thank you for picking this up.
> A few overall comments on the patch set:1. This patch has the side
> effect of requiring the use of zImage to=A0=A0 =A0get the proper beha=
vior.
> If we ever try to move decompression=A0 =A0of the kernel to the bootl=
oader
> (as has been talked about, since=A0 =A0u-boot supports it) we'll lose
> earlyprintk behavior. =A0...of course,=A0=A0 =A0this does match how s=
ome other
> ARM boards do things. =A0I'm OK with=A0 =A0this.2. I'm slightly conce=
rned
> about cramming stuff into IRAM, since=A0 =A0I don't have a good conce=
pt of
> what IRAM adresses are used when.=A0 =A0When I grep for IRAM users in=
 our
> kernel, I see=A0=A0 =A0TEGRA_AVP_RESUME_ADDR is using the base of IRA=
M.
> We're not going=A0 =A0to be hosing suspend/resume or anything else wi=
th
> this CL, are we?=A0 =A0In the very least, I'd perfer to see a #define=
 for
> the '0x100' and=A0=A0 =A0the '0x55415254' so that we can correlate th=
e
> constants in=A0=A0 =A0uncompress.h and debug-macro.S
> Tested:Tested the series on a Tegra2-based board (Kaen)
> withCONFIG_TEGRA_DEBUG_UART_NONE defined on the current ToT
> chromium-os=A0tree with the following pre-changes:1. Reverted hack fr=
om
> our tree: 63b76a4638f3934e69c8724881060f121845184c2. Added "arm/tegra=
:
> Support Tegra30 in decompressor UART setup" as=A0 =A0described in the
> patch header.3. Adjusted patch 4 to apply cleanly to our older
> "common.c"4. Added missing #include <linux/kernel.h> to uncompress.h,
> as=A0=A0 =A0indicated by swarren on tegra IRC.
> Also tried stopping in the bootloader and clearing the 'D' with:=A0 m=
w.b
> 0x7000605c 0...and validated that I missed the earlyprintks (as
> expected) butstill booted.
> ---
> On Tue, Jan 3, 2012 at 2:25 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
>> This series allows a Tegra zImage to automatically select the UART t=
o use
>> for the zImage decompressor and early printk, based on information f=
rom
>> the bootloader. The code scans each UART, looking for one that is cl=
ocked,
>> is out of reset, and that the bootloader has written 'D' (for 'D'ebu=
g) to
>> the scratch register.
>>
>> At present, the ChromiumOS branch of U-Boot sets up UARTs in this wa=
y. If
>> this patch is accepted into the kernel, I'll upstream the U-Boot cha=
nge to
>> mainline U-Boot.
>>
>> This is important, since different boards use different UARTs, and i=
t's
>> nice not to have to configure the kernel differently when switching
>> boards.
>>
>> This patch series depends on patch "[PATCH V2] arm/tegra: Support Te=
gra30
>> in decompressor UART setup" for context.
>>
>> Doug Anderson (2):
>> =A0ARM: tegra: Introduce define DEBUG_UART_SHIFT
>> =A0ARM: tegra: uncompress.h: Store UART address in a variable
>>
>> Stephen Warren (2):
>> =A0ARM: tegra: uncompress.h: Choose a UART at runtime
>> =A0ARM: tegra: Pass uncompress.h UART selection to DEBUG_LL
>>
>> =A0arch/arm/mach-tegra/common.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 17 ++++
>> =A0arch/arm/mach-tegra/include/mach/debug-macro.S | =A0 87 +++++++++=
++++++++---
>> =A0arch/arm/mach-tegra/include/mach/uncompress.h =A0| =A0108 +++++++=
++++++++++++++---
>> =A03 files changed, 190 insertions(+), 22 deletions(-)
>>
