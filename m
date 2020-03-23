From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
Date: Mon, 23 Mar 2020 12:00:23 +0100
Message-ID: <20200323110023.GB3883508@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
 <a5c9e3d6-2b65-ec93-d8f1-7c7680092e53@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a5c9e3d6-2b65-ec93-d8f1-7c7680092e53-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 08:44:38PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The EMC clock needs to carefully coordinate with the EMC controller
> > programming to make sure external memory can be properly clocked. Do so
> > by hooking up the EMC clock with an EMC provider that will specify which
> > rates are supported by the EMC and provide a callback to use for setting
> > the clock rate at the EMC.
> >=20
> > Based on work by Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> >=20
> > Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v5:
> > - major rework and cleanup
>=20
> ...
> > +static u8 tegra210_clk_emc_get_parent(struct clk_hw *hw)
> > +{
> > +	struct tegra210_clk_emc *emc =3D to_tegra210_clk_emc(hw);
> > +	u32 value;
> > +	u8 src;
> > +
> > +	value =3D readl_relaxed(emc->regs + CLK_SOURCE_EMC);
> > +	src =3D (value >> CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT) &
> > +			CLK_SOURCE_EMC_2X_CLK_SRC_MASK;
>=20
> What about to use a generic FIELD_GET/PREP()?

Done.

> > +static int tegra210_clk_emc_set_rate(struct clk_hw *hw, unsigned long =
rate,
> > +				     unsigned long parent_rate)
> > +{
> > +	struct tegra210_clk_emc *emc =3D to_tegra210_clk_emc(hw);
> > +	struct tegra210_clk_emc_provider *provider =3D emc->provider;
> > +	struct tegra210_clk_emc_config *config;
> > +	struct device *dev =3D provider->dev;
> > +	struct clk_hw *old, *new, *parent;
> > +	u8 old_idx, new_idx, index;
> > +	struct clk *clk;
> > +	unsigned int i;
> > +	int err;
> > +
> > +	if (!provider || !provider->configs || provider->num_configs =3D=3D 0)
> > +		return -EINVAL;
>=20
> Why all these checks are needed? I don't think it ever could fail,
> couldn't it?

This could fail if no EMC provider is attached, which happens, for
example, when the EMC driver is not loaded.

>=20
> > +static int emc_table_lookup(struct tegra_emc *emc, unsigned long rate)
> > +{
> > +	int i;
>=20
> unsigned int
>=20
> Same for all other occurrences in the code.

This was fixed automatically after I fixed the rebase issues.

Thierry

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54lsQACgkQ3SOs138+
s6EeQQ/9G63M1xZHwIQsmIIdgaOw5YN+TMj2fb5Fy/mSYOOmDYJyyyRe3dx4GvEn
9HJ1jk7vLe54qYlncIy/Iq30OOZ9GfDKOQsebE/hc4j6EEa4h2VO8kRwUVWjTAer
+DykULLJpXnDOki2OeMkPx5ZRQe21SQ4NNDNcnyI1e3yHv9dNsa6lkjp1+rYshAi
SghXsdNd3yrgWYuAInyKifrPBt3VS8oeezB36G2sRRkgoWlxrYrk11R1rHmvi8vR
r5OzzniI25NLqkDpaEOQCsjYxeyqT7tr/9W6R1lmpxhcNtKT3puIA4/jYosGIRm2
9i7olnK19urr93jkXS+ljzj8jA6zWNMNGkORPHL/H7HT3wFxS42jEt0dyOUiat/E
oGN188QLQqi8grfb1qp+yeN6Gzrz9CkXNKJkC9Id3cqV1S2mqGtr9t5iDzNxYCR3
N9OtxnOK238OIEzFyeApm099w7D6ly1/yeDAUps278bbeul9sID8CCH0XGmavk5g
9ALun6d42DG1iagOafD3Reyqstw/vOItJg689zPC5aSC9MVXuTEs/Trqh2Rlgrg4
xOJe+9epTCemM8e8hAlXkA1I/t8vpV8RuDwj8KJ6QpdBaCRjxy9fYzpmDwpwvrnL
81TWT8PZbKw4IqXO/b9Yc/sjtiL4K5nPAVQVQx0d+NnjFRrLADk=
=j0rX
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
