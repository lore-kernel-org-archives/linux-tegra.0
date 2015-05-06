From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 19/20] clk: tegra210: add support for Tegra210 clocks
Date: Wed, 6 May 2015 16:51:15 +0200
Message-ID: <20150506145113.GH22098@ulmo.nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
 <1430757460-9478-20-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VbfcI4OLZ4XW0yH2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430757460-9478-20-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--VbfcI4OLZ4XW0yH2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2015 at 12:37:39PM -0400, Rhyland Klein wrote:
[...]
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
[...]
> +static struct div_nmp plld_nmp = {
> +	.divm_shift = 0,
> +	.divm_width = 8,
> +	.divn_shift = 11,
> +	.divn_width = 8,
> +	.divp_shift = 20,
> +	.divp_width = 3,
> +};

I think we need to add the SDM shift and width fields here:

	.sdm_shift = 0,
	.sdm_width = 16,

Otherwise pll_d can't take advantage of the fractional divider.

[...]
> +static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
[...]
> +	[tegra_clk_clk72Mhz] = { .dt_id = TEGRA210_CLK_CLK72MHZ, .present = true },

I think you want to use the _8 variant here that you specifically
introduced for Tegra210 in an earlier patch.

> +static __init void tegra210_periph_clk_init(void __iomem *clk_base,
> +					    void __iomem *pmc_base)
> +{
> +	struct clk *clk;
> +
> +	/* xusb_ss_div2 */
> +	clk = clk_register_fixed_factor(NULL, "xusb_ss_div2", "xusb_ss_src", 0,
> +					1, 2);
> +	clks[TEGRA210_CLK_XUSB_SS_DIV2] = clk;
> +
> +	/* plld_dsi */
> +	clk = clk_register_gate(NULL, "pll_d_dsi", "pll_d_out0", 0,
> +				clk_base + PLLD_MISC0, 21, 0, &pll_d_lock);
> +	clks[TEGRA210_CLK_PLLD_DSI] = clk;
> +
> +	/* dsia */
> +	clk = tegra_clk_register_periph_gate("dsia", "pll_d_dsi", 0, clk_base,
> +					     0, 48, periph_clk_enb_refcnt);
> +	clks[TEGRA210_CLK_DSIA] = clk;
> +
> +	/* dsib */
> +	clk = tegra_clk_register_periph_gate("dsib", "pll_d_dsi", 0, clk_base,
> +					     0, 82, periph_clk_enb_refcnt);
> +	clks[TEGRA210_CLK_DSIB] = clk;

Can we rename pll_d_dsi to pll_d_dsi_out for consistency with earlier
SoC generations, please? Also, don't forget the /* plld_dsi */ comment.

In retrospect I'm not sure we've got this clock right. The (public)
documentation is a little sparse, but I think this bit actually enables
the fast and slow clocks to the MIPI pad macros. If you look at the
register documentation for Tegra30 and Tegra114 they use a similarly
named register with a more verbose description. I've also seen a couple
of clock diagrams that indicate where these actually are.

Now what I wonder is if it makes any sense to represent this as a parent
clock for DSI, because it really isn't. But if it isn't then we need to
find another way of enabling this. Presumably turning this off saves
power if pll_d is used for non-DSI/CSI purposes, so we'd want to disable
it when we can. We could export this as a separate clock and add it to
the DSI driver.

Rhyland, can you file an internal bug to track this, so that we get the
documentation updated. Peter, can you help find out what the real story
is with this clock?

> diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
[...]
> +#define TEGRA210_CLK_PLLD_DSI 307

This would be TEGRA210_CLK_PLL_D_DSI_OUT after the rename suggested
above.

I have a couple of other clocks that need to be added, but I think we
can do that in separate patches, especially since some require changes
to the drivers for previous SoCs.

Thierry

--VbfcI4OLZ4XW0yH2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSipfAAoJEN0jrNd/PrOhQzwP/08DuZebm3A7GUtiH9rT8g+d
SW6Ey0hHECRp+67Ss03lcg6ivKXvoikoDsiqWcelo+JhTJ8EmCyk+sJETZqtgLdU
xRI4+ZLw643UkAuCgEu9l7w0Ec2CBCwt9NvH2BHOsSHPusOulBNuhVgO3tid3wwt
1eJjr/4lYpZccY4fPWk4WilZnK2DpjaMx53pBA49wDJgJJW7RguCZG6AkhYAfzDU
5IiPojzPmjJ4cPKt/q7dsoGwylWXc+gY1DszUZMg0huVwM+CKvtISpyz8Ob6nfXt
zBDAaIsu4kEAeDo6ZEGR2x4PcOZRB6O4SsM7QDPaqfS3G5nHyDZeyUaTI2LN7I/M
NVrgH/DDnbLx/VBFDwZylK8me0OiR0TAVdSniGeWhSPhiXcf2LT40JXDcXskD4HF
5P8Hpv9QfhGarMRefgwmNkyUimqHfE8X+b5wOO4MD6C4lS9XZgMIcoARhDWJj7F1
FyHsFP92vyNQqfAEdtw6pPUPpsQC9cRzeaOrGhLJNKmGVXeF8/EFmF6+kU4cp7wg
O1/K9Wskng0GsJT1csv1K8AXM+TCXYkTCOjHCZXEp/0c6CShh1giwvVJpxkDd0DI
g+33PNN9iz+pZYxWTgLGv0qwg2sigeUzk5QUF1MoErfaY2QAOgUyZ/Z4/V7fz5Vd
GBYdWGigfIrp7uOjz3j4
=qlVk
-----END PGP SIGNATURE-----

--VbfcI4OLZ4XW0yH2--
