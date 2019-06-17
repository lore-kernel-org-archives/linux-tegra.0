From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 07/10] memory: tegra: Introduce Tegra30 EMC driver
Date: Mon, 17 Jun 2019 11:50:48 +0200
Message-ID: <20190617095048.GD508@ulmo>
References: <20190616233551.6838-1-digetx@gmail.com>
 <20190616233551.6838-8-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190616233551.6838-8-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 02:35:48AM +0300, Dmitry Osipenko wrote:
> Introduce driver for the External Memory Controller (EMC) found on Tegra30
> chips, it controls the external DRAM on the board. The purpose of this
> driver is to program memory timing for external memory on the EMC clock
> rate change.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |   10 +
>  drivers/memory/tegra/Makefile      |    1 +
>  drivers/memory/tegra/mc.c          |    9 +-
>  drivers/memory/tegra/mc.h          |   30 +-
>  drivers/memory/tegra/tegra30-emc.c | 1197 ++++++++++++++++++++++++++++
>  drivers/memory/tegra/tegra30.c     |   44 +
>  include/soc/tegra/mc.h             |    2 +-
>  7 files changed, 1278 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/memory/tegra/tegra30-emc.c
>=20
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index 4680124ddcab..fbfbaada61a2 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -17,6 +17,16 @@ config TEGRA20_EMC
>  	  This driver is required to change memory timings / clock rate for
>  	  external memory.
> =20
> +config TEGRA30_EMC
> +	bool "NVIDIA Tegra30 External Memory Controller driver"
> +	default y
> +	depends on TEGRA_MC && ARCH_TEGRA_3x_SOC
> +	help
> +	  This driver is for the External Memory Controller (EMC) found on
> +	  Tegra30 chips. The EMC controls the external DRAM on the board.
> +	  This driver is required to change memory timings / clock rate for
> +	  external memory.
> +
>  config TEGRA124_EMC
>  	bool "NVIDIA Tegra124 External Memory Controller driver"
>  	default y
> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> index 3971a6b7c487..3d23c4261104 100644
> --- a/drivers/memory/tegra/Makefile
> +++ b/drivers/memory/tegra/Makefile
> @@ -11,5 +11,6 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210.o
>  obj-$(CONFIG_TEGRA_MC) +=3D tegra-mc.o
> =20
>  obj-$(CONFIG_TEGRA20_EMC)  +=3D tegra20-emc.o
> +obj-$(CONFIG_TEGRA30_EMC)  +=3D tegra30-emc.o
>  obj-$(CONFIG_TEGRA124_EMC) +=3D tegra124-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186.o
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index 163b6c69e651..eaebe371625c 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -51,9 +51,6 @@
>  #define MC_EMEM_ADR_CFG 0x54
>  #define MC_EMEM_ADR_CFG_EMEM_NUMDEV BIT(0)
> =20
> -#define MC_TIMING_CONTROL		0xfc
> -#define MC_TIMING_UPDATE		BIT(0)
> -
>  static const struct of_device_id tegra_mc_of_match[] =3D {
>  #ifdef CONFIG_ARCH_TEGRA_2x_SOC
>  	{ .compatible =3D "nvidia,tegra20-mc-gart", .data =3D &tegra20_mc_soc },
> @@ -310,7 +307,7 @@ static int tegra_mc_setup_latency_allowance(struct te=
gra_mc *mc)
>  	return 0;
>  }
> =20
> -void tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned lon=
g rate)
> +int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long=
 rate)
