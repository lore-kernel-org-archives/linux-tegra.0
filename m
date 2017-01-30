From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] I2c: busses - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 12:24:57 +0100
Message-ID: <20170130112457.GA7075@ulmo.ba.sec>
References: <CGME20170130050324epcas3p28c9adcffd7bc40e1733cdeef1e5240d5@epcas3p2.samsung.com>
 <1485752587-30107-1-git-send-email-shailendra.v@samsung.com>
 <20170130071217.GG3585@ulmo.ba.sec>
 <20170130080715.wuvx7ro3kuneolnu@pengutronix.de>
 <20170130085455.GP3585@ulmo.ba.sec>
 <20170130111553.cbwxu23lzd46qtt7@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170130111553.cbwxu23lzd46qtt7-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.shailesh-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ashish.kalra-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Shailendra Verma <shailendra.capricorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 12:15:53PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Jan 30, 2017 at 09:54:55AM +0100, Thierry Reding wrote:
> > On Mon, Jan 30, 2017 at 09:07:15AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > Hello,
> > >=20
> > > On Mon, Jan 30, 2017 at 08:12:17AM +0100, Thierry Reding wrote:
> > > > On Mon, Jan 30, 2017 at 10:33:07AM +0530, Shailendra Verma wrote:
> > > > > of_device_get_match_data could return NULL, and so can cause
> > > > > a NULL pointer dereference later.
> > > > >=20
> > > > > Signed-off-by: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > > > ---
> > > > >  drivers/i2c/busses/i2c-tegra.c |    4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > >=20
> > > > This will never happen. Any match in the OF table that would cause =
the
> > > > ->probe() to occur has a valid .data pointer associated with it.
> > >=20
> > > Theoretically you could (I think) bind that driver to a node with
> > >=20
> > > 	compatible =3D "tegra-i2c";
> >=20
> > That's not a valid compatible string and I don't think this could end up
> > anywhere that would make the driver bind. Even if it did I think it'd be
>=20
> Look at platform_match() in drivers/base/platform.c. If
> of_driver_match_device fails it might still match based on
> strcmp(pdev->name, drv->name).

pdev->name is never influenced by the compatible string. The only way
you could create a device that would match this driver is if you were to
manually create it using of_platform_device_create() or similar,
something which we can easily prevent (or revert should anyone ever get
such code into the kernel again).

Thierry

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliPIocACgkQ3SOs138+
s6HeqQ/9FlD7LhMVDyLE9pnRJ58er+Hszn63IewUNDRUAl3qKYwiGWqjExzC/19i
AipGwma9GBpEUi8mP8c+5se3XcxuM/kv8hWNzJh4bV6mXaGIqtxjLWwi6vB/+FIq
8ic3Axaj+tGq3oWXk2DlBR9DZiVf6fYqta1uMHW1tmZdIGovhStfn0wRB4/GyT51
YaGrH8Oj+qJZ1aNJNP2b9LJfvmT4e179B2chSSxBXbyx36uRkE0f6jIg/4gvpRqz
o9/iMduNmnVBJXzG752dLivWBb55G1LfnJGvDbJS7rQ1vSYvnbY6U9eNiG1k2yK7
8m4OikiPe8MkNsgRmyA8cOncaj0ruaANIVwDqvb8W1RAfw5swFI8RDc+7DHWn+UX
OWPa1B9Iv2ygI6opGLPG2r7Qf8sLxzIH4prghHzoTfacPyoRBM392l05W6sE1UsE
NZVNjOtLQ2MKdFzJjXmBSdsZXqECYVwTeDYFzVEwhTgtM500w9OhaxEL72FVrn+v
a6hm8ktxrwKUhUo8QvhPAnZQo/PFpPZl0T2x5gDtCbRJV3hGxS2J9xpDEfvGY2UD
tyco31JLfJn/ZFy8JcAjFpBXsaSitMyCQJ+2hiNThsFRKSPOEiSCPk8sqlOJY9UH
PI96V7DqT+7c+XXjBdaxUORgCA62+QDt+Cs8Z++or+rS8Q49OKQ=
=O2ts
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
