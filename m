From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: tegra: update device trees for USB binding
 rework
Date: Wed, 20 Mar 2013 14:24:54 +0200
Message-ID: <20130320122454.GK29659@arwen.pp.htv.fi>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com>
 <1363609781-4045-3-git-send-email-vbyravarasu@nvidia.com>
 <51499C29.6070405@ti.com>
 <D958900912E20642BCBC71664EFECE3E6E5092FFE7@BGMAIL02.nvidia.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1EIGrW/+75u5Nmw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <D958900912E20642BCBC71664EFECE3E6E5092FFE7-QZ+emBqkIFBDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: kishon <kishon-l0cyMroinI0@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--L1EIGrW/+75u5Nmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2013 at 05:47:46PM +0530, Venu Byravarasu wrote:
> > -----Original Message-----
> > From: kishon [mailto:kishon-l0cyMroinI0@public.gmane.org]
> > Sent: Wednesday, March 20, 2013 4:53 PM
> > To: Venu Byravarasu
> > Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org;
> > balbi-l0cyMroinI0@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-
> > discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > Subject: Re: [PATCH 2/7] ARM: tegra: update device trees for USB binding
> > rework
> >=20
> > Hi,
> >=20
> > On Monday 18 March 2013 05:59 PM, Venu Byravarasu wrote:
> > > This patch updates all Tegra board files so that they contain all the
> > > properties required by the updated USB DT binding. Note that this pat=
ch
> > > only adds the new properties and does not yet remove the old properti=
es,
> > > in order to maintain bisectability. The old properties will be removed
> > > once the driver has been updated to assume the new bindings.
> > >
> > > Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >   arch/arm/boot/dts/tegra20-colibri-512.dtsi |    4 +++
> > >   arch/arm/boot/dts/tegra20-harmony.dts      |    8 +++---
> > >   arch/arm/boot/dts/tegra20-iris-512.dts     |    4 +++
> > >   arch/arm/boot/dts/tegra20-paz00.dts        |    8 +++---
> > >   arch/arm/boot/dts/tegra20-seaboard.dts     |   13 +++++++---
> > >   arch/arm/boot/dts/tegra20-trimslice.dts    |   12 +++++++---
> > >   arch/arm/boot/dts/tegra20-ventana.dts      |    7 +++--
> > >   arch/arm/boot/dts/tegra20.dtsi             |   32 +++++++++++++++++=
----------
> > >   8 files changed, 57 insertions(+), 31 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> > b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> > > index cb73e62..af5a7ae 100644
> > > --- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> > > +++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> > > @@ -443,6 +443,10 @@
> > >   		nvidia,phy-reset-gpio =3D <&gpio 169 0>; /* gpio PV1 */
> > >   	};
> > >
> > > +	usb-phy@c5004000 {
> > This node doesn't have a *reg* property. So "@c5004000" is not needed.
> > This comment applies to all the nodes which doesn't have *reg* property.
>=20
> Thanks Kishon for the comments.
> As I've 3 usb-phy DT nodes, how to differentiate between them if I remove=
 this @Address ?

then add reg property :-)

--=20
balbi

--L1EIGrW/+75u5Nmw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRSaqWAAoJEIaOsuA1yqREnDIP/2m5fyimoocUt/NhGQO5L5YA
h3o65KEI/SAG3t4Pdni1gZg9fhfEfkvPtKlNs9V/nSPh9hnmFXdpZUmKPCDm23Qm
LrmpAhGOgKQGSlsYfPhPei/LNTD+JjXtyJZqg1XQfQtuvHYO03eWDCQI3Fi0emWS
i1oMQEKdFQm3IDQz2eI/UcSFW7gtlJWmtbhDJe38ZCxdFtiv7g2amOzR9vdt5mhS
2AKauMaXAgzcI8ma1E7wXae9SuPxsJpjoMYepMxo3T4UFU5npiOamMjdqUGkn8/V
cYRHaR92ZI0prVFwGVNN8PRRXxNSjd92nLrM8Ef4pvaEhjmpahnKSNM9OwnGHi8z
Q7KBK79A2ynbQ4x3A6DPagL9kdhwnPKUQsX89+d631qDFBzjj5luoA/KK/xc6Alv
z8Ei3otKns6Q67KfxTwVfAu/IZ+0LzBSqYW5XuTm26X9t2kH2GfN6kFIjeJkLnCH
e8tAAt5yx/HS/o3SeJpMEH/P7x0hpMKItiksJdbJhUkkdQy7rqNaN8dqhkSBHkRf
/jitAXAnDMQ79NXgUXCIN1kWTQp2VwBbfHp93tqMumB8Coh2brb21Wu8LOz4nwTY
hACq5ty3u9DqdzeUxID5ThGJVyvCLVtAJ3S7eJV/3TpSSeM7/pvxdaXLqB8twTdH
rEyxtTtD2awL7wpk/n9L
=OwEL
-----END PGP SIGNATURE-----

--L1EIGrW/+75u5Nmw--
