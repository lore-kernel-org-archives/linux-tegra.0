From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: tegra: Add auxiliary data for nvhost
Date: Sat, 24 Nov 2012 00:45:27 +0100
Message-ID: <20121123234527.GE21555@avionic-0098.adnet.avionic-design.de>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
 <1353577684-7896-3-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353577684-7896-3-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 11:48:00AM +0200, Terje Bergstrom wrote:
> Add SoC specific auxiliary data to host1x and gr2d. nvhost uses
> this data.
>=20
> Change-Id: Idb04b262c8b6432e56cffb6c7ed64cf7ef4545b3
> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-dt-tegra20.c    |   38 +++++++++++++++++++++++=
+++++-
>  arch/arm/mach-tegra/board-dt-tegra30.c    |   38 +++++++++++++++++++++++=
+++++-
>  arch/arm/mach-tegra/tegra20_clocks_data.c |    8 +++---
>  arch/arm/mach-tegra/tegra30_clocks_data.c |    2 ++
>  4 files changed, 80 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra=
/board-dt-tegra20.c
> index 1d30eac..c695392 100644
> --- a/arch/arm/mach-tegra/board-dt-tegra20.c
> +++ b/arch/arm/mach-tegra/board-dt-tegra20.c
> @@ -33,6 +33,7 @@
>  #include <linux/i2c.h>
>  #include <linux/i2c-tegra.h>
>  #include <linux/usb/tegra_usb_phy.h>
> +#include <linux/nvhost.h>
> =20
>  #include <asm/hardware/gic.h>
>  #include <asm/mach-types.h>
> @@ -45,6 +46,38 @@
>  #include "common.h"
>  #include "iomap.h"
> =20
> +static const char *host1x_syncpt_names[32] =3D {
> +	[0] =3D "gfx_host",
> +	[NVSYNCPT_2D_0] =3D "2d_0",
> +	[NVSYNCPT_2D_1] =3D "2d_1",
> +	[NVSYNCPT_VBLANK0] =3D "vblank0",
> +	[NVSYNCPT_VBLANK1] =3D "vblank1",
> +};

I think I remember a discussion about this back when we designed the DT
bindings. The result I seem to remember was that since syncpoints can be
arbitrarily assigned they wouldn't have to be statically allocated at
compile time.

Instead we could just have them allocated when a host1x client registers
with host1x. Or have each client request its required syncpoints
explicitly. The latter would make it trivial to associate a label with
it.

> +
> +static struct host1x_device_info host1x_info =3D {
> +	.nb_channels	=3D 8,
> +	.nb_pts		=3D 32,
> +	.nb_mlocks	=3D 16,
> +	.nb_bases	=3D 8,
> +	.syncpt_names	=3D host1x_syncpt_names,
> +	.client_managed	=3D NVSYNCPTS_CLIENT_MANAGED,
> +};
> +
> +static struct nvhost_device_data tegra_host1x_info =3D {
> +	.clocks =3D { {"host1x", UINT_MAX} },
> +	NVHOST_MODULE_NO_POWERGATE_IDS,
> +	.private_data =3D &host1x_info,
> +};
> +
> +static struct nvhost_device_data tegra_gr2d_info =3D {
> +	.index		=3D 2,
> +	.syncpts	=3D BIT(NVSYNCPT_2D_0) | BIT(NVSYNCPT_2D_1),
> +	.clocks		=3D { {"gr2d", UINT_MAX, true}, {"epp", UINT_MAX, true} },
> +	NVHOST_MODULE_NO_POWERGATE_IDS,
> +	.clockgate_delay =3D 0,
> +	.serialize	=3D true,
> +};

Again, this doesn't seem like it should be statically configured in the
board data.

The same comments apply to the Tegra30 hunk that I've left out.

> diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-te=
gra/tegra20_clocks_data.c
> index 7f049ac..3314e50 100644
> --- a/arch/arm/mach-tegra/tegra20_clocks_data.c
> +++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
> @@ -1041,10 +1041,10 @@ static struct clk_duplicate tegra_clk_duplicates[=
] =3D {
>  	CLK_DUPLICATE("usbd",	"utmip-pad",	NULL),
>  	CLK_DUPLICATE("usbd",	"tegra-ehci.0",	NULL),
>  	CLK_DUPLICATE("usbd",	"tegra-otg",	NULL),
> -	CLK_DUPLICATE("2d",	"tegra_grhost",	"gr2d"),
> -	CLK_DUPLICATE("3d",	"tegra_grhost",	"gr3d"),
> -	CLK_DUPLICATE("epp",	"tegra_grhost",	"epp"),
> -	CLK_DUPLICATE("mpe",	"tegra_grhost",	"mpe"),
> +	CLK_DUPLICATE("2d",	NULL,		"gr2d"),
> +	CLK_DUPLICATE("3d",	NULL,		"gr3d"),
> +	CLK_DUPLICATE("epp",	NULL,		"epp"),
> +	CLK_DUPLICATE("mpe",	NULL,		"mpe"),

Are these actually required here?

>  	CLK_DUPLICATE("cop",	"tegra-avp",	"cop"),
>  	CLK_DUPLICATE("vde",	"tegra-aes",	"vde"),
>  	CLK_DUPLICATE("cclk",	NULL,		"cpu"),
> diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-te=
gra/tegra30_clocks_data.c
> index 6942c7a..f30bd54 100644
> --- a/arch/arm/mach-tegra/tegra30_clocks_data.c
> +++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
> @@ -1338,6 +1338,8 @@ struct clk_duplicate tegra_clk_duplicates[] =3D {
>  	CLK_DUPLICATE("pll_p", "tegradc.0", "parent"),
>  	CLK_DUPLICATE("pll_p", "tegradc.1", "parent"),
>  	CLK_DUPLICATE("pll_d2_out0", "hdmi", "parent"),
> +	CLK_DUPLICATE("2d", NULL, "gr2d"),
> +	CLK_DUPLICATE("epp", NULL, "epp"),

Same here.

Thierry

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQsAqXAAoJEN0jrNd/PrOhl2wP/3/jHghYRii2U+Y2vxTS95jX
K6LdI1GrW7d4cgjKrCYHyKT5blOEsXMJzuWyokw1QUMfbCQ9WWFTi3AknNnlC92T
NfJGaTTXJrZ9wx0nXbq6ippoKxnDSpsAKy485ndw3ps+b9A8joxFRAySeJHbhKl6
blse4Bx4t+AgUoFtcSX3UjYW3irEh6c0DgmExXDSrzgMZA2kxyelSLHvAPUiKK8B
yty94mDqsHgcInH9FNUcvxgnO4HA4peZrk3pX6JAumP3zG4UE2kUpRI8qgQf1SEY
hkNnyg3malTLqsK+1iPpWJj8dKuKYzmIvkFU7q/lYSDs9F4QAb/92ULHDgLBj17Y
J7n6QToZJOWtbuHXRZisMLHiuBv6DYL8WJvvzMQDhXO0E/Wb47gG2YQ+GUsGKKKq
Vh54kcpHl5qH1ClpvWhOF2Ncxyc4Z1h5mutGPc9/4dK3T8H+Lw3Zz4oGpQ8onAHT
XXGcSwR5wynpfLjU9Qe29EOaelhUOyvs6XlgbGiqTDpa3loGoQ3/xKaQn/rVMung
x6El2D8ssI6xbxB46E0XN+bU8uu5rLztaHD+LWeraUWrhnvduvFj8MKzZmtNPDM2
a8K4HkAOhoiCuEE3OaxaiSKSk08+QNeLEaNHFfv6DYzRoJz+e9obzTPUFX5a2T74
Vzya6mby1g5//V/dOsWc
=HWPk
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
