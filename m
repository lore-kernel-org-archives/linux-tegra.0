From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra_defconfig: enable APB DMA support
Date: Wed, 29 Aug 2012 11:49:57 +0200
Message-ID: <20120829094957.GF28643@pengutronix.de>
References: <1346230800-3167-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <503DDEA8.1000405@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <503DDEA8.1000405-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 29, 2012 at 02:49:36PM +0530, Laxman Dewangan wrote:
> On Wednesday 29 August 2012 02:30 PM, Uwe Kleine-K=F6nig wrote:
> >Additionally DMADEVICES needs to be enabled as TEGRA20_APB_DMA depen=
ds
> >on that.
> >
> >Signed-off-by: Uwe Kleine-K=F6nig<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >---
> >  arch/arm/configs/tegra_defconfig |    2 ++
> >  1 file changed, 2 insertions(+)
> >
> >diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/teg=
ra_defconfig
> >index db22453..0d6bb73 100644
> >--- a/arch/arm/configs/tegra_defconfig
> >+++ b/arch/arm/configs/tegra_defconfig
> >@@ -145,6 +145,8 @@ CONFIG_MMC_SDHCI_TEGRA=3Dy
> >  CONFIG_RTC_CLASS=3Dy
> >  CONFIG_RTC_DRV_EM3027=3Dy
> >  CONFIG_RTC_DRV_TEGRA=3Dy
> >+CONFIG_DMADEVICES=3Dy
> >+CONFIG_TEGRA20_APB_DMA=3Dy
> >  CONFIG_STAGING=3Dy
> >  CONFIG_SENSORS_ISL29018=3Dy
> >  CONFIG_SENSORS_ISL29028=3Dy
>=20
> Hi Uwe,
> Tegra team is working on to enable the new dma drivr which is
> dmaengine based. We have dma legacy driver as of now in mach-tegra.
> Some of the tests are failing with new dmadriver and so we are not
> able to enable it.
So it depends on what you wanna do with the defconfig. There are two
purposes for them:

 a) compile coverage
 b) starting point for machine support

So it all depends on what you consider to be more important.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
