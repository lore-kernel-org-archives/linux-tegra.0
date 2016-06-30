From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Thu, 30 Jun 2016 17:43:02 +0200
Message-ID: <20160630154302.GB4279@ulmo.ba.sec>
References: <1464280891-23036-1-git-send-email-rklein@nvidia.com>
 <5763FFF5.5000303@nvidia.com>
 <20160617152336.GA27475@ulmo.ba.sec>
 <943f14f1-1c7c-055d-8dc6-f30f1196430f@nvidia.com>
 <20160630153704.GA4279@ulmo.ba.sec>
 <fdd38adb-1a17-51fd-db62-be91102fdbd3@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fdd38adb-1a17-51fd-db62-be91102fdbd3-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2016 at 11:40:19AM -0400, Rhyland Klein wrote:
> On 6/30/2016 11:37 AM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Thu, Jun 30, 2016 at 11:32:14AM -0400, Rhyland Klein wrote:
> >> On 6/17/2016 11:23 AM, Thierry Reding wrote:
> >>>> Old Signed by an unknown key
> >>>
> >>> On Fri, Jun 17, 2016 at 02:49:41PM +0100, Jon Hunter wrote:
> >>>> Hi Thierry,
> >>>>
> >>>> On 26/05/16 17:41, Rhyland Klein wrote:
> >>>>> From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>>>>
> >>>>> Move the UTMIPLL initialization code form clk-tegra<chip>.c files i=
nto
> >>>>> clk-pll.c. UTMIPLL was being configured and set in HW control right
> >>>>> after registration. However, when the clock init_table is processed=
 and
> >>>>> child clks of PLLU are enabled, it will call in and enable PLLU as
> >>>>> well, and initiate SW enabling sequence even though PLLU is already=
 in
> >>>>> HW control. This leads to getting UTMIPLL stuck with a SEQ_BUSY sta=
tus.
> >>>>>
> >>>>> Doing the initialization once during pllu_enable means we configure=
 it
