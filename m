From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: tegra: nyan-big: Include compatible
 revisions for proper detection
Date: Wed, 25 Jan 2017 12:08:08 +0100
Message-ID: <1485342488.1224.3.camel@paulk.fr>
References: <20170122154753.31942-1-contact@paulk.fr>
         <20170122154753.31942-3-contact@paulk.fr>
         <20170125110246.GD9344@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-+wReddnP0GzlViY1whZ5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170125110246.GD9344-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--=-+wReddnP0GzlViY1whZ5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 janvier 2017 =C3=A0 12:02 +0100, Thierry Reding a =C3=A9crit=
=C2=A0:
> On Sun, Jan 22, 2017 at 04:47:50PM +0100, Paul Kocialkowski wrote:
> > Depthcharge (the payload used with cros devices) will attempt to detect
> > boards using their revision. This includes all the known revisions for
> > the nyan-big board so that the dtb can be selected preferably.
> >=20
> > Defining compatibly revisions allows depthcharge to select the kernel
> > via the revision it detects instead of using the default kernel. This
> > allows having a FIT image with multiple kernels for multiple devices.
> >=20
> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > ---
> > =C2=A0arch/arm/boot/dts/tegra124-nyan-big.dts | 7 ++++++-
> > =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> I've applied this, with a small change, see below.
>=20
> > diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts
> > b/arch/arm/boot/dts/tegra124-nyan-big.dts
> > index 67d7cfb32541..f12ece9b76a6 100644
> > --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
> > +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> > @@ -6,7 +6,12 @@
> > =C2=A0
> > =C2=A0/ {
> > =C2=A0	model =3D "Acer Chromebook 13 CB5-311";
> > -	compatible =3D "google,nyan-big", "nvidia,tegra124";
> > +	compatible =3D "google,nyan-big-rev7", "google,nyan-big-rev6",
> > +			"google,nyan-big-rev5", "google,nyan-big-rev4",
> > +			"google,nyan-big-rev3", "google,nyan-big-rev2",
> > +			"google,nyan-big-rev5", "google,nyan-big-rev4",
>=20
> This line is the same as two lines above, so I've removed this one. I've
> also used slightly different padding (two tabs and align to the first
> string in the first line with spaces) to make it consistent with other
> string lists in the file.

Oops, sorry I missed that last faulty line. Actually, it should have contai=
ned:
"google,nyan-blaze-rev1", "google,nyan-blaze-rev0";

instead so that all revision, from 7 down to 0 are covered.

Should I make another patch on top to fix that?

--=20
Paul Kocialkowski, developer of free digital technology at the lower levels

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-+wReddnP0GzlViY1whZ5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAliIhxgACgkQhP3B6o/u
lQx51Q/+LXgMKkx5CjqpkcZrg8AwbuU6OLr0jE8ZKVZYNrUAL4O0DIiSa6A7BgLv
mKTDuJsgCTfLJle9N8pln0cbqAbFwezWy8D8/VvY9mjYx0pE2zf8EEaZdBqI0OUJ
2AhisDmFJ6ChY18XXsTqzVWI+5/72JWQsEqdBk+sEhJSGvkiz3x7qvEuhICkzANw
ELdOkBBRXcJKF39gVp8zSEMWOqtfjBeh10pecbPoJxgLEnPd16w9x9nn2UFrVnYJ
yeTsIk3TBiJzvjxTR8KYHvyXHOySqXpDi50zPxh4XqR2anDs4Lq/AQUpZ5WynGsF
FZjSTds5t13pKRVkxnseUebJuQeG84aeKMQ6Ldo5lrzdvMni9y80A7mguDmwctxf
W9F/UnrP/eBZq0f4fTD+hPOFTOvt1h96zEcao7VbSKXjmv47f9Wt5TnEVRM3+OOj
B/J+1D4CAX7hfmgf6Bxk3qCaNZFDSKXl+jZH7XdFD/ax+CIDOA6vp+smHXVSNmg5
ivcGAAY0Q45tH1IvpOGZxrfUbQyWgrcALbTj+gJxTqP1kpg9Uxno7dMjXaiXZk+u
aZRRnj8bFYL/Bpy0xxsC4v1RBYCEgh3jEJFlv07U0s4QRfFK+0JaCpf1os/+GG0k
O2AKqjBlFWRNlTbE00ktvYS3vQnw/ThtivUl+3Sj4jVs1qdY8sA=
=wIMR
-----END PGP SIGNATURE-----

--=-+wReddnP0GzlViY1whZ5--