>  {
>  	unsigned int i;
>  	struct tegra_mc_timing *timing =3D NULL;
> @@ -325,11 +322,13 @@ void tegra_mc_write_emem_configuration(struct tegra=
_mc *mc, unsigned long rate)
>  	if (!timing) {
>  		dev_err(mc->dev, "no memory timing registered for rate %lu\n",
>  			rate);
> -		return;
> +		return -EINVAL;
>  	}
> =20
>  	for (i =3D 0; i < mc->soc->num_emem_regs; ++i)
>  		mc_writel(mc, timing->emem_data[i], mc->soc->emem_regs[i]);
> +
> +	return 0;
>  }
> =20
>  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc)
> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
> index 392993955c93..0720a1d2023e 100644
> --- a/drivers/memory/tegra/mc.h
> +++ b/drivers/memory/tegra/mc.h
> @@ -9,20 +9,32 @@
>  #ifndef MEMORY_TEGRA_MC_H
>  #define MEMORY_TEGRA_MC_H
> =20
> +#include <linux/bits.h>
>  #include <linux/io.h>
>  #include <linux/types.h>
> =20
>  #include <soc/tegra/mc.h>
> =20
> -#define MC_INT_DECERR_MTS (1 << 16)
> -#define MC_INT_SECERR_SEC (1 << 13)
> -#define MC_INT_DECERR_VPR (1 << 12)
> -#define MC_INT_INVALID_APB_ASID_UPDATE (1 << 11)
> -#define MC_INT_INVALID_SMMU_PAGE (1 << 10)
> -#define MC_INT_ARBITRATION_EMEM (1 << 9)
> -#define MC_INT_SECURITY_VIOLATION (1 << 8)
> -#define MC_INT_INVALID_GART_PAGE (1 << 7)
> -#define MC_INT_DECERR_EMEM (1 << 6)
> +#define MC_INT_DECERR_MTS				BIT(16)
> +#define MC_INT_SECERR_SEC				BIT(13)
> +#define MC_INT_DECERR_VPR				BIT(12)
> +#define MC_INT_INVALID_APB_ASID_UPDATE			BIT(11)
> +#define MC_INT_INVALID_SMMU_PAGE			BIT(10)
> +#define MC_INT_ARBITRATION_EMEM				BIT(9)
> +#define MC_INT_SECURITY_VIOLATION			BIT(8)
> +#define MC_INT_INVALID_GART_PAGE			BIT(7)
> +#define MC_INT_DECERR_EMEM				BIT(6)

This /could/ be a separate patch, with it being unrelated to the EMC
support, but probably not worth it.

> +#define MC_EMEM_ARB_OUTSTANDING_REQ			0x94
> +#define MC_EMEM_ARB_OUTSTANDING_REQ_MAX_MASK		0x1ff
> +#define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
> +#define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
> +
> +#define MC_EMEM_ARB_OVERRIDE				0xe8
> +#define MC_EMEM_ARB_OVERRIDE_EACK_MASK			0x3
> +
> +#define MC_TIMING_CONTROL				0xfc
> +#define MC_TIMING_UPDATE				BIT(0)
> =20
>  static inline u32 mc_readl(struct tegra_mc *mc, unsigned long offset)
>  {
> diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/te=
gra30-emc.c
> new file mode 100644
> index 000000000000..4700f7c8022e
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra30-emc.c
> @@ -0,0 +1,1197 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Tegra30 External Memory Controller driver
> + *
> + * Author: Dmitry Osipenko <digetx@gmail.com>
> + */

Copyright?

Otherwise looks good to me.

Thierry

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HYngACgkQ3SOs138+
s6E/YBAAqW9N+1Tl7SnZT90QbnHy6rYsOgODQy0qxFFK8p3U6WwYTo/A3xoFNnjZ
1WdvNsQ8UiMjQPFZWLDBtULgjpjHveoerArT4ux6AKOd2UDMC9OPxWVNs8p5nJmQ
HcJXbnBp9+8jiWU2bIMka6XMpbOB0NdND5Scj3AbhMg+NJYtPzp8wQ37QCLiVGBP
MtLRUVipdVDH5x/O3ZvfBayWlT8nn7cX9G2X6oTIzQiXNsWPfxk3L7bwz+JXm9cQ
4GNK/uWpDX5n2tPq7+lGi+YxPCsn9HSRpVETTV9u23arRaWEekpb/WMnpPP5CCTe
BYiZFDTcWv7Acn2PAuG2HAnLYe1oelR7KEx/EYkUG8JIuu8oV6f4oYd3W6fWBqz+
fiRnK7uTH33EkIl4SOhYuG5riD38UMJFCC3pG+jcgl/4MbNjQAxiRI6mKokaHZxE
b67gXzhb+0gk4eQbGCxWVVK2pRYLDxKkANiYwfD5KNNbt2A4U2eCuQbN003OyMbA
cJHfAZEwRLT2aRXKEg7NkrxRUdD5Pz46TUIanv50BS2sjr4BscZZPGh64VDAC7KA
P6f4tAzQIJnm9uDbpXuJnftxEdUI+NKvN59YgAYooJSplyBUnxGcl8kCZmWFn+q+
w2G9BgEIH8bj/+byO1oYBFrXac5qvigybNxBZ0GWuKFGQ79lxRk=
=P89T
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--
