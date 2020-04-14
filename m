From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 07/14] clk: tegra: Implement Tegra210 EMC clock
Date: Tue, 14 Apr 2020 16:36:58 +0200
Message-ID: <20200414143658.GH3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
 <0e040cf9-56cf-dd44-3523-ff4c82fb1f2c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LiQwW4YX+w4axhAx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0e040cf9-56cf-dd44-3523-ff4c82fb1f2c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LiQwW4YX+w4axhAx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 11:49:18PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +int tegra210_clk_emc_attach(struct clk *clk,
> > +			    struct tegra210_clk_emc_provider *provider)
> > +{
> > +	struct clk_hw *hw =3D __clk_get_hw(clk);
> > +	struct tegra210_clk_emc *emc =3D to_tegra210_clk_emc(hw);
> > +	struct device *dev =3D provider->dev;
> > +	unsigned int i;
> > +	int err;
> > +
> > +	if (!try_module_get(provider->owner))
> > +		return -ENODEV;
>=20
> Is the EMC driver module bumping its own refcount by itself?

Hm... this doesn't really look useful in retrospect. Yes, the EMC is
effectively grabbing a reference to itself.

> In the other patch I already suggested that the EMC module should be
> disallowed to be unloaded once it has been loaded, seems you're already
> doing it. Correct?

Interestingly, it all seems to work fine if I unload the module at
runtime, not sure why I'm not prevented from unloading the module.

Thierry

--LiQwW4YX+w4axhAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6VyooACgkQ3SOs138+
s6F8fRAAltMFYycla8aI7eycjfxbMe6paTuQsQQyz+jPcJ+aDCABF8qrJ/fRjvBA
AmzsAdBfdqmyB/Rc3h/y6yVkwn1HxakFOpPl18se88ca4dHLmjkzbFEq0Cf1zAjX
EHzbheMPL4wN5EXukjpRedTg0u4TxaxpFq5YxtXqsy1JJvHrWeDszygAJTrhQi96
ly9ouXCvOtJvYnAM+6Cbu8T13m5MYYPmFTEeyx7v9ca5Lb/eYFzpDFjjY2cpfI+a
1T+Z/bT/c2ELi2n26IuPggymoXoMjDKJZVB7P8HMPAERzU7904qEhG3xIPQl/Gds
lJkKAinQBWzmSUe158uzOhzWrWA+rLgB77kBU01NRt8IhaF3sLjPO+08lAfR9+8J
ccFcoT8GDLE/PMipQMMWwm/kzwuTF+qTAFZDVxJgTiVyu4H7whWiCiHCEMx5KKI/
gpP9ps9jIjhWXlMgC4pnmdB8XFUzlyjYXnRhy/wYso3OZwDGqpc75TKC1sI3MUfC
pS3OaFbyw73VaVgR+EZnTcyW/skXB1dOpOw/ur2npBx2Yh5gycNpxL3JrfSWXyDj
V5J/how06Ci2WbIVB0wjJB7/qAafLD7OVViRC54JH48yUmtRwlF1ZF6D5dgMRU60
ffrfvRHDBhncixdMOW6dsbo+1tFjHbZA2wmCS1Ock8kqjFvYXiM=
=UIdh
-----END PGP SIGNATURE-----

--LiQwW4YX+w4axhAx--
