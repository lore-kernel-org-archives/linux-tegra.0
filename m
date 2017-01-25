From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: tegra: nyan-big: Include compatible
 revisions for proper detection
Date: Wed, 25 Jan 2017 12:14:58 +0100
Message-ID: <20170125111458.GH9344@ulmo.ba.sec>
References: <20170122154753.31942-1-contact@paulk.fr>
 <20170122154753.31942-3-contact@paulk.fr>
 <20170125110246.GD9344@ulmo.ba.sec>
 <1485342488.1224.3.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KscVNZbUup0vZz0f"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1485342488.1224.3.camel-W9ppeneeCTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--KscVNZbUup0vZz0f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 12:08:08PM +0100, Paul Kocialkowski wrote:
> Le mercredi 25 janvier 2017 =C3=A0 12:02 +0100, Thierry Reding a =C3=A9cr=
it=C2=A0:
> > On Sun, Jan 22, 2017 at 04:47:50PM +0100, Paul Kocialkowski wrote:
> > > Depthcharge (the payload used with cros devices) will attempt to dete=
ct
> > > boards using their revision. This includes all the known revisions for
> > > the nyan-big board so that the dtb can be selected preferably.
> > >=20
> > > Defining compatibly revisions allows depthcharge to select the kernel
> > > via the revision it detects instead of using the default kernel. This
> > > allows having a FIT image with multiple kernels for multiple devices.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > > ---
> > > =C2=A0arch/arm/boot/dts/tegra124-nyan-big.dts | 7 ++++++-
> > > =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > I've applied this, with a small change, see below.
> >=20
> > > diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts
> > > b/arch/arm/boot/dts/tegra124-nyan-big.dts
> > > index 67d7cfb32541..f12ece9b76a6 100644
> > > --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
> > > +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> > > @@ -6,7 +6,12 @@
> > > =C2=A0
> > > =C2=A0/ {
> > > =C2=A0	model =3D "Acer Chromebook 13 CB5-311";
> > > -	compatible =3D "google,nyan-big", "nvidia,tegra124";
> > > +	compatible =3D "google,nyan-big-rev7", "google,nyan-big-rev6",
> > > +			"google,nyan-big-rev5", "google,nyan-big-rev4",
> > > +			"google,nyan-big-rev3", "google,nyan-big-rev2",
> > > +			"google,nyan-big-rev5", "google,nyan-big-rev4",
> >=20
> > This line is the same as two lines above, so I've removed this one. I've
> > also used slightly different padding (two tabs and align to the first
> > string in the first line with spaces) to make it consistent with other
> > string lists in the file.
>=20
> Oops, sorry I missed that last faulty line. Actually, it should have cont=
ained:
> "google,nyan-blaze-rev1", "google,nyan-blaze-rev0";
>=20
> instead so that all revision, from 7 down to 0 are covered.
>=20
> Should I make another patch on top to fix that?

Here's what I've put into Tegra's for-next, that has all the necessary
revisions, doesn't it?

	https://git.kernel.org/cgit/linux/kernel/git/tegra/linux.git/commit/?h=3Df=
or-next&id=3Dbfa3c0d4e8ba8eff525d34dbde0e76a98ebfbade

If so, no need for another patch.

Thierry

--KscVNZbUup0vZz0f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIiLIACgkQ3SOs138+
s6HgxhAAtmbvy6FY3UOiHfjMK6S00O0QMihSNvKwtzt41NOewvUps3iURra+5p42
hLW8G4A+ok5+16Eb33RfzpqRzGJV9Lhn3rdWpphhdQdD992f0SDF2L3xr2m1sMzU
/uCOaVVo2hrgoavCnA+Eusce1lzdSS13smxhrTyMuFEvi9HE3RXtuP2L3lRc6te5
P47ppqMKiaiGo9e9MHJiBQSx9ryksQqxnRPX9vZF24z6bvg+flJtQXNReB+zEdLi
ZWDiyG7Btg/oGfK22s7/uF221zbl8I4gyCA2OQvkyFZIQufRoZwekBaHX1vNmYl7
SSH6Uhcj2lUMgrrsGgnFp81unJo6MHH9TXT/2LLN46a09SVaBLeQuVHZQA7qBZy9
tdtiM4ZAvd6cco5b/4I7a5DJl6VEfuM8qQGhcOVbmdiKSFc3Q/4WfQAtglnf6oQa
087lzsU1RteNyB6OCMdmLeZni3jnA+WbuhlmrinF9/fmn69vgXAIU3R+C7ep5rj4
/PF88xsjDqeHZUmthozZhumSIWqSHlVpXLbWqAT8Kw+eZ1wRppa0QrbCAubUX7b/
NzCuQ5su57WS262p6WudoAAntY2926tDTBKD9e9n0FCtu7gpT43KTu2+zOOOpi3+
agc6cROYZtKqwtb7WUAo4yTiQ0z7nEwDAZ6PYh3lzChrTJMz720=
=K/fs
-----END PGP SIGNATURE-----

--KscVNZbUup0vZz0f--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
