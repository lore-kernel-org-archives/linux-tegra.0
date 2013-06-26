From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: tegra20: Remove obsolete vbus-gpio
 properties
Date: Wed, 26 Jun 2013 13:23:33 +0300
Message-ID: <20130626102333.GV12640@arwen.pp.htv.fi>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com>
 <1372240781-1017-5-git-send-email-mperttunen@nvidia.com>
 <20130626101758.GU12640@arwen.pp.htv.fi>
 <op.wy9625kupdlnwf@mperttunen-lnx>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hW3Q5Oh0pcvvyJMS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <op.wy9625kupdlnwf@mperttunen-lnx>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--hW3Q5Oh0pcvvyJMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 26, 2013 at 01:22:07PM +0300, Mikko Perttunen wrote:
> On Wed, 26 Jun 2013 13:17:58 +0300, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
>=20
> >* PGP Signed by an unknown key
> >
> >On Wed, Jun 26, 2013 at 12:59:41PM +0300, Mikko Perttunen wrote:
> >>USB VBUS regulators are now specified with the vbus-supply property
> >>instead of vbus-gpio, so remove the obsolete properties.
> >>
> >>Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>---
> >> arch/arm/boot/dts/tegra20-seaboard.dts  | 1 -
> >> arch/arm/boot/dts/tegra20-trimslice.dts | 1 -
> >> arch/arm/boot/dts/tegra20-whistler.dts  | 2 --
> >> 3 files changed, 4 deletions(-)
> >>
> >>diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts
> >>b/arch/arm/boot/dts/tegra20-seaboard.dts
> >>index ab177b4..2ab4775 100644
> >>--- a/arch/arm/boot/dts/tegra20-seaboard.dts
> >>+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
> >>@@ -566,7 +566,6 @@
> >>
> >> 	usb@c5000000 {
> >> 		status =3D "okay";
> >>-		nvidia,vbus-gpio =3D <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> >
> >silly question but don't you need to put a phandle to the VBUS regulator
> >here ?
> >
>=20
> It's already there in the corresponding usb-phy node. They were added by
> Venu Byravarasu in commit 4c94c8b5 "ARM: tegra: update device trees for
> USB binding rework".

aaa alright, my bad :-)

cheers

--=20
balbi

--hW3Q5Oh0pcvvyJMS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRysElAAoJEIaOsuA1yqREndsP/i0I8cPJRt0g+Rv/T4/cDBdy
2y/71f3GnNftTU3b/YyDkDn4Tqpy3CvGqGfmghiJQaKl1XREHvlQBtPsNHV4S1tU
baGsp1BLPn7sV1Z0aLNMJeNf1ABTt5MNVA+g5i5/50ohoWoodkb1FugUwnM2mm0E
ON/RrOdoP2YxzB7qL4/eC88qgEDmK/STQJXezskcXbxpXLIEKaa9XwIq699qF5iD
KJVzNIFJ5CLrEH5MwTPOyp9J0MXiX8ecT8pddcKhLS6z4H3MIed6hTsZiDOJahkJ
Ps0fuyFC5njsuTWYIj/yllttf1aJNKsULfKDQeWKH88nufmDfcBO5ZmoTPoza6sI
ASrMDHqxBJlpWLhZ25NE2VnDWwLfMwEtbY6m/VnlliQH3xZRSFcqfGRdkoG8VuZg
elBGLYWaTZzn6Ah8+CQ3GPB/aGN+SuR5qElkTAkcP6z+k1meY71QCjS/dRR2vdhn
v0/h8Ugm9qPiCshrrWdvCmsgx/xZfVYaH0VX2/jZfeBaO1+zuoj0AYGTanqeTcOQ
IfiQ1wsfV6MaigsBx9dc4V2CAyPDiIx8Z5S4iC35M63M8G0VH95iV0fR29sWgnqn
cDr5jhkzXetGsWxswWJd5S7a7AokKl6XQNRk5AES0/85P25MVDKdC6la54jlrRMm
k3Oxf7CjvgK+DAqT18i1
=TDXa
-----END PGP SIGNATURE-----

--hW3Q5Oh0pcvvyJMS--
