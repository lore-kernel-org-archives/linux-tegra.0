From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 07/17] clk: tegra: save and restore CPU and System
 clocks context
Date: Tue, 18 Jun 2019 13:48:15 +0200
Message-ID: <20190618114815.GJ28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-8-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KZLWU/9q3evlN4nQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560843991-24123-8-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--KZLWU/9q3evlN4nQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:21AM -0700, Sowjanya Komatineni wrote:
> During system suspend state, core power goes off and looses all the
> CAR controller register settings.
>=20
> This patch creates APIs for saving and restoring the context of Tegra
> CPUG, CPULP and SCLK.
>=20
> CPU and System clock context includes
> - CPUG, CPULP, and SCLK burst policy settings for clock sourcea of all
>   their normal states.
> - SCLK divisor and System clock rate for restoring SCLK, AHB and APB
>   rates on resume.
> - OSC_DIV settings which are used as reference clock input to some PLLs.
> - SPARE_REG and CLK_MASK settings.
>=20
> These APIs are used in Tegra210 clock driver during suspend and resume
> operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-super-gen4.c |  4 --
>  drivers/clk/tegra/clk.c                  | 80 ++++++++++++++++++++++++++=
++++++
>  drivers/clk/tegra/clk.h                  | 14 ++++++
>  3 files changed, 94 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra=
/clk-tegra-super-gen4.c
> index cdfe7c9697e1..ed69ec4d883e 100644
> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
> @@ -19,10 +19,6 @@
>  #define PLLX_MISC2 0x514
>  #define PLLX_MISC3 0x518
> =20
> -#define CCLKG_BURST_POLICY 0x368
> -#define CCLKLP_BURST_POLICY 0x370
> -#define SCLK_BURST_POLICY 0x028
> -#define SYSTEM_CLK_RATE 0x030
>  #define SCLK_DIVIDER 0x2c
> =20
>  static DEFINE_SPINLOCK(sysrate_lock);
> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 573e3c967ae1..26690663157a 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -70,6 +70,12 @@ static struct clk **clks;
>  static int clk_num;
>  static struct clk_onecell_data clk_data;
> =20
> +static u32 cclkg_burst_policy_ctx[2];
> +static u32 cclklp_burst_policy_ctx[2];
> +static u32 sclk_burst_policy_ctx[2];
> +static u32 sys_clk_divisor_ctx, system_rate_ctx;
> +static u32 spare_ctx, misc_clk_enb_ctx, clk_arm_ctx;
> +
>  /* Handlers for SoC-specific reset lines */
>  static int (*special_reset_assert)(unsigned long);
>  static int (*special_reset_deassert)(unsigned long);
> @@ -199,6 +205,80 @@ const struct tegra_clk_periph_regs *get_reg_bank(int=
 clkid)
>  	}
>  }
> =20
> +void tegra_cclkg_burst_policy_save_context(void)
> +{
> +	int i;

This here (and the same goes for the other functions below) can be
unsigned int.

Otherwise:

Acked-by: Thierry Reding <treding@nvidia.com>

--KZLWU/9q3evlN4nQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Iz38ACgkQ3SOs138+
s6HK1Q/7BzzelnHJLENRo5Vc9/8+nrFkSHtCYoUJ58KOVa06A5Czu3EdVKmfleMu
UgogQBYvIctxLTS1GMVWJ8W88p7SdUJYyA0yDNXGIom6guLt6EmhUl6us0HN+K3K
XCw7t9qrk8/3cHrY7Gk8IjWYMsxLKeS0MndZNcyBS0qeFpk0NcHPVkbYuPso67vP
FzKGwqZ4r98oPiP1uF0FteU1xrZ/s8fvOfWniCcHczda7CSEdPc8ZHV20Yc/inya
V4OPm5NLevM+QNUb1iiGfjyOS97eGAF9wUZyDZwdMn1D7pj47CWX2jqNTKcBiDue
OwMBXLR7LpvGhaXXJeKCKmSi8jWEDMaIaWH7EME89bHwa/uXIzz+zlbuGYxxJOkm
IHDjpXMwL3DPKUBiae72er8rue35cZIDTVQFdM8kQi576gtNWTkfiaHBa5xnxnw7
MdVW2xJkaWFxoDrV6Y+Y3v/opMGslB1Q/sdKQpg1PYidRkWYvgOeUnFabNvTOScb
iaGJX6gOgVjPBpfRJ4yQ79g4HwrzEgZfMkwwFX1olP+XOsQ10Grz7zMWPUiOaGer
b24d6OuJADUF0RjOjXL42bQKc1cuk9z0oR5y+hj4LMgixfNt9GbRqmkRHRcQCAdh
C1fm5rTIlLpl3ccOD5Ini98PPlDwQDQ7NCUjGEZvrLdqZJOUZP4=
=vaKL
-----END PGP SIGNATURE-----

--KZLWU/9q3evlN4nQ--
