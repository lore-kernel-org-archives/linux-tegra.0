From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCHv3 2/4] ARM: tegra: Add SMMU enabler in AHB
Date: Wed, 25 Apr 2012 14:29:50 +0300
Message-ID: <20120425112950.GC3564@arwen.pp.htv.fi>
References: <1335352072-4001-1-git-send-email-hdoyu@nvidia.com>
 <1335352072-4001-2-git-send-email-hdoyu@nvidia.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335352072-4001-2-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, H Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 25, 2012 at 02:07:37PM +0300, Hiroshi DOYU wrote:
> Add extern func, "tegra_ahb_enable_smmu()" to inform AHB that SMMU is
> ready.
>=20
> Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> ---
>  arch/arm/mach-tegra/include/mach/tegra-ahb.h |   19 +++++++++++++++++++
>  drivers/platform/arm/tegra-ahb.c             |   24 ++++++++++++++++++++=
++++
>  2 files changed, 43 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/arm/mach-tegra/include/mach/tegra-ahb.h b/arch/arm/mach=
-tegra/include/mach/tegra-ahb.h
> new file mode 100644
> index 0000000..296688c
> --- /dev/null
> +++ b/arch/arm/mach-tegra/include/mach/tegra-ahb.h
> @@ -0,0 +1,19 @@
> +/*
> + * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + */
> +
> +#ifndef __MACH_TEGRA_AHB_H__
> +#define __MACH_TEGRA_AHB_H__
> +
> +extern int tegra_ahb_enable_smmu(void);
> +
> +#endif	/* __MACH_TEGRA_AHB_H__ */
> diff --git a/drivers/platform/arm/tegra-ahb.c b/drivers/platform/arm/tegr=
a-ahb.c
> index dcad2ec..7ad9dfd 100644
> --- a/drivers/platform/arm/tegra-ahb.c
> +++ b/drivers/platform/arm/tegra-ahb.c
> @@ -78,6 +78,10 @@
> =20
>  #define AHB_ARBITRATION_AHB_MEM_WRQUE_MST_ID	0xf8
> =20
> +#define AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE BIT(17)
> +
> +static struct platform_driver tegra_ahb_driver;
> +
>  static u32 tegra_ahb_gizmo[] =3D {
>  	AHB_ARBITRATION_DISABLE,
>  	AHB_ARBITRATION_PRIORITY_CTRL,
> @@ -126,6 +130,26 @@ static inline void gizmo_writel(struct tegra_ahb *ah=
b, u32 value, u32 offset)
>  	writel(value, ahb->regs + offset);
>  }
> =20
> +#ifdef CONFIG_ARCH_TEGRA_3x_SOC
> +static int __tegra_ahb_enable_smmu(struct device *dev, void *data)
> +{
> +	u32 val;
> +	struct tegra_ahb *ahb =3D dev_get_drvdata(dev);
> +
> +	val =3D gizmo_readl(ahb, AHB_ARBITRATION_XBAR_CTRL);
> +	val |=3D AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE;
> +	gizmo_writel(ahb, val, AHB_ARBITRATION_XBAR_CTRL);
> +	return 0;
> +}
> +
> +int tegra_ahb_enable_smmu(void)
> +{
> +	return driver_for_each_device(&tegra_ahb_driver.driver, NULL, NULL,
> +				      __tegra_ahb_enable_smmu);
> +}
> +EXPORT_SYMBOL(tegra_ahb_enable_smmu);
> +#endif

this is still not correct. If you will always call this whenever you run
on tegra 3, why do you even expose this function ? You can use your
compatible flag to do runtime detection of where you're running and call
this accordingly. Something like:

static const struct of_device_id tegra_ahb_match_table[] =3D {
{
	.compatible =3D "nvidia,tegra2",
}, {
	.compatible =3D "nvidia,tegra3",
	.data	=3D AHB_HAS_SMMU,
},
{  }
};

or something similar, then on probe, you can capture your id and check
if that bit is true, if it is just call tegra_ahb_enable_smmu(), you
really don't need all this trickery with driver_for_each_device().

--=20
balbi

--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPl+AtAAoJEIaOsuA1yqRErHEP/39gDiSIw/E1keYngd+Zpq5M
yQAYc3f/at1O2HSGzo10nt2JDnq/xEd+VleWLLpQTwKykNVtAzcgBMJXilOm+3/g
9Eq+VQ/b+TetWOXfhKhIjKCcFQGKPyWnFd0hSCCk1UAKyzhSlnF+ndxYkrqs2elF
x/x49aer2E+/x/ZFqZJjmFD2vNz2HH0Dbf39SauKNqPW5EXVhSLMlJu95dtiXqx1
aGeQehaOlbXaLwMjeNaEiJG125//AxjUYLy7P5tqxEIsAcEkBgVQQogFyhOxv5b0
2sckQJKmf2LmIfevbhzBTT5CsbHIL8paO3JWalLSNzJQlUTqus86rS4Bxm5k+F0g
6ZqnDzruU9daP9qjV/y8BJHE+09D2ymWLbshjWX0hko9bV8uKWoVfhbGmcLZsg24
ySG+9IVrC6AoFFARyyZOH7xD6Rv/wqEBtBkSN+qCniSEe59p4TtOyWGgVup3aRzp
dLZRgXfhZQGP5Jjt3Bp2+qXaiWJfmaMi787DmJ6qqmQ14sSS0pLCg9g5gDdpgI/4
r32Ws+IbQCp5MJt1p9AZLML5Fkl+A4SF53VO5VmCpKUz0nNdE/ldQ+YpwLMDW399
WPKtldkmlCX7mba8PAB4e4pKq6ODGVgus2yqfapYxeMhyNl0M7W1iLMCCEjxU+iu
nLlSYRqga7iHUk5YUF/z
=knMd
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
