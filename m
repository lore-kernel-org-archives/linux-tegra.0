From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: boards: more __init/__initdata annotations
Date: Tue, 20 Dec 2011 09:06:41 -0800
Message-ID: <CAOesGMjh2DmzgjvoYZyDygADDcMwf-m7E3Np0f=h8xRWZZ6-4Q@mail.gmail.com>
References: <1324353802-31774-1-git-send-email-olof@lixom.net>
	<20111220082641.GQ14542@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111220082641.GQ14542-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 20, 2011 at 12:26 AM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Mon, Dec 19, 2011 at 08:03:22PM -0800, Olof Johansson wrote:
>> Silence a bunch of section warnings, and mark some of the init funct=
ions as
>> __init.
>>
>> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>> ---
>> =A0arch/arm/mach-tegra/board-harmony-pinmux.c =A0 | =A0 =A08 ++++---=
-
>> =A0arch/arm/mach-tegra/board-paz00-pinmux.c =A0 =A0 | =A0 =A08 ++++-=
---
>> =A0arch/arm/mach-tegra/board-seaboard-pinmux.c =A0| =A0 16 ++++++++-=
-------
>> =A0arch/arm/mach-tegra/board-trimslice-pinmux.c | =A0 =A04 ++--
>> =A04 files changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/arm/mach-tegra/board-harmony-pinmux.c b/arch/arm/m=
ach-tegra/board-harmony-pinmux.c
>> index 465808c..84cfbef 100644
>> --- a/arch/arm/mach-tegra/board-harmony-pinmux.c
>> +++ b/arch/arm/mach-tegra/board-harmony-pinmux.c
>> @@ -25,7 +25,7 @@
>> =A0#include "board-harmony.h"
>> =A0#include "board-pinmux.h"
>>
>> -static struct tegra_pingroup_config harmony_pinmux[] =3D {
>> +static __initdata struct tegra_pingroup_config harmony_pinmux[] =3D=
 {
>
> __initdata goes at the end of the declaration - just before the '=3D'=
=2E

Thanks for pointing it out -- looks like a couple of other instances
use the wrong location as well (probably added by me in the past).
I'll respin the patch, and fix up those cases as well.

-Olof
