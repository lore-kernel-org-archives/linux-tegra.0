From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH v2 3/6] ARM: tegra: nyan-big: Include compatible
 revisions for proper detection
Date: Wed, 25 Jan 2017 12:19:48 +0100
Message-ID: <1485343188.1224.4.camel@paulk.fr>
References: <20170122154753.31942-1-contact@paulk.fr>
         <20170122154753.31942-3-contact@paulk.fr>
         <20170125110246.GD9344@ulmo.ba.sec> <1485342488.1224.3.camel@paulk.fr>
         <20170125111458.GH9344@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-SMET0+kRFAN8BAZPgXvI"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170125111458.GH9344@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>, Peter Rosin <peda@axentia.se>
List-Id: linux-tegra@vger.kernel.org


--=-SMET0+kRFAN8BAZPgXvI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 janvier 2017 =C3=A0 12:14 +0100, Thierry Reding a =C3=A9crit=
=C2=A0:
> On Wed, Jan 25, 2017 at 12:08:08PM +0100, Paul Kocialkowski wrote:
> > Le mercredi 25 janvier 2017 =C3=A0 12:02 +0100, Thierry Reding a =C3=A9=
crit=C2=A0:
> > > On Sun, Jan 22, 2017 at 04:47:50PM +0100, Paul Kocialkowski wrote:
> > > > Depthcharge (the payload used with cros devices) will attempt to de=
tect
> > > > boards using their revision. This includes all the known revisions =
for
> > > > the nyan-big board so that the dtb can be selected preferably.
> > > >=20
> > > > Defining compatibly revisions allows depthcharge to select the kern=
el
> > > > via the revision it detects instead of using the default kernel. Th=
is
> > > > allows having a FIT image with multiple kernels for multiple device=
s.
> > > >=20
> > > > Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> > > > ---
> > > > =C2=A0arch/arm/boot/dts/tegra124-nyan-big.dts | 7 ++++++-
> > > > =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > I've applied this, with a small change, see below.
> > >=20
> > > > diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts
> > > > b/arch/arm/boot/dts/tegra124-nyan-big.dts
> > > > index 67d7cfb32541..f12ece9b76a6 100644
> > > > --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
> > > > +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> > > > @@ -6,7 +6,12 @@
> > > > =C2=A0
> > > > =C2=A0/ {
> > > > =C2=A0	model =3D "Acer Chromebook 13 CB5-311";
> > > > -	compatible =3D "google,nyan-big", "nvidia,tegra124";
> > > > +	compatible =3D "google,nyan-big-rev7", "google,nyan-big-rev6",
> > > > +			"google,nyan-big-rev5", "google,nyan-big-rev4",
> > > > +			"google,nyan-big-rev3", "google,nyan-big-rev2",
> > > > +			"google,nyan-big-rev5", "google,nyan-big-rev4",
> > >=20
> > > This line is the same as two lines above, so I've removed this one. I=
've
> > > also used slightly different padding (two tabs and align to the first
> > > string in the first line with spaces) to make it consistent with othe=
r
> > > string lists in the file.
> >=20
> > Oops, sorry I missed that last faulty line. Actually, it should have
> > contained:
> > "google,nyan-blaze-rev1", "google,nyan-blaze-rev0";
> >=20
> > instead so that all revision, from 7 down to 0 are covered.
> >=20
> > Should I make another patch on top to fix that?
>=20
> Here's what I've put into Tegra's for-next, that has all the necessary
> revisions, doesn't it?
>=20
> 	https://git.kernel.org/cgit/linux/kernel/git/tegra/linux.git/commit/?h=
=3Df
> or-next&id=3Dbfa3c0d4e8ba8eff525d34dbde0e76a98ebfbade
>=20
> If so, no need for another patch.

Excellent, it's all there! Thanks a bunch.

--=20
Paul Kocialkowski, developer of free digital technology at the lower levels

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-SMET0+kRFAN8BAZPgXvI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAliIidQACgkQhP3B6o/u
lQxF4Q//cgM1ODs7jyuOqKR2hhEn2kV+2RSKJzFxWRZawYuB3S+LDnaTBXdmne+Y
pxTrOzR5ATr8QFb0XHR+jZ1SFClICBGyWunjnvC/N9syWow0JdLZQhhY6LUpHj6Q
WDhOFGknD6cWVZpy6OqyrH1wtuRLurUfYhReADNYULUIbz8v/o2l/dLgy/XVMe/+
zAsANDAuRC6Ai8qyF4BdBUXIZNFoX3IE6v/TiWNqqS9Favve0AsaxJrx5Woyw6YJ
gQNYPea33jSw+qsdthJ1g67NlNbTzFWw9jdYBz0/aoRSHspkFrQVruK8G7rhmL7V
0n6BygRJaeDtYfGTTRcywEmx0CQF2u60ZMZnIrN/p1ek0mqXeZ0Itw9iRktr53iv
DPuf5B8mPuEoHnAu945Ej7zK2VGsje8WBoyPbqU81CvJbMfY7JMpOm6CwA/iEtDO
FFIRE/j66INhIVfpn/hHbZti+J5O+x4IhhHMAnY+J1OkXUreUVc1gxxWvLQbDu0k
t9LsgP6ecTWo1U8gJmDtLKoogtIp3NRwqNllIy/+laqjh/CZzeLQtM/8cko6FLMj
pdluGcQg96Da4cgoFYzxWGHzl+flTaMbxe5a2ZmRGIXfSe7vM4E1MCoeFfNlLmSk
bpXe0ojrenxR1fd07lyU/ERDThyfEOsIpzIEZjktwLl+ZTc2cGI=
=edvh
-----END PGP SIGNATURE-----

--=-SMET0+kRFAN8BAZPgXvI--
