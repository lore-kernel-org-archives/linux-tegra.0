From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 3/4] gpio: tegra: Get rid of all file scoped global
 variables
Date: Mon, 25 Apr 2016 12:11:01 +0200
Message-ID: <20160425101101.GC20630@ulmo.ba.sec>
References: <1461319754-12040-1-git-send-email-ldewangan@nvidia.com>
 <1461319754-12040-3-git-send-email-ldewangan@nvidia.com>
 <20160425100055.GA20630@ulmo.ba.sec>
 <571DE912.3060602@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <571DE912.3060602-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2016 at 03:23:22PM +0530, Laxman Dewangan wrote:
>=20
> On Monday 25 April 2016 03:30 PM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Fri, Apr 22, 2016 at 03:39:13PM +0530, Laxman Dewangan wrote:
> > [...]
> > > diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> > [...]
> > >   static struct gpio_chip tegra_gpio_chip =3D {
> > This variable is still file-scoped. Why not get rid of it at the same
> > time? It's rather pointless to remove all file-scoped variables except a
> > single one, because now the driver still isn't properly equipped to deal
> > with multiple instances (however theoretical that may be).
> >=20
>=20
> Yaah, Alex also pointed that to have the instance of gpio_chip in
> tegra_gpio_info and then do as
> tgi->gc =3D tegra_gpio_chip.
>=20
>=20
> same for irq_chip also.
>=20
>=20
> I hope this will resolve the concern.

An alternative would be to do away with tegra_gpio_chip altogether and
instead assign the fields directly within ->probe(). Both patterns seem
to be used in drivers/gpio, with the latter one being slightly more
common.

Thierry

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXHe01AAoJEN0jrNd/PrOhioEP/3LTh0F2NLzw2NU/Cdfrm+jJ
cDkjW4jGN985fzqaKsoJded3PUmAu2jL3VJMGaDhF7xU7wz9lw0qSY4MbwFPohaz
uQDPh7lE5D3J9eL4UIIhWJyD8N/bNjMP6pOowQif/LP+PesnZ7HWW8Rj8BuaGBV9
7h9vYaOp0vWtuy0LDLYFL8iFPZJ1bv/Jxa0i9YcUnONVEhE0ngtp2T+SepCbvtNg
W1JwUp+Mh2raw4mwTUQcfNxqMN2m2vG5QFlInh9U3rObzjaPbj+GXBHt937klXUY
ivYWyPWqPo8RkAvo6fQVg4BiiO9z2nj4sgSkGHtzVCCGiqR3tPUFxSfTgsf7WAiH
C1cP9L6pS2P9jOMMq6O9dRC4+TYrf0Kzn1j2LD4d2D3a2O6h4gx4ex0us5K0fufm
P88b7a0KeMZurUIj34bq5Tz3GFN9vmPj/PkPrLpDpF/HsTRIfEMcYtcneP9mRRXV
hkuzJPuoAf9+Q86MSzifZx4/6aLbveeKN08QoidbLnbiA1lf/Gg/bgNt4e3HC/4D
esboKriPKpgoLxjFu962TY654SFGwywfMUbgVt1Q5G9tnp15maqTwdX2op6hObNw
HNYy61VFn0uidQBTe5GJWpC6U+LLPSYeiyVRa5EvsRLzARI1hso7sf59YSa6iFL9
ICL70Ly/i1tmej6YO3qw
=KjYp
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
