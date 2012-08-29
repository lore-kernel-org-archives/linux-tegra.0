From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra_defconfig: enable APB DMA support
Date: Wed, 29 Aug 2012 10:34:00 -0700
Message-ID: <503E5288.90602@wwwdotorg.org>
References: <1346230800-3167-1-git-send-email-u.kleine-koenig@pengutronix.de> <503DDEA8.1000405@nvidia.com> <20120829094957.GF28643@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120829094957.GF28643-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/29/12 02:49, Uwe Kleine-K=F6nig wrote:
> On Wed, Aug 29, 2012 at 02:49:36PM +0530, Laxman Dewangan wrote:
>> On Wednesday 29 August 2012 02:30 PM, Uwe Kleine-K=F6nig wrote:
>>> Additionally DMADEVICES needs to be enabled as TEGRA20_APB_DMA depe=
nds
>>> on that.
>>>
>>> Signed-off-by: Uwe Kleine-K=F6nig<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> ---
>>>   arch/arm/configs/tegra_defconfig |    2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/te=
gra_defconfig
>>> index db22453..0d6bb73 100644
>>> --- a/arch/arm/configs/tegra_defconfig
>>> +++ b/arch/arm/configs/tegra_defconfig
>>> @@ -145,6 +145,8 @@ CONFIG_MMC_SDHCI_TEGRA=3Dy
>>>   CONFIG_RTC_CLASS=3Dy
>>>   CONFIG_RTC_DRV_EM3027=3Dy
>>>   CONFIG_RTC_DRV_TEGRA=3Dy
>>> +CONFIG_DMADEVICES=3Dy
>>> +CONFIG_TEGRA20_APB_DMA=3Dy
>>>   CONFIG_STAGING=3Dy
>>>   CONFIG_SENSORS_ISL29018=3Dy
>>>   CONFIG_SENSORS_ISL29028=3Dy
>>
>> Hi Uwe,
>> Tegra team is working on to enable the new dma drivr which is
>> dmaengine based. We have dma legacy driver as of now in mach-tegra.
>> Some of the tests are failing with new dmadriver and so we are not
>> able to enable it.
> So it depends on what you wanna do with the defconfig. There are two
> purposes for them:
>
>   a) compile coverage
>   b) starting point for machine support
>
> So it all depends on what you consider to be more important.

I'd prefer tegra_defconfig to produce a useful working system. I believ=
e=20
that enabling both DMA drivers at the same time will cause conflicts.=20
Hopefully the switch to the new DMA driver is coming very soon, and thi=
s=20
patch (or equivalent) will be part of that.
