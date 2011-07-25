From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: only select
 MACH_HAS_SND_SOC_TEGRA_WM8903 if SOUND_SOC
Date: Mon, 25 Jul 2011 23:13:01 +0200
Message-ID: <20110725211301.GM16561@pengutronix.de>
References: <1311608874-31863-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <74CDBE0F657A3D45AFBB94109FB122FF049EBDF52B@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049EBDF52B-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 25, 2011 at 09:14:49AM -0700, Stephen Warren wrote:
> Uwe Kleine-K=F6nig wrote at Monday, July 25, 2011 9:48 AM:
> > This fixes:
> > 	warning: (MACH_HARMONY && MACH_KAEN && MACH_SEABOARD) selects MACH=
_HAS_SND_SOC_TEGRA_WM8903
> > which has unmet direct dependencies (SOUND && !M68K && SND && SND_S=
OC)
>=20
> > diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kcon=
fig
> ...
> >  config MACH_HARMONY
> >         bool "Harmony board"
> > -       select MACH_HAS_SND_SOC_TEGRA_WM8903
> > +       select MACH_HAS_SND_SOC_TEGRA_WM8903 if SOUND_SOC
>=20
> Shouldn't that be SND_SOC?
Hmm, with SOUND_SOC the warning is gone, too :-)

Yeah, will send a fixed patch tomorrow.

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
