From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
Date: Tue, 18 Jun 2019 13:31:09 +0200
Message-ID: <20190618113109.GE28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AsxXAMtlQ5JHofzM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--AsxXAMtlQ5JHofzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:16AM -0700, Sowjanya Komatineni wrote:
> This patch adds suspend and resume support for Tegra pinctrl driver
> and registers them to syscore so the pinmux settings are restored
> before the devices resume.

This no longer uses syscore ops, so you need to reflect that in the
commit message.

>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 62 ++++++++++++++++++++++++++=
++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  5 +++
>  drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
>  drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
>  7 files changed, 84 insertions(+)
>=20
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegr=
a/pinctrl-tegra.c
> index 34596b246578..ceced30d8bd1 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -20,11 +20,16 @@
>  #include <linux/pinctrl/pinmux.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/slab.h>
> +#include <linux/syscore_ops.h>

No longer needed.

> =20
>  #include "../core.h"
>  #include "../pinctrl-utils.h"
>  #include "pinctrl-tegra.h"
> =20
> +#define EMMC2_PAD_CFGPADCTRL_0			0x1c8
> +#define EMMC4_PAD_CFGPADCTRL_0			0x1e0
> +#define EMMC_DPD_PARKING			(0x1fff << 14)
> +
>  static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
>  {
>  	return readl(pmx->regs[bank] + reg);
> @@ -619,6 +624,48 @@ static void tegra_pinctrl_clear_parked_bits(struct t=
egra_pmx *pmx)
>  			pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
>  		}
>  	}
> +
> +	if (pmx->soc->has_park_padcfg) {
> +		val =3D pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
> +		val &=3D ~EMMC_DPD_PARKING;
> +		pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
> +
> +		val =3D pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
> +		val &=3D ~EMMC_DPD_PARKING;
> +		pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
> +	}
> +}
> +
> +int __maybe_unused tegra_pinctrl_suspend(struct device *dev)
> +{
> +	struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
> +	u32 *backup_regs =3D pmx->backup_regs;
> +	u32 *regs;
> +	int i, j;

Can be unsigned int.

> +
> +	for (i =3D 0; i < pmx->nbanks; i++) {
> +		regs =3D pmx->regs[i];
> +		for (j =3D 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			*backup_regs++ =3D readl(regs++);
> +	}
> +
> +	return pinctrl_force_sleep(pmx->pctl);
> +}
> +
> +int __maybe_unused tegra_pinctrl_resume(struct device *dev)
> +{
> +	struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
> +	u32 *backup_regs =3D pmx->backup_regs;
> +	u32 *regs;
> +	int i, j;

unsigned

> +
> +	for (i =3D 0; i < pmx->nbanks; i++) {
> +		regs =3D pmx->regs[i];
> +		for (j =3D 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			writel(*backup_regs++, regs++);
> +	}
> +
> +	return 0;
>  }
> =20
>  static bool gpio_node_has_range(const char *compatible)
> @@ -645,6 +692,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  	int i;
>  	const char **group_pins;
>  	int fn, gn, gfn;
> +	unsigned long backup_regs_size =3D 0;
> =20
>  	pmx =3D devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
>  	if (!pmx)
> @@ -697,6 +745,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
>  		if (!res)
>  			break;
> +		backup_regs_size +=3D resource_size(res);
>  	}
>  	pmx->nbanks =3D i;
> =20
> @@ -705,11 +754,24 @@ int tegra_pinctrl_probe(struct platform_device *pde=
v,
>  	if (!pmx->regs)
>  		return -ENOMEM;
> =20
> +	pmx->reg_bank_size =3D devm_kcalloc(&pdev->dev, pmx->nbanks,
> +					  sizeof(*pmx->reg_bank_size),
> +					  GFP_KERNEL);
> +	if (!pmx->reg_bank_size)
> +		return -ENOMEM;
> +
> +	pmx->backup_regs =3D devm_kzalloc(&pdev->dev, backup_regs_size,
> +					GFP_KERNEL);
> +	if (!pmx->backup_regs)
> +		return -ENOMEM;
> +
>  	for (i =3D 0; i < pmx->nbanks; i++) {
>  		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
>  		pmx->regs[i] =3D devm_ioremap_resource(&pdev->dev, res);
>  		if (IS_ERR(pmx->regs[i]))
>  			return PTR_ERR(pmx->regs[i]);
> +
> +		pmx->reg_bank_size[i] =3D resource_size(res);
>  	}
> =20
>  	pmx->pctl =3D devm_pinctrl_register(&pdev->dev, &tegra_pinctrl_desc, pm=
x);
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegr=
a/pinctrl-tegra.h
> index 287702660783..d63e472ee0e1 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
> @@ -17,6 +17,8 @@ struct tegra_pmx {
> =20
>  	int nbanks;
>  	void __iomem **regs;
> +	size_t *reg_bank_size;
> +	u32 *backup_regs;
>  };
> =20
>  enum tegra_pinconf_param {
> @@ -191,8 +193,11 @@ struct tegra_pinctrl_soc_data {
>  	bool hsm_in_mux;
>  	bool schmitt_in_mux;
>  	bool drvtype_in_mux;
> +	bool has_park_padcfg;
>  };
> =20
>  int tegra_pinctrl_probe(struct platform_device *pdev,
>  			const struct tegra_pinctrl_soc_data *soc_data);
> +int __maybe_unused tegra_pinctrl_suspend(struct device *dev);
> +int __maybe_unused tegra_pinctrl_resume(struct device *dev);
>  #endif
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/t=
egra/pinctrl-tegra114.c
> index 762151f17a88..06ea8164df9d 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
> @@ -1841,6 +1841,7 @@ static const struct tegra_pinctrl_soc_data tegra114=
_pinctrl =3D {
>  	.hsm_in_mux =3D false,
>  	.schmitt_in_mux =3D false,
>  	.drvtype_in_mux =3D false,
> +	.has_park_padcfg =3D false,
>  };
> =20
>  static int tegra114_pinctrl_probe(struct platform_device *pdev)
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/t=
egra/pinctrl-tegra124.c
> index 930c43758c92..abc8fe92d154 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
> @@ -2053,6 +2053,7 @@ static const struct tegra_pinctrl_soc_data tegra124=
_pinctrl =3D {
>  	.hsm_in_mux =3D false,
>  	.schmitt_in_mux =3D false,
>  	.drvtype_in_mux =3D false,
> +	.has_park_padcfg =3D false,
>  };
> =20
>  static int tegra124_pinctrl_probe(struct platform_device *pdev)
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/te=
gra/pinctrl-tegra20.c
> index 4b7837e38fb5..993b82cbfba7 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
> @@ -2223,6 +2223,7 @@ static const struct tegra_pinctrl_soc_data tegra20_=
pinctrl =3D {
>  	.hsm_in_mux =3D false,
>  	.schmitt_in_mux =3D false,
>  	.drvtype_in_mux =3D false,
> +	.has_park_padcfg =3D false,
>  };
> =20
>  static const char *cdev1_parents[] =3D {
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/t=
egra/pinctrl-tegra210.c
> index 0b56ad5c9c1c..10e8a2ec8094 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> @@ -1555,6 +1555,7 @@ static const struct tegra_pinctrl_soc_data tegra210=
_pinctrl =3D {
>  	.hsm_in_mux =3D true,
>  	.schmitt_in_mux =3D true,
>  	.drvtype_in_mux =3D true,
> +	.has_park_padcfg =3D true,
>  };
> =20
>  static int tegra210_pinctrl_probe(struct platform_device *pdev)
> @@ -1562,6 +1563,17 @@ static int tegra210_pinctrl_probe(struct platform_=
device *pdev)
>  	return tegra_pinctrl_probe(pdev, &tegra210_pinctrl);
>  }
> =20
> +#ifdef CONFIG_PM_SLEEP
> +static const struct dev_pm_ops tegra_pinctrl_pm =3D {
> +	.suspend =3D &tegra_pinctrl_suspend,
> +	.resume =3D &tegra_pinctrl_resume
> +};
> +
> +#define TEGRA_PINCTRL_PM	(&tegra_pinctrl_pm)
> +#else
> +#define TEGRA_PINCTRL_PM	NULL
> +#endif

I think we can simplify this by just dropping the #ifdef. We don't allow
!PM on Tegra anymore and suspend/resume is something that most users
will want to enable. There's very little gain in making the dev_pm_ops
conditional, and keeping them around unconditionally make it simple.

> +
>  static const struct of_device_id tegra210_pinctrl_of_match[] =3D {
>  	{ .compatible =3D "nvidia,tegra210-pinmux", },
>  	{ },
> @@ -1571,6 +1583,7 @@ static struct platform_driver tegra210_pinctrl_driv=
er =3D {
>  	.driver =3D {
>  		.name =3D "tegra210-pinctrl",
>  		.of_match_table =3D tegra210_pinctrl_of_match,
> +		.pm    =3D TEGRA_PINCTRL_PM,

Please use a single space around '=3D'. No need for arbitrary padding.

Thierry Reding

--AsxXAMtlQ5JHofzM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Iy3oACgkQ3SOs138+
s6GF5A/+PkT9AJcXPXlbMbbaudvfHoOYpcq/kmz+8cDGT6nRH1Q4M1nXYcBYKZL5
00aPyfQc1YVldWvuUDqWTCpqtXgnr+TFd9mM5iWRXqsWXzy/vEmgfXLl+szchsMG
pKqkJ458lMayZveEAUSYvO/ndRxg0UkKSJhAj5llFLYBf+PEMCQHZPs1tN89fI7/
k0to4U8VnVk/KtddRxulkrJtKibVMEedV2N42IyIElmV6F174Y7rzapdqhlqfe0S
JcMYkGRjEjBH+gCPa0DV2xBYDZ9rkRoYfN2k7HJO/KZznbUnuyyFo+ZjyMBebnS0
GyD7VR9+zmcmZtJj1T4ySZVkzMS20wfSYo4haYbPEFSseZn1kjbgNPhL1zvXINnA
zh7u6pd4/3w8hXE6sQvhZ5mF9IdfEJ4NcOc7FCTQ6x0cZwBmcMTQOWw/QDvYGSXs
ScHimf01py7yhXo9rMGoiGJ8XDAddlRDswj5/6joIKywDLtBJx+kbC0TXy/089SE
h5KQmRGG4NUXPUCxJm0LYY7sgBf/iMFDDO3a802xPiVJWh9j7/p0ZmFnbfQATbId
71K2CKlonXurcfXsMhd8rLTTmvjqDc+j0KTfV0msm1xJU+byoUouaTiGUpsNBgiY
WvEaWdqnQ1ztZj0y/AtDve/SQtPepBK7cEGT75xwSGP7jIR7dsc=
=9xsm
-----END PGP SIGNATURE-----

--AsxXAMtlQ5JHofzM--
