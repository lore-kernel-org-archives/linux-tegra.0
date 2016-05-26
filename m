From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Thu, 26 May 2016 13:25:46 +0100
Message-ID: <5746EB4A.4010205@nvidia.com>
References: <1463585396-19562-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463585396-19562-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turguette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 18/05/16 16:29, Rhyland Klein wrote:
> From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> Move the UTMIPLL initialization code form clk-tegra<chip>.c files int=
o
> clk-pll.c. UTMIPLL was being configured and set in HW control right
> after registration. However, when the clock init_table is processed a=
nd
> child clks of PLLU are enabled, it will call in and enable PLLU as
> well, and initiate SW enabling sequence even though PLLU is already i=
n
> HW control. This leads to getting UTMIPLL stuck with a SEQ_BUSY statu=
s.
>=20
> Doing the initialization once during pllu_enable means we configure i=
t
> properly into HW control.
>=20
> A side effect of the commonization/localization of the UTMIPLL init
> code, is that it corrects some errors that were present for earlier
> generations. For instance, in clk-tegra124.c, it used to have:
>=20
> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)
>=20
> when the correct shift to use is present in the new version:
>=20
> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
>=20
> which matches the Tegra124 TRM register definition.
>=20
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> [rklein: Merged in some later fixes for potential deadlocks]
>=20
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v4:
>  - Re-added examples in patch description
>=20
> v3:
>  - Flushed out description to describe this patch.
>=20
>  drivers/clk/tegra/clk-pll.c      | 484 +++++++++++++++++++++++++++++=
++++++++++
>  drivers/clk/tegra/clk-tegra114.c | 155 +------------
>  drivers/clk/tegra/clk-tegra124.c | 156 +------------
>  drivers/clk/tegra/clk-tegra210.c | 182 +--------------
>  drivers/clk/tegra/clk-tegra30.c  | 113 +--------
>  drivers/clk/tegra/clk.h          |  17 ++
>  6 files changed, 510 insertions(+), 597 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.=
c
> index 4e194ecc8d5e..580cae8aee6d 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c

=2E..

> +static int clk_pllu_enable(struct clk_hw *hw)
> +{
> +	struct tegra_clk_pll *pll =3D to_clk_pll(hw);
> +	struct clk_hw *pll_ref =3D clk_hw_get_parent(hw);
> +	struct clk_hw *osc =3D clk_hw_get_parent(pll_ref);
> +	unsigned long flags, input_rate;
> +	unsigned int i;
> +	int ret =3D 0;
> +	u32 val;
> +
> +	if (!osc) {
> +		pr_err("%s: failed to get OSC clock\n", __func__);
> +		return -EINVAL;
> +	}
> +	input_rate =3D clk_hw_get_rate(osc);
> +
> +	if (pll->lock)
> +		spin_lock_irqsave(pll->lock, flags);
> +
> +	_clk_pll_enable(hw);
> +	ret =3D clk_pll_wait_for_lock(pll);
> +	if (ret < 0)
> +		goto out;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(utmi_parameters); i++) {
> +		if (input_rate =3D=3D utmi_parameters[i].osc_frequency)
> +			break;
> +	}
> +
> +	if (i =3D=3D ARRAY_SIZE(utmi_parameters)) {
> +		pr_err("%s: Unexpected input rate %lu\n", __func__, input_rate);
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	val =3D pll_readl_base(pll);
> +	val &=3D ~PLLU_BASE_OVERRIDE;
> +	pll_writel_base(val, pll);
> +
> +	val =3D readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
> +	/* Program UTMIP PLL stable and active counts */
> +	val &=3D ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
> +	val |=3D UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_coun=
t);
> +	val &=3D ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
> +	val |=3D UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(
> +			utmi_parameters[i].active_delay_count);
> +	/* Remove power downs from UTMIP PLL control bits */
> +	val &=3D ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
> +	val &=3D ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
> +	val &=3D ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN;
> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG2);
> +
> +	val =3D readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
> +	/* Program UTMIP PLL delay and oscillator frequency counts */
> +	val &=3D ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
> +	val |=3D UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(
> +		utmi_parameters[i].enable_delay_count);
> +	val &=3D ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
> +	val |=3D UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(
> +		utmi_parameters[i].xtal_freq_count);
> +	/* Remove power downs from UTMIP PLL control bits */
> +	val &=3D ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
> +	val &=3D ~UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN;
> +	val &=3D ~UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN;
> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
> +
> +out:
> +	if (pll->lock)
> +		spin_unlock_irqrestore(pll->lock, flags);
> +
> +	return ret;
> +}

After applying this I get the following warning ...

In file included from include/linux/mmzone.h:7:0,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:14,
                 from drivers/clk/tegra/clk-pll.c:17:
drivers/clk/tegra/clk-pll.c: In function =91clk_pllu_enable=92:
include/linux/spinlock.h:246:30: warning: =91flags=92 may be used
uninitialized in this function [-Wmaybe-uninitialized]
   _raw_spin_unlock_irqrestore(lock, flags); \
                              ^
drivers/clk/tegra/clk-pll.c:1065:16: note: =91flags=92 was declared her=
e
  unsigned long flags, input_rate;
                ^
In file included from include/linux/mmzone.h:7:0,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:14,
                 from drivers/clk/tegra/clk-pll.c:17:
drivers/clk/tegra/clk-pll.c: In function =91clk_pllu_tegra210_enable=92=
:
include/linux/spinlock.h:246:30: warning: =91flags=92 may be used
uninitialized in this function [-Wmaybe-uninitialized]
   _raw_spin_unlock_irqrestore(lock, flags); \
                              ^
drivers/clk/tegra/clk-pll.c:2511:16: note: =91flags=92 was declared her=
e
  unsigned long flags, input_rate;
                ^
In file included from include/linux/mmzone.h:7:0,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:14,
                 from drivers/clk/tegra/clk-pll.c:17:
drivers/clk/tegra/clk-pll.c: In function =91clk_pllu_tegra114_enable=92=
:
include/linux/spinlock.h:246:30: warning: =91flags=92 may be used
uninitialized in this function [-Wmaybe-uninitialized]
   _raw_spin_unlock_irqrestore(lock, flags); \
                              ^
drivers/clk/tegra/clk-pll.c:1677:16: note: =91flags=92 was declared her=
e
  unsigned long flags, input_rate;

Cheers
Jon

--=20
nvpublic
