From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add PCIe-related pins to the Jetson TK1 pinmux
 tables
Date: Mon, 25 Aug 2014 13:55:11 +0300
Message-ID: <53FB160F.6000700@nvidia.com>
References: <1408742308-18004-1-git-send-email-swarren@wwwdotorg.org> <53FB10B8.3010408@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53FB10B8.3010408-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 25/08/14 13:32, Andreas F=E4rber wrote:
> Hi Stephen,
>
> Am 22.08.2014 23:18, schrieb Stephen Warren:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> This pinmux tables currently omit any configuration for PCIe clk_req=
,
>> wake, and rst pins, which in turn causes intermittent failures in
>> U-Boot's PCIe support. Import an updated version of the pinmux table=
s
>> which rectifies this.
>>
>> (While I'm still hoping to remove the pinmux tables from DTs for
>> Tegra124+ devices, while they're still here, they may as well be
>> complete and correct).
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/tegra124-jetson-tk1.dts | 35 +++++++++++++++++++=
++++++++++++
>>   1 file changed, 35 insertions(+)
>
> I've tested this patch on both -rc1 and yesterday's torvalds/linux.gi=
t
> with tegra_defconfig: Both with or without this patch I get empty lsp=
ci
> output.
>
> There doesn't seem to be a tegra/linux.git for-next branch based on -=
rc1
> yet - are patches from other subsystem trees needed to get the on-boa=
rd
> Ethernet detected or maybe some config option?

git://gitorious.org/thierryreding/linux.git staging/pci

>
> Or did you test PCIe via the on-board slot?
>
> I used U-Boot v2014.07, in case it matters.
>
> Thanks,
> Andreas
>

Cheers,
Mikko