> >>>>> properly into HW control.
> >>>>>
> >>>>> A side effect of the commonization/localization of the UTMIPLL init
> >>>>> code, is that it corrects some errors that were present for earlier
> >>>>> generations. For instance, in clk-tegra124.c, it used to have:
> >>>>>
> >>>>> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)
> >>>>>
> >>>>> when the correct shift to use is present in the new version:
> >>>>>
> >>>>> define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
> >>>>>
> >>>>> which matches the Tegra124 TRM register definition.
> >>>>>
> >>>>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>>>>
> >>>>> [rklein: Merged in some later fixes for potential deadlocks]
> >>>>>
> >>>>> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>> ---
> >>>>> v5:
> >>>>>  - Initialized flags to 0 to avoid harmless spinlock warnings
> >>>>>
> >>>>> v4:
> >>>>>  - Re-added examples in patch description
> >>>>>
> >>>>> v3:
> >>>>>  - Flushed out description to describe this patch.
> >>>>>
> >>>>>  drivers/clk/tegra/clk-pll.c      | 484 +++++++++++++++++++++++++++=
++++++++++++
> >>>>>  drivers/clk/tegra/clk-tegra114.c | 155 +------------
> >>>>>  drivers/clk/tegra/clk-tegra124.c | 156 +------------
> >>>>>  drivers/clk/tegra/clk-tegra210.c | 182 +--------------
> >>>>>  drivers/clk/tegra/clk-tegra30.c  | 113 +--------
> >>>>>  drivers/clk/tegra/clk.h          |  17 ++
> >>>>>  6 files changed, 510 insertions(+), 597 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pl=
l.c
> >>>>> index 4e194ecc8d5e..31e20110fae4 100644
> >>>>> --- a/drivers/clk/tegra/clk-pll.c
> >>>>> +++ b/drivers/clk/tegra/clk-pll.c
> >>>>
> >>>> ...
> >>>>
> >>>>> +static int clk_pllu_tegra210_enable(struct clk_hw *hw)
> >>>>> +{
> >>>>> +	struct tegra_clk_pll *pll =3D to_clk_pll(hw);
> >>>>> +	struct clk_hw *pll_ref =3D clk_hw_get_parent(hw);
> >>>>> +	struct clk_hw *osc =3D clk_hw_get_parent(pll_ref);
> >>>>> +	unsigned long flags =3D 0, input_rate;
> >>>>> +	unsigned int i;
> >>>>> +	int ret =3D 0;
> >>>>> +	u32 val;
> >>>>> +
> >>>>> +	if (!osc) {
> >>>>> +		pr_err("%s: failed to get OSC clock\n", __func__);
> >>>>> +		return -EINVAL;
> >>>>> +	}
> >>>>> +	input_rate =3D clk_hw_get_rate(osc);
> >>>>> +
> >>>>> +	if (pll->lock)
> >>>>> +		spin_lock_irqsave(pll->lock, flags);
> >>>>> +
> >>>>> +	_clk_pll_enable(hw);
> >>>>> +	ret =3D clk_pll_wait_for_lock(pll);
> >>>>> +	if (ret < 0)
> >>>>> +		goto out;
> >>>>> +
> >>>>> +	for (i =3D 0; i < ARRAY_SIZE(utmi_parameters); i++) {
> >>>>> +		if (input_rate =3D=3D utmi_parameters[i].osc_frequency)
> >>>>> +			break;
> >>>>> +	}
> >>>>> +
> >>>>> +	if (i =3D=3D ARRAY_SIZE(utmi_parameters)) {
> >>>>> +		pr_err("%s: Unexpected input rate %lu\n", __func__, input_rate);
> >>>>> +		ret =3D -EINVAL;
> >>>>> +		goto out;
> >>>>> +	}
> >>>>> +
> >>>>> +	val =3D pll_readl_base(pll);
> >>>>> +	val &=3D ~PLLU_BASE_OVERRIDE;
> >>>>> +	pll_writel_base(val, pll);
> >>>>> +
> >>>>> +	/* Put PLLU under HW control */
> >>>>> +	val =3D readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
> >>>>> +	val |=3D PLLU_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE |
> >>>>> +	       PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT |
> >>>>> +	       PLLU_HW_PWRDN_CFG0_USE_LOCKDET;
> >>>>> +	val &=3D ~(PLLU_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL |
> >>>>> +		  PLLU_HW_PWRDN_CFG0_CLK_SWITCH_SWCTL);
> >>>>> +	writel_relaxed(val, pll->clk_base + PLLU_HW_PWRDN_CFG0);
> >>>>> +
> >>>>> +	val =3D readl_relaxed(pll->clk_base + XUSB_PLL_CFG0);
> >>>>> +	val &=3D ~XUSB_PLL_CFG0_PLLU_LOCK_DLY;
> >>>>> +	writel_relaxed(val, pll->clk_base + XUSB_PLL_CFG0);
> >>>>> +	udelay(1);
> >>>>> +
> >>>>> +	val =3D readl_relaxed(pll->clk_base + PLLU_HW_PWRDN_CFG0);
> >>>>> +	val |=3D PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
> >>>>> +	writel_relaxed(val, pll->clk_base + PLLU_HW_PWRDN_CFG0);
> >>>>> +	udelay(1);
> >>>>> +
> >>>>> +	/* Disable PLLU clock branch to UTMIPLL since it uses OSC */
> >>>>> +	val =3D pll_readl_base(pll);
> >>>>> +	val &=3D ~PLLU_BASE_CLKENABLE_USB;
> >>>>> +	pll_writel_base(val, pll);
> >>>>> +
> >>>>> +	val =3D readl_relaxed(pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
> >>>>> +	if (val & UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE) {
> >>>>> +		pr_debug("UTMIPLL already enabled\n");
> >>>>> +		goto out;
> >>>>> +	}
> >>>>> +	val &=3D ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
> >>>>> +	writel_relaxed(val, pll->clk_base + UTMIPLL_HW_PWRDN_CFG0);
> >>>>> +
> >>>>> +	/* Program UTMIP PLL stable and active counts */
> >>>>> +	val =3D readl_relaxed(pll->clk_base + UTMIP_PLL_CFG2);
> >>>>> +	val &=3D ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
> >>>>> +	val |=3D UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_co=
unt);
> >>>>> +	val &=3D ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
> >>>>> +	val |=3D UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(
> >>>>> +			utmi_parameters[i].active_delay_count);
> >>>>> +	val |=3D UTMIP_PLL_CFG2_PHY_XTAL_CLOCKEN;
> >>>>> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG2);
> >>>>> +
> >>>>> +	/* Program UTMIP PLL delay and oscillator frequency counts */
> >>>>> +	val =3D readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
> >>>>> +	val &=3D ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
> >>>>> +	val |=3D UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(
> >>>>> +		utmi_parameters[i].enable_delay_count);
> >>>>> +	val &=3D ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
> >>>>> +	val |=3D UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(
> >>>>> +		utmi_parameters[i].xtal_freq_count);
> >>>>> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
> >>>>> +
> >>>>> +	/* Remove power downs from UTMIP PLL control bits */
> >>>>> +	val =3D readl_relaxed(pll->clk_base + UTMIP_PLL_CFG1);
> >>>>> +	val &=3D ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
> >>>>> +	val |=3D UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
> >>>>> +	writel_relaxed(val, pll->clk_base + UTMIP_PLL_CFG1);
> >>>>> +	udelay(100);
> >>>>
> >>>> In next-20160617 I see that this udelay is now a usleep_range(100, 2=
00)
> >>>> and this is causing the following splat when the clock is enabled. I
> >>>> don't think that we can use usleep here ...
> >>>
> >>> Okay, I'll back out the patch. I'd really prefer to avoid busy-looping
> >>> for 100 microseconds here, so can we please find another way to do th=
is?
> >>>
> >>
> >> It looks like we should be able to use a short udelay of 1-2us. I
> >> believe the original code had udelay(1) and I know Jon and I tested
> >> udelay(2) and it was ok.
> >=20
> > What original code? The downstream driver? If so I'd be leaning towards
> > simply adopting that. Everything else in this functions seems to want to
> > wait for 1 us, seems natural for this to do as well.
>=20
> Sorry I wasn't clear. The code in the clk-tegraXX specific drivers was
> using udelay(1) as you pointed out, thats what I meant.

