From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
Date: Mon, 23 Mar 2020 12:02:21 +0100
Message-ID: <20200323110221.GC3883508@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
 <7a4e0ab4-e17e-9e6a-2d30-d9a321be1dc8@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7a4e0ab4-e17e-9e6a-2d30-d9a321be1dc8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 08:03:05PM +0300, Dmitry Osipenko wrote:
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
> > +#ifdef CONFIG_PM_SLEEP
> > +static int tegra210_emc_suspend(struct device *dev)
>=20
> The __maybe_unused attribute will be a bit cleaner than the #ifdef.

Done.

Thierry

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54lz0ACgkQ3SOs138+
s6Gd3BAAuTyoEJ+JL1G9GWcOanhXD05YmbFew23yyyioslf+tvjbE65mIZ0quv65
wLcxow76yP90BL1pX3dIbBHxs+rfq9SGdDC6L8cwT/Vh01xMti0YmWOFmmYZV/fm
4l6OWJlwULsyaQh5q7blUqI5zX+OQ5cNPVNeO5HPpFrjhSrP7d0IbHYqcAcUo0b7
942u/zU1r/yySYXvzOs7nZZ5+gQ6m/vTzbodk/XDZbSWWKZ4PGmrw2FlfFzmWELX
7BoYGo8Y5fCynE7wqqFyPGOGlfr5ADydD5EhKr8ryBphTWNXHm8hL1I37o7RQ5w6
ycwZX8lIkJMeC0x3HINZSkstv2VrPdKTH9h01K9tI/zwjBrzO5dXrfjjo1oszRg3
caxfEzDNjUcO7qlZAJmLdspGU9iprnmXBg7TQQJ4p+tmfDkJjnHoh1+G8VmvXCIZ
pnwS+pU80DSdcHwGFPWMs6vXpqaw92QOmNt/btkWLe06y00S/oTYLuLZ+kqPnX54
JAppAovMhDk1U2PzesmMjzTdzLP8aneT+ScdfWPz+YjaMgoTGPY3+IYzVEaojL2K
WYVSjyfyx5cCjHIeWKI91Mg/N3y096aOo0kRiEgHgpIwccaGezkRH1cu8eWtMPY+
eTuE86Lh7LotXklg6Re46VNih9Q3SZDaVejoC1U9fdOjEpNqabQ=
=Gt4N
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
