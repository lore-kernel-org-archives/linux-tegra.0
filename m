From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add PCIe-related pins to the Jetson TK1 pinmux
 tables
Date: Wed, 27 Aug 2014 00:26:08 +0200
Message-ID: <53FD0980.2010803@suse.de>
References: <1408742308-18004-1-git-send-email-swarren@wwwdotorg.org> <53FB10B8.3010408@suse.de> <53FB160F.6000700@nvidia.com> <53FB27AB.8010608@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53FB27AB.8010608-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am 25.08.2014 14:10, schrieb Mikko Perttunen:
> On 25/08/14 13:55, Mikko Perttunen wrote:
>> On 25/08/14 13:32, Andreas F=E4rber wrote:
>>> Am 22.08.2014 23:18, schrieb Stephen Warren:
>>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> This pinmux tables currently omit any configuration for PCIe clk_r=
eq,
>>>> wake, and rst pins, which in turn causes intermittent failures in
>>>> U-Boot's PCIe support. Import an updated version of the pinmux tab=
les
>>>> which rectifies this.
>>>>
>>>> (While I'm still hoping to remove the pinmux tables from DTs for
>>>> Tegra124+ devices, while they're still here, they may as well be
>>>> complete and correct).
>>>>
>>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>   arch/arm/boot/dts/tegra124-jetson-tk1.dts | 35
>>>> +++++++++++++++++++++++++++++++
>>>>   1 file changed, 35 insertions(+)
>>>
>>> I've tested this patch on both -rc1 and yesterday's torvalds/linux.=
git
>>> with tegra_defconfig: Both with or without this patch I get empty l=
spci
>>> output.
>>>
>>> There doesn't seem to be a tegra/linux.git for-next branch based on=
 -rc1
>>> yet - are patches from other subsystem trees needed to get the on-b=
oard
>>> Ethernet detected or maybe some config option?
>>
>> git://gitorious.org/thierryreding/linux.git staging/pci
>
> .. and apparently the device tree patches are in staging/tegra.

Thanks for the URLs. I tested yesterday's staging/master, but booting
from SD seemed broked, sdhci-tegra probe kept deferring. Is that a know=
n
issue?

PCI bus was getting detected okay before that point though.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
