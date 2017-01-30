From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] I2c: busses - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 09:54:55 +0100
Message-ID: <20170130085455.GP3585@ulmo.ba.sec>
References: <CGME20170130050324epcas3p28c9adcffd7bc40e1733cdeef1e5240d5@epcas3p2.samsung.com>
 <1485752587-30107-1-git-send-email-shailendra.v@samsung.com>
 <20170130071217.GG3585@ulmo.ba.sec>
 <20170130080715.wuvx7ro3kuneolnu@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dJyWBSYfjLochwFK"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170130080715.wuvx7ro3kuneolnu@pengutronix.de>
Sender: linux-i2c-owner@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Shailendra Verma <shailendra.v@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, p.shailesh@samsung.com, ashish.kalra@samsung.com, Shailendra Verma <shailendra.capricorn@gmail.com>
List-Id: linux-tegra@vger.kernel.org


--dJyWBSYfjLochwFK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 09:07:15AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Mon, Jan 30, 2017 at 08:12:17AM +0100, Thierry Reding wrote:
> > On Mon, Jan 30, 2017 at 10:33:07AM +0530, Shailendra Verma wrote:
> > > of_device_get_match_data could return NULL, and so can cause
> > > a NULL pointer dereference later.
> > >=20
> > > Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
> > > ---
> > >  drivers/i2c/busses/i2c-tegra.c |    4 ++++
> > >  1 file changed, 4 insertions(+)
> >=20
> > This will never happen. Any match in the OF table that would cause the
> > ->probe() to occur has a valid .data pointer associated with it.
>=20
> Theoretically you could (I think) bind that driver to a node with
>=20
> 	compatible =3D "tegra-i2c";

That's not a valid compatible string and I don't think this could end up
anywhere that would make the driver bind. Even if it did I think it'd be
good to crash rather than error out to make it very obvious that you've
made a mistake that needs to be immediately fixed.

If you error out it's much more likely that people won't notice.

> Anyhow, even if today there was no possibility this could happen, that's
> something that might easily be changed by a future change. So I doubt
> "this will never happen" stays true for sure and being defensive is a
> good idea.

Let's revisit this again *if* this ever becomes a real issue. There's no
use in adding dead code to the kernel to handle hypothetical use-cases.

> And even a BUG would be better than a silent NULL pointer dereference.

I've never encountered a NULL pointer dereference that was silent. =3D)

Thierry

--dJyWBSYfjLochwFK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliO/18ACgkQ3SOs138+
s6HXMxAAqz7MJd4AIxJ/nI1TX3VVwbO/I0lG1pOmGPfQG2/zmHu56XPAtuMUP6Y+
Tq3x6Zikc57SwBSntPQIa8oS/cO4yOrvFxs5e5mQjo/0cRmv6REAXbThlauvGMHK
f+KwfwuvFVn9Bs7VgKeq85Stdzr3ip5S+IXpaugMgfkanRrUF92wiWFnFtKQhT+u
6m6PzVSgIi4xkBn9P0/RFrtRuNRpO34kRT4so+ViDHX/ioPCF40OOngRZszb6QPF
X41FGTlS6zmgc0iuxG5rLMtbk7Uc8enGhPgh8EaHoi5p/yLXPQGHAdDn2kv2YknP
RNVIFC2kcZmUe7yG44GyKczNjU4RVZYJvKqCuFkIV9Yyowr334b4iJUQ/w3piVNG
WRuvcELxHGKBvZi0LjcYrYB35HWAQYi6dm3DTVp1FLwuvkcX8LmEkZM5ZMTNQuNF
4r9WJjxGvKe/ABkVGpDQJHRleMZ0ZsmUPcj4Lwp6inIIfV0PKVI3U3eMU7IZbZMz
Yw5QLf5bjZ+RroPQ7iATtG0795NDqU8oTSnN1orAtTZoD3EFgha+n0Ql553LzotG
5gkIHOn7Sspl1AVkhtHu+d2nz5/JDOyraAw8q0vB3yXnmLun7s5k00j+RYT3WX3D
GoLIw9vZDzWWHRLSJBjjdtc3cMu8LrAKHvBmHXsvPvC/giX71EA=
=i6IU
-----END PGP SIGNATURE-----

--dJyWBSYfjLochwFK--
