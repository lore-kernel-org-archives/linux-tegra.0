From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra_defconfig: enable APB DMA support
Date: Wed, 29 Aug 2012 14:49:36 +0530
Message-ID: <503DDEA8.1000405@nvidia.com>
References: <1346230800-3167-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346230800-3167-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 29 August 2012 02:30 PM, Uwe Kleine-K=C3=B6nig wrote:
> Additionally DMADEVICES needs to be enabled as TEGRA20_APB_DMA depend=
s
> on that.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>   arch/arm/configs/tegra_defconfig |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegr=
a_defconfig
> index db22453..0d6bb73 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -145,6 +145,8 @@ CONFIG_MMC_SDHCI_TEGRA=3Dy
>   CONFIG_RTC_CLASS=3Dy
>   CONFIG_RTC_DRV_EM3027=3Dy
>   CONFIG_RTC_DRV_TEGRA=3Dy
> +CONFIG_DMADEVICES=3Dy
> +CONFIG_TEGRA20_APB_DMA=3Dy
>   CONFIG_STAGING=3Dy
>   CONFIG_SENSORS_ISL29018=3Dy
>   CONFIG_SENSORS_ISL29028=3Dy

Hi Uwe,
Tegra team is working on to enable the new dma drivr which is dmaengine=
=20
based. We have dma legacy driver as of now in mach-tegra. Some of the=20
tests are failing with new dmadriver and so we are not able to enable i=
t.
The patch series which is posted against this is:

[PATCH 0/5] ARM: tegra: move all APB DMA client to dmaengine based driv=
er

Thanks,
Laxman
