From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 06/10] pwm: Add NVIDIA Tegra SoC support
Date: Fri, 16 Mar 2012 09:21:31 +0100
Message-ID: <20120316082131.GB6458@avionic-0098.mockup.avionic-design.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-7-git-send-email-thierry.reding@avionic-design.de>
 <20120316080025.GD7758@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120316080025.GD7758-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Shawn Guo wrote:
> On Wed, Mar 14, 2012 at 04:56:29PM +0100, Thierry Reding wrote:
> > This commit adds a generic PWM framework driver for the PWFM controller
> > found on NVIDIA Tegra SoCs. The driver is based on code from the
> > Chromium kernel tree and was originally written by Gary King (NVIDIA)
> > and later modified by Simon Que (Chromium).
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
> > Changes in v4:
> >   - merge patch from ChromiumOS kernel to fix a rounding issue
> >   - move DT code to patch 7
> >=20
> > Changes in v3:
> >   - use pwm_device.hwpwm instead of recomputing it
> >   - update pwm_ops for changes in patch 2
> >=20
> > Changes in v2:
> >   - set pwm_chip.dev field
> >   - rename clk_enb to enable
> >   - introduce NUM_PWM macro instead of hard-coding the number of PWM
> >     devices
> >   - update comment in tegra_pwm_config
> >   - fix coding-style for multi-line comments
> >   - use module_platform_driver
> >   - change license to GPL
> >=20
> >  drivers/pwm/Kconfig     |   10 ++
> >  drivers/pwm/Makefile    |    1 +
> >  drivers/pwm/pwm-tegra.c |  256 +++++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 267 insertions(+)
> >  create mode 100644 drivers/pwm/pwm-tegra.c
> >=20
> > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > index 93c1052..bda6f23 100644
> > --- a/drivers/pwm/Kconfig
> > +++ b/drivers/pwm/Kconfig
> > @@ -9,4 +9,14 @@ menuconfig PWM
> > =20
> >  if PWM
> > =20
> > +config PWM_TEGRA
> > +	tristate "NVIDIA Tegra PWM support"
> > +	depends on ARCH_TEGRA
> > +	help
> > +	  Generic PWM framework driver for the PWFM controller found on NVIDIA
> > +	  Tegra SoCs.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called pwm-tegra.
> > +
> >  endif
> > diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> > index 3469c3d..12300f5 100644
> > --- a/drivers/pwm/Makefile
> > +++ b/drivers/pwm/Makefile
> > @@ -1 +1,2 @@
> >  obj-$(CONFIG_PWM)		+=3D core.o
> > +obj-$(CONFIG_PWM_TEGRA)		+=3D pwm-tegra.o
> > diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
> > new file mode 100644
> > index 0000000..19540fc
> > --- /dev/null
> > +++ b/drivers/pwm/pwm-tegra.c
> > @@ -0,0 +1,256 @@
> > +/*
> > + * drivers/pwm/pwm-tegra.c
> > + *
> > + * Tegra pulse-width-modulation controller driver
> > + *
> > + * Copyright (c) 2010, NVIDIA Corporation.
> > + * Based on arch/arm/plat-mxc/pwm.c by Sascha Hauer <s.hauer@pengutron=
ix.de>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but=
 WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licen=
se for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License a=
long
> > + * with this program; if not, write to the Free Software Foundation, I=
nc.,
> > + * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/pwm.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +#define PWM_ENABLE	(1 << 31)
> > +#define PWM_DUTY_WIDTH	8
> > +#define PWM_DUTY_SHIFT	16
> > +#define PWM_SCALE_WIDTH	13
> > +#define PWM_SCALE_SHIFT	0
> > +
> > +#define NUM_PWM 4
> > +
> > +struct tegra_pwm_chip {
> > +	struct pwm_chip		chip;
> > +	struct device		*dev;
> > +
> > +	struct clk		*clk;
> > +
> > +	int			enable[NUM_PWM];
> > +	void __iomem		*mmio_base;
> > +};
> > +
> > +static inline struct tegra_pwm_chip *to_tegra_pwm_chip(struct pwm_chip=
 *chip)
> > +{
> > +	return container_of(chip, struct tegra_pwm_chip, chip);
> > +}
> > +
> > +static inline int pwm_writel(struct tegra_pwm_chip *chip, unsigned int=
 num,
> > +		unsigned long val)
> > +{
> > +	unsigned long offset =3D num << 4;
> > +	int rc;
> > +
> > +	rc =3D clk_enable(chip->clk);
> > +	if (WARN_ON(rc))
> > +		return rc;
> > +
> > +	writel(val, chip->mmio_base + offset);
> > +	clk_disable(chip->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *=
pwm,
> > +		int duty_ns, int period_ns)
> > +{
> > +	struct tegra_pwm_chip *pc =3D to_tegra_pwm_chip(chip);
> > +	unsigned long long c;
> > +	unsigned long rate, hz;
> > +	u32 val =3D 0;
> > +
>=20
> Every pwm driver I have been looking at has some validation on
> parameters here, something like:
>=20
> 	if (pwm =3D=3D NULL || period_ns =3D=3D 0 || duty_ns > period_ns)
> 		return -EINVAL;
>=20
> It's not needed for tegra, or the check on those platforms is
> unnecessary?

Yes, I should add similar checks for the Tegra driver. On the other hand
maybe the checks should be pushed into the core. At least those checks that
are truly general sanity checks. Off the top of my head, I can think of the
following general preconditions:

	pwm !=3D NULL
	period_ns > 0
	duty_ns >=3D 0
	duty_ns <=3D period_ns

Of course duty_ns >=3D 0 could be done away with by just making the duty_ns=
 and
period_ns parameters unsigned. But such changes were actually supposed to be
added incrementally once the framework had been merged.

> > +	r =3D devm_request_mem_region(&pdev->dev, r->start, resource_size(r),
> > +			pdev->name);
> > +	if (!r) {
> > +		dev_err(&pdev->dev, "failed to request memory\n");
> > +		return -EBUSY;
> > +	}
> > +
> > +	pwm->mmio_base =3D devm_ioremap(&pdev->dev, r->start, resource_size(r=
));
> > +	if (!pwm->mmio_base) {
> > +		dev_err(&pdev->dev, "failed to ioremap() region\n");
> > +		return -ENODEV;
> > +	}
> > +
>=20
> The helper devm_request_and_ioremap() can help here?

Yes, absolutely.

> > +static struct platform_driver tegra_pwm_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "tegra-pwm",
> > +	},
> > +	.probe =3D tegra_pwm_probe,
> > +	.remove =3D __devexit_p(tegra_pwm_remove),
> > +};
> > +
> I would remove this blank line.
>=20
> > +module_platform_driver(tegra_pwm_driver);

I don't know; I think it makes the code cluttered.

Thierry

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9i+AsACgkQZ+BJyKLjJp+DNwCePQqPJAezVD5FIcwwQ7XYv/Y5
jVgAn0P8/4NICBPj0gxHLMGHb5Hzyb/d
=CZWc
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