On further looking at the downstream code, the write before the udelay()
above should probably also use the non-relaxed version because the code
in our downstream kernel uses a dsb() after the write (which makes it
equivalent to a plain writel()).

Thierry

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdT4GAAoJEN0jrNd/PrOhJgQQAJjj+JDYs0wPWh7m8V5LjHgj
Esf35ZALOAq6pmnsxoNLwGuoSgvByjC3tSvP72maixky/FH17xxmstEA0DfHAZCL
oNQgm5ATWfaYuvsoDgWxJQiD71DUyiJc+f6PvE+ARO5/1Oo2yL0B8OXvi3TBAuiA
6vhdyJWzwvPzphO6CMaTnimYey/vcr99HkQax7WxJJ/MzYXkJ8kvQNDfopQwlTIL
LSZO5SFhWLUGq4NBqkQIk2XyCbk9dbx5n4Nv91STAgxdwTodS7vTo7FGqx62jEnH
KPUKJ+trhL2ZbhCJQHZdzd9XxUg+ACPf32HoLk9PK1484aYf/XXXGQb2oe1IljVN
/EJ+kXfBTf3BHNCiQIgWzFW+Ywg+tuuEdEf4bazMJVN3fuPPuKCcXhZ8wGsHHSIU
hjsWfZgilU7G/8QsLXiXpCefhtNLoUNA84rqP0sV3RCDOrLS7toTZd49Qf/bMaTV
9s/CFDrxgHhKXGXHaU1IVxBd8G7Gt2RlBuv7KKOlXPfTYFckmLtbOizLKSbeEKQq
rEff40U1ArEOVPZkLwLvCrLCKbmozYUJS61py4XkqD/8gW7zmjFc1YVixlEPpxus
Z8dPfTHmXV1eJUvilvrRQj0mWH3/xOSEad2TMKS/DHWiEWQxmJTTGDwDqLJC4/LF
N7LdaLEOA9wknZswAfrx
=nK9v
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
