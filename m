From: =?iso-8859-1?Q?Lu=EDs?= Henriques <luis.henriques@canonical.com>
Subject: Re: [PATCH] ARM: tegra: only run PL310 init on systems with one
Date: Thu, 27 Feb 2014 12:55:26 +0000
Message-ID: <20140227125526.GB3607@hercules>
References: <1393437746-11287-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393437746-11287-1-git-send-email-swarren@wwwdotorg.org>
Sender: stable-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 26, 2014 at 11:02:26AM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> (This is commit 8859685785bfafadf9bc922dd3a2278e59886947 upstream)
>=20
> Fix tegra_init_cache() to check whether the system has a PL310 cache
> before touching the PL310 registers. This prevents access to non-exis=
tent
> registers on Tegra114 and later.
>=20
> (When applying this to 3.10, there will be a trivial conflict, just d=
ue to
> context differences, at the added include of (linux/of.h>)
>=20
> (I applied and tested this backport on each of v3.10.*, v3.11.*, v3.1=
2.*)

Thanks a lot for backporting and testing this patch.  I will queue it f=
or
the 3.11 kernel.

Cheers,
--
Lu=EDs

> Cc: <stable@vger.kernel.org> # v3.10..v3.12 inclusive
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  arch/arm/mach-tegra/common.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/commo=
n.c
> index 94a119a35af8..3c405f43ca39 100644
> --- a/arch/arm/mach-tegra/common.c
> +++ b/arch/arm/mach-tegra/common.c
> @@ -22,6 +22,7 @@
>  #include <linux/io.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/of.h>
>  #include <linux/reboot.h>
>  #include <linux/irqchip.h>
>  #include <linux/clk-provider.h>
> @@ -82,10 +83,20 @@ void tegra_assert_system_reset(enum reboot_mode m=
ode, const char *cmd)
>  static void __init tegra_init_cache(void)
>  {
>  #ifdef CONFIG_CACHE_L2X0
> +	static const struct of_device_id pl310_ids[] __initconst =3D {
> +		{ .compatible =3D "arm,pl310-cache",  },
> +		{}
> +	};
> +
> +	struct device_node *np;
>  	int ret;
>  	void __iomem *p =3D IO_ADDRESS(TEGRA_ARM_PERIF_BASE) + 0x3000;
>  	u32 aux_ctrl, cache_type;
> =20
> +	np =3D of_find_matching_node(NULL, pl310_ids);
> +	if (!np)
> +		return;
> +
>  	cache_type =3D readl(p + L2X0_CACHE_TYPE);
>  	aux_ctrl =3D (cache_type & 0x700) << (17-8);
>  	aux_ctrl |=3D 0x7C400001;
> --=20
> 1.8.1.5
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe stable" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
