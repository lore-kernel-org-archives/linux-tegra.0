From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add Tegra194 pinmux driver
Date: Fri, 26 Apr 2019 15:16:40 +0200
Message-ID: <20190426131640.GD16228@ulmo>
References: <1556247378-3335-1-git-send-email-kyarlagadda@nvidia.com>
 <1556247378-3335-2-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556247378-3335-2-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: linus.walleij@linaro.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, pdeschrijver@nvidia.com, josephl@nvidia.com, smangipudi@nvidia.com, ldewangan@nvidia.com, vidyas@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2019 at 08:26:18AM +0530, Krishna Yarlagadda wrote:
> Tegra194 has PCIE L5 rst and clkreq pins which need to be controlled
> dynamically at runtime. This driver supports change pinmux for these
> pins. Pinmux for rest of the pins is set statically by bootloader and
> will not be changed by this driver
>=20
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> Signed-off-by: Suresh Mangipudi <smangipudi@nvidia.com>
> ---
>  drivers/pinctrl/tegra/Kconfig            |   4 +
>  drivers/pinctrl/tegra/Makefile           |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra.c    |   8 +-
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |   8 +-
>  drivers/pinctrl/tegra/pinctrl-tegra194.c | 175 +++++++++++++++++++++++++=
++++++
>  drivers/soc/tegra/Kconfig                |   1 +
>  6 files changed, 189 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra194.c
>=20
> diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
> index 24e20cc..6f79f1f 100644
> --- a/drivers/pinctrl/tegra/Kconfig
> +++ b/drivers/pinctrl/tegra/Kconfig
> @@ -23,6 +23,10 @@ config PINCTRL_TEGRA210
>  	bool
>  	select PINCTRL_TEGRA
> =20
> +config PINCTRL_TEGRA194
> +	bool
> +	select PINCTRL_TEGRA
> +
>  config PINCTRL_TEGRA_XUSB
>  	def_bool y if ARCH_TEGRA
>  	select GENERIC_PHY
> diff --git a/drivers/pinctrl/tegra/Makefile b/drivers/pinctrl/tegra/Makef=
ile
> index bbcb043..ead4e10 100644
> --- a/drivers/pinctrl/tegra/Makefile
> +++ b/drivers/pinctrl/tegra/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_PINCTRL_TEGRA30)		+=3D pinctrl-tegra30.o
>  obj-$(CONFIG_PINCTRL_TEGRA114)		+=3D pinctrl-tegra114.o
>  obj-$(CONFIG_PINCTRL_TEGRA124)		+=3D pinctrl-tegra124.o
>  obj-$(CONFIG_PINCTRL_TEGRA210)		+=3D pinctrl-tegra210.o
> +obj-$(CONFIG_PINCTRL_TEGRA194)		+=3D pinctrl-tegra194.o
>  obj-$(CONFIG_PINCTRL_TEGRA_XUSB)	+=3D pinctrl-tegra-xusb.o
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegr=
a/pinctrl-tegra.c
> index a5008c0..76e88c4 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -292,7 +292,7 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
>  			     const struct tegra_pingroup *g,
>  			     enum tegra_pinconf_param param,
>  			     bool report_err,
> -			     s8 *bank, s16 *reg, s8 *bit, s8 *width)
> +			     s8 *bank, s32 *reg, s8 *bit, s8 *width)
>  {
>  	switch (param) {
>  	case TEGRA_PINCONF_PARAM_PULL:
> @@ -451,7 +451,7 @@ static int tegra_pinconf_group_get(struct pinctrl_dev=
 *pctldev,
>  	const struct tegra_pingroup *g;
>  	int ret;
>  	s8 bank, bit, width;
> -	s16 reg;
> +	s32 reg;
>  	u32 val, mask;
> =20
>  	g =3D &pmx->soc->groups[group];
> @@ -480,7 +480,7 @@ static int tegra_pinconf_group_set(struct pinctrl_dev=
 *pctldev,
>  	const struct tegra_pingroup *g;
>  	int ret, i;
>  	s8 bank, bit, width;
> -	s16 reg;
> +	s32 reg;
>  	u32 val, mask;
> =20
>  	g =3D &pmx->soc->groups[group];
> @@ -548,7 +548,7 @@ static void tegra_pinconf_group_dbg_show(struct pinct=
rl_dev *pctldev,
>  	const struct tegra_pingroup *g;
>  	int i, ret;
>  	s8 bank, bit, width;
> -	s16 reg;
> +	s32 reg;
>  	u32 val;
> =20
>  	g =3D &pmx->soc->groups[group];
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegr=
a/pinctrl-tegra.h
> index 44c7194..82cd947 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
> @@ -143,10 +143,10 @@ struct tegra_pingroup {
>  	const unsigned *pins;
>  	u8 npins;
>  	u8 funcs[4];
> -	s16 mux_reg;
> -	s16 pupd_reg;
> -	s16 tri_reg;
> -	s16 drv_reg;
> +	s32 mux_reg;
> +	s32 pupd_reg;
> +	s32 tri_reg;
> +	s32 drv_reg;
>  	u32 mux_bank:2;
>  	u32 pupd_bank:2;
>  	u32 tri_bank:2;

I think the above should go into a separate, preparatory patch that
explains in the commit message why this change is necessary.

> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/t=
egra/pinctrl-tegra194.c
> new file mode 100644
> index 0000000..9172a8c
> --- /dev/null
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> @@ -0,0 +1,175 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Pinctrl data for the NVIDIA Tegra210 pinmux

You probably meant to say Tegra194 here.

> + *
> + * Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
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
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +
> +#include "pinctrl-tegra.h"
> +
> +#define _GPIO(offset)			(offset)

This is rather pointless.

> +#define NUM_GPIOS			(TEGRA_PIN_PEX_L5_RST_N_PGG1 + 1)

Perhaps make this part of the enum pin_id enum below so that it doesn't
look out of place?

> +
> +/* Define unique ID for each pins */
> +enum pin_id {
> +	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0 =3D _GPIO(256),
> +	TEGRA_PIN_PEX_L5_RST_N_PGG1 =3D _GPIO(257),
> +};
> +
> +/* Table for pin descriptor */
> +static const struct pinctrl_pin_desc tegra194_pins[] =3D {
> +	PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
> +		    "TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0"),
> +	PINCTRL_PIN(TEGRA_PIN_PEX_L5_RST_N_PGG1,
> +		    "TEGRA_PIN_PEX_L5_RST_N_PGG1"),
> +};
> +
> +static const unsigned int pex_l5_clkreq_n_pgg0_pins[] =3D {
> +	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
> +};
> +
> +static const unsigned int pex_l5_rst_n_pgg1_pins[] =3D {
> +	TEGRA_PIN_PEX_L5_RST_N_PGG1,
> +};
> +
> +/* Define unique ID for each function */
> +enum tegra_mux_dt {
> +	TEGRA_MUX_RSVD0,
> +	TEGRA_MUX_RSVD1,
> +	TEGRA_MUX_RSVD2,
> +	TEGRA_MUX_RSVD3,
> +	TEGRA_MUX_PE5,
> +};
> +
> +/* Make list of each function name */
> +#define TEGRA_PIN_FUNCTION(lid)			\
> +	{					\
> +		.name =3D #lid,			\
> +	}
> +static struct tegra_function tegra194_functions[] =3D {
> +	TEGRA_PIN_FUNCTION(rsvd0),
> +	TEGRA_PIN_FUNCTION(rsvd1),
> +	TEGRA_PIN_FUNCTION(rsvd2),
> +	TEGRA_PIN_FUNCTION(rsvd3),
> +	TEGRA_PIN_FUNCTION(pe5),
> +};
> +
> +#define PINGROUP_REG_Y(r) ((r))
> +#define DRV_PINGROUP_Y(r) ((r))

Again, why do we need this?

> +
> +#define DRV_PINGROUP_ENTRY_Y(r, drvdn_b, drvdn_w, drvup_b,	\
> +			     drvup_w, slwr_b, slwr_w, slwf_b,	\
> +			     slwf_w, bank)			\
> +		.drv_reg =3D DRV_PINGROUP_Y(r),			\
> +		.drv_bank =3D bank,				\
> +		.drvdn_bit =3D drvdn_b,				\
> +		.drvdn_width =3D drvdn_w,				\
> +		.drvup_bit =3D drvup_b,				\
> +		.drvup_width =3D drvup_w,				\
> +		.slwr_bit =3D slwr_b,				\
> +		.slwr_width =3D slwr_w,				\
> +		.slwf_bit =3D slwf_b,				\
> +		.slwf_width =3D slwf_w
> +
> +#define PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk, e_input,	\
> +			     e_od, schmitt_b, drvtype)		\
> +		.mux_reg =3D PINGROUP_REG_Y(r),			\
> +		.lpmd_bit =3D -1,					\
> +		.lock_bit =3D -1,					\
> +		.hsm_bit =3D -1,					\
> +		.parked_bit =3D -1,				\
> +		.mux_bank =3D bank,				\
> +		.mux_bit =3D 0,					\
> +		.pupd_reg =3D PINGROUP_REG_##pupd(r),		\
> +		.pupd_bank =3D bank,				\
> +		.pupd_bit =3D 2,					\
> +		.tri_reg =3D PINGROUP_REG_Y(r),			\
> +		.tri_bank =3D bank,				\
> +		.tri_bit =3D 4,					\
> +		.einput_bit =3D e_input,				\
> +		.odrain_bit =3D e_od,				\
> +		.schmitt_bit =3D schmitt_b,			\
> +		.drvtype_bit =3D 13,				\
> +		.drv_reg =3D -1
> +
> +#define drive_pex_l5_clkreq_n_pgg0				\
> +	DRV_PINGROUP_ENTRY_Y(0x14004, 12, 5, 20, 5, -1, -1, -1, -1, 0)
> +#define drive_pex_l5_rst_n_pgg1					\
> +	DRV_PINGROUP_ENTRY_Y(0x1400c, 12, 5, 20, 5, -1, -1, -1, -1, 0)
> +
> +#define PINGROUP(pg_name, f0, f1, f2, f3, r, bank, pupd, e_lpbk,	\
> +		 e_input, e_lpdr, e_od, schmitt_b, drvtype, io_rail)	\
> +	{							\
> +		.name =3D #pg_name,				\
> +		.pins =3D pg_name##_pins,				\
> +		.npins =3D ARRAY_SIZE(pg_name##_pins),		\
> +			.funcs =3D {				\
> +				TEGRA_MUX_##f0,			\
> +				TEGRA_MUX_##f1,			\
> +				TEGRA_MUX_##f2,			\
> +				TEGRA_MUX_##f3,			\
> +			},					\
> +		PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk,	\
> +				     e_input, e_od,		\
> +				     schmitt_b, drvtype),	\
> +		drive_##pg_name,				\
> +	}
> +
> +static const struct tegra_pingroup tegra194_groups[] =3D {
> +	PINGROUP(pex_l5_clkreq_n_pgg0, PE5, RSVD1, RSVD2, RSVD3, 0x14000, 0,
> +		 Y, -1, 6, 8, 11, 12, N, "vddio_pex_ctl_2"),
> +	PINGROUP(pex_l5_rst_n_pgg1, PE5, RSVD1, RSVD2, RSVD3, 0x14008, 0,
> +		 Y, -1, 6, 8, 11, 12, N, "vddio_pex_ctl_2"),
> +};
> +
> +static const struct tegra_pinctrl_soc_data tegra194_pinctrl =3D {
> +	.ngpios =3D NUM_GPIOS,
> +	.pins =3D tegra194_pins,
> +	.npins =3D ARRAY_SIZE(tegra194_pins),
> +	.functions =3D tegra194_functions,
> +	.nfunctions =3D ARRAY_SIZE(tegra194_functions),
> +	.groups =3D tegra194_groups,
> +	.ngroups =3D ARRAY_SIZE(tegra194_groups),
> +	.hsm_in_mux =3D true,
> +	.schmitt_in_mux =3D true,
> +	.drvtype_in_mux =3D true,
> +};
> +
> +static int tegra194_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return tegra_pinctrl_probe(pdev, &tegra194_pinctrl);
> +}
> +
> +static const struct of_device_id tegra194_pinctrl_of_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra194-pinmux", },
> +	{ },
> +};
> +
> +static struct platform_driver tegra194_pinctrl_driver =3D {
> +	.driver =3D {
> +		.name =3D "tegra194-pinctrl",
> +		.of_match_table =3D tegra194_pinctrl_of_match,
> +	},
> +	.probe =3D tegra194_pinctrl_probe,
> +};
> +
> +static int __init tegra194_pinctrl_init(void)
> +{
> +	return platform_driver_register(&tegra194_pinctrl_driver);
> +}
> +arch_initcall(tegra194_pinctrl_init);
> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
> index a0b0344..b6d3a2e 100644
> --- a/drivers/soc/tegra/Kconfig
> +++ b/drivers/soc/tegra/Kconfig
> @@ -107,6 +107,7 @@ config ARCH_TEGRA_186_SOC
> =20
>  config ARCH_TEGRA_194_SOC
>  	bool "NVIDIA Tegra194 SoC"
> +	select PINCTRL_TEGRA194
>  	select MAILBOX
>  	select TEGRA_BPMP
>  	select TEGRA_HSP_MBOX

