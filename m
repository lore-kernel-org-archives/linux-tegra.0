From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/8] arm/tegra: prepare early init for multiple
 tegra variants
Date: Mon, 7 Nov 2011 14:36:30 +0200
Message-ID: <20111107123630.GO29978@tbergstrom-lnx.Nvidia.com>
References: <1320242948-21061-1-git-send-email-pdeschrijver@nvidia.com>
 <1320242948-21061-3-git-send-email-pdeschrijver@nvidia.com>
 <CAMbhsRSTcR8qgYESmM6OxkXeVeg6vS49woCe_OX6CY4pAj2g_A@mail.gmail.com>
 <20111103092116.GO13358@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111103092116.GO13358-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 03, 2011 at 10:21:16AM +0100, Peter De Schrijver wrote:
> On Wed, Nov 02, 2011 at 07:30:43PM +0100, Colin Cross wrote:
> > On Wed, Nov 2, 2011 at 7:09 AM, Peter De Schrijver
> > <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > > This patch splits the early init code in a common and a tegra20 s=
pecific part.
> > > L2 cache initialization is generalized and discovers the cache as=
sociativity
> > > at runtime.
> > >
> > > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > <snip>
> >=20
> > > -static __initdata struct tegra_clk_init_table common_clk_init_ta=
ble[] =3D {
> > > +void (*arch_reset)(char mode, const char *cmd) =3D tegra_assert_=
system_reset;
> > > +
> > This is unrelated to the patch description?
> >=20
>=20
> This is a left over from the past. Will be removed from the next vers=
ion.
>=20
> > > +static __initdata struct tegra_clk_init_table tegra20_clk_init_t=
able[] =3D {
> > > =A0 =A0 =A0 =A0/* name =A0 =A0 =A0 =A0 parent =A0 =A0 =A0 =A0 =A0=
rate =A0 =A0 =A0 =A0 =A0 =A0enabled */
> > > =A0 =A0 =A0 =A0{ "clk_m", =A0 =A0 =A0NULL, =A0 =A0 =A0 =A0 =A0 0,=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0true },
> > > =A0 =A0 =A0 =A0{ "pll_p", =A0 =A0 =A0"clk_m", =A0 =A0 =A0 =A02160=
00000, =A0 =A0 =A0true },
> > > @@ -59,25 +61,34 @@ static __initdata struct tegra_clk_init_table=
 common_clk_init_table[] =3D {
> > > =A0 =A0 =A0 =A0{ NULL, =A0 =A0 =A0 =A0 NULL, =A0 =A0 =A0 =A0 =A0 =
0, =A0 =A0 =A0 =A0 =A0 =A0 =A00},
> > > =A0};
> > >
> > > -static void __init tegra_init_cache(void)
> > > +static void __init tegra_init_cache(u32 tag_latency, u32 data_la=
tency)
> > > =A0{
> > > =A0#ifdef CONFIG_CACHE_L2X0
> > > =A0 =A0 =A0 =A0void __iomem *p =3D IO_ADDRESS(TEGRA_ARM_PERIF_BAS=
E) + 0x3000;
> > > + =A0 =A0 =A0 u32 aux_ctrl;
> > > +
> > > + =A0 =A0 =A0 writel_relaxed(tag_latency, p + L2X0_TAG_LATENCY_CT=
RL);
> > > + =A0 =A0 =A0 writel_relaxed(data_latency, p + L2X0_DATA_LATENCY_=
CTRL);
> > >
> > > - =A0 =A0 =A0 writel_relaxed(0x331, p + L2X0_TAG_LATENCY_CTRL);
> > > - =A0 =A0 =A0 writel_relaxed(0x441, p + L2X0_DATA_LATENCY_CTRL);
> > > + =A0 =A0 =A0 aux_ctrl =3D readl(p + L2X0_CACHE_TYPE);
> > > + =A0 =A0 =A0 aux_ctrl =3D (aux_ctrl & 0x700) << (17-8);
> >=20
> > If I'm interpreting the PL310 TRM correctly, the cache associativit=
y
> > value in the L2X0_CACHE_TYPE register is read from the aux control
> > register, so this is just leaving the existing value in place.  If =
the
> > value is not being modified, just take it out of the aux_ctrl mask
> > passed to l2x0_init.
> >=20
>=20
> This seems to work fine on our android kernels though. Need to dig de=
eper
> what's going on here.

Doesn't seem to be that simple on tegra. The L2X0_CACHE_TYPE can indica=
te a
different waysize depending on fuses.

Cheers,

Peter.
