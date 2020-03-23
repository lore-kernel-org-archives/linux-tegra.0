From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
Date: Mon, 23 Mar 2020 12:06:12 +0100
Message-ID: <20200323110612.GE3883508@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
 <3b583202-50d0-145c-d60f-91bd646008ad@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3b583202-50d0-145c-d60f-91bd646008ad-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:29:42PM +0300, Dmitry Osipenko wrote:
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
> > +EXPORT_SYMBOL_GPL(tegra210_clk_emc_attach);
> > +
> > +void tegra210_clk_emc_detach(struct clk *clk)
> > +{
> > +	struct tegra210_clk_emc *emc =3D to_tegra210_clk_emc(__clk_get_hw(clk=
));
> > +
> > +	emc->provider =3D NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(tegra210_clk_emc_detach);...
> > +config TEGRA210_EMC
> > +	bool "NVIDIA Tegra210 External Memory Controller driver"
>=20
>=20
> I'd remove all the exports for now, given that the driver is built-in.

I was able to make the driver work as a loadable module, so I've kept
the exports where needed and made TEGRA210_EMC tristate.

Thierry

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54mCQACgkQ3SOs138+
s6Fghw/9HFmA8d3ekqw+fFlSbracVyC8Jbzm7ovz/EMMhgzkKApEKD2G2L7GNFdZ
XQiWXYuI4SANsOCnbgunpoZqi5M/zh35NvbBqQoT6pJlS1WxabPWekofZGxX9WkJ
/oA5oD1gQhR3CpM+6QfgUH76surZ8LIgqlWDurqblrUeEWUftJuKa4xuhIj+7vwy
B4cZYF04OqrUl5dJXKiX9qUAb2T0i6GZb9UbWIdPtzFGpxN7WfBBjuta/nbKJCqi
Y4CkNqMDW3wqvj5zZrZN0/J+5SHQ2eJ26irWAn5Xrrd0N3xyIUy7/SetQ3hFsfAb
Gxd9WyQA8OWDdlhdkoEHoMLXX7xBmKG7PA2LakCQxguSw2+meQUfgM7JJqS1sMLY
xhqKLxu8GnMoTdwlh0LhoUAYgwYxfKrd+x+3h8qeGZAHju8nC+BrB5Pg/8gO4e3S
e64USYE4iF8tLbAhD3WYLO7xFLEHWdI+bW8lqvuTWXqXqkXA1bRFrCBidwODDkb1
rj8UuNJzhOzgB7A8us/of+PlabsIsJm4Pr7zqoBUm7LEv9x9BcDCcRRf7jl+4yE5
6lq+SF+f18powYYqdHkaIQCK3ldSfUYJp+iql2mmJSreDcVl10P8m3AW/HO5mRoH
do2qAyLmNX/4iNdEq5BnMtwMvgMqcfs6nWBayGmkpyjZhL+99YI=
=5knT
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
