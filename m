From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 04/14] clk: tegra: Rename Tegra124 EMC clock source
 file
Date: Tue, 14 Apr 2020 19:14:29 +0200
Message-ID: <20200414171429.GC15932@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-5-thierry.reding@gmail.com>
 <a7209708-6e67-5885-5935-2db3d92174e8@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a7209708-6e67-5885-5935-2db3d92174e8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 07:48:12PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This code is only used on Tegra124, so rename it accordingly to make it
> > more consistent with other file names.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/clk/tegra/Makefile                          | 2 +-
> >  drivers/clk/tegra/{clk-emc.c =3D> clk-tegra124-emc.c} | 0
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  rename drivers/clk/tegra/{clk-emc.c =3D> clk-tegra124-emc.c} (100%)
> >=20
> > diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> > index 1f7c30f87ece..dec508ef2ada 100644
> > --- a/drivers/clk/tegra/Makefile
> > +++ b/drivers/clk/tegra/Makefile
> > @@ -14,7 +14,6 @@ obj-y					+=3D clk-tegra-audio.o
> >  obj-y					+=3D clk-tegra-periph.o
> >  obj-y					+=3D clk-tegra-fixed.o
> >  obj-y					+=3D clk-tegra-super-gen4.o
> > -obj-$(CONFIG_TEGRA_CLK_EMC)		+=3D clk-emc.o
> >  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         +=3D clk-tegra20.o
> >  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+=3D clk-tegra20-emc.o
> >  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         +=3D clk-tegra30.o
> > @@ -22,6 +21,7 @@ obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+=3D clk-tegra20-emc=
=2Eo
> >  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+=3D clk-tegra114.o
> >  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+=3D clk-tegra124.o
> >  obj-$(CONFIG_TEGRA_CLK_DFLL)		+=3D clk-tegra124-dfll-fcpu.o
> > +obj-$(CONFIG_TEGRA_CLK_EMC)		+=3D clk-tegra124-emc.o
>=20
> What about to rename CONFIG_TEGRA_CLK_EMC to CONFIG_TEGRA124_CLK_EMC as
> well?

Yeah, I could do that.

> Also.. maybe the CONFIG_TEGRA_CLK_EMC isn't really needed at all and the
> TEGRA124_EMC of memory/tegra could be re-used here?

Sounds like that should work... let me see what I can do.

Thierry

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V73QACgkQ3SOs138+
s6GEsg/+IZcdQCLTqDBB8dWq8+IHcYR4MKibWV3/XPcYJ29XjUgSohR1ne4jlJrB
7WeB32SUULUOpmRtHw45hF5htbJYHa2Mxwpqv6NGAyXf+A2Xxls2mKzfqNcujijj
J9ewU0PuBJfvWLjSKGYQtYmIyj73M68NUCJVUaDZ3hbv5INljFNyUN2wuwMzo1L1
jFOfe+O2YBBr157WZlMZLqIDInAEvZUSVYF80KtOdJUw8jU1uh2zP8ufgD6S6ZGt
TuMdHIUyEy9qwFldgwEy2nXBIAIiHWtDDHUDatdn/A8PWw+Auqd0v2XKktucqv4S
+Lq3BG3jCNk54vOWiBjJIDTxF/CrAP03myqF19tNO3OfRLffTjLah1qp//sj//lU
hbq/XEslGhwOzCUvKXawY8RO8yuSGgKDuwV6aSEDNW6Oo0sbCHrMcLFWu2dNR3Gk
KdwiyZFeo0xLH8/P+pIJ+V7xpMnRJpKhYlRrnHl94qt6Gum2LSlQXVATklZHcBoE
1eV5NBovcpH9Eq4FJWFlkkT2VWcLrWam0UF1LG6gBHllWJBXhBvX95k2Yfb3gF4m
Zh2V92hkPa0ZzU3pdNEu8Qlcbm78yAMYHSrN+oNnV7bbbnePkYEiJCauKt+uihB8
UhUFxei8DW+O9tT1MI0QFaPln6dXzUdhr102o4CevKkD9kDft4U=
=ednv
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