This should be a separate patch. Also, make sure the select entries are
sorted alphabetically.

Thierry

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzDBLgACgkQ3SOs138+
s6FVcQ/+KxCHjpFUlol7k+sjpu8Wylck0TYNszvr9kfu8OToUi3DEKl1f1zqH6Fy
kK463e76VLkgzXesvaZ+sHCYuETuEHIIFfdIiqxSaaGLUe/N5OC94RJccLlS4hjZ
Dai8w+6e2r5zJSg6qoOpZD2oZDBGg33Voq0rqV3d4BNCGC83diVYiXcw+uGN9S4J
Fotjl1nXG1pSxO0pAduiM2LxTMCEQCZzW5vBCxUQt3W7kId3FAIdTxFWmV2xcR1E
9KWBYB8ODxYSY1vffFoYapF0fbtMZ1b5DMz5jL/Jymgm559rAgDc9pODOfPLjK8J
eZaSR8gjVZKNIqpd4AyhXK/S0VXOgEr9DAINH2boZFAsnTufm7RAfpanll381rTI
gW63/DZ7jg0PzhE0fVxqCxFZIWO/c72KajYGpsanb71WdHJTS+zjeAuPb5FqT/WI
d+BCXv/nuz8fgdNYFnml1Tw4P1NXpBzAiHp8woOtDbYxQKOdFcADfbMVnOoQMcwJ
asRK61K0jfy44+FCr/z495MtYQ7izZO3twNEn0hDWVZH00fRpqnY+zUeAVHJ/vxG
bs7IC9EY8EPCzre8fcmeLjCAtTwYzmTzXN8DWSZUhAMKK9f39qBIWk+cw+ok8SsM
r0ANt9Yq9ORqRtD2sXFaBUVcZ7hcMcvyz46r1C5euaBLLXpwfRI=
=ifXE
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
