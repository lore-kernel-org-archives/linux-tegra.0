From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: tegra: Add AHB driver
Date: Wed, 25 Apr 2012 10:46:41 +0300
Message-ID: <20120425074639.GB3423@arwen.pp.htv.fi>
References: <1335269116-9578-1-git-send-email-hdoyu@nvidia.com>
 <20120424195645.GB3628@n2100.arm.linux.org.uk>
 <20120425083747.466f5c98330af8964d980b8c@nvidia.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120425083747.466f5c98330af8964d980b8c-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 25, 2012 at 08:37:47AM +0300, Hiroshi Doyu wrote:
> On Tue, 24 Apr 2012 21:56:45 +0200
> Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
>=20
> > On Tue, Apr 24, 2012 at 03:05:14PM +0300, Hiroshi DOYU wrote:
> > > The AHB Bus conforms to the AMBA Specification (Rev 2.0) Advanced
> > > High-performance Bus (AHB) architecture.
> > >=20
> > > The AHB Arbiter controls AHB bus master arbitration. This effectively
> > > forms a second level of arbitration for access to the memory
> > > controller through the AHB Slave Memory device. The AHB pre-fetch
> > > logic can be configured to enhance performance for devices doing
> > > sequential access. Each AHB master is assigned to either the high or
> > > low priority bin. Both Tegra20/30 have this AHB bus.
> > >=20
> > > Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> > > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > > ---
> > > Update:
> > > - Use platform_device to get info from dt dynamically.(Felipe/Arnd)
> > > ---
> > >  arch/arm/mach-tegra/Makefile    |    1 +
> > >  arch/arm/mach-tegra/tegra-ahb.c |  285 +++++++++++++++++++++++++++++=
++++++++++
> > >  2 files changed, 286 insertions(+), 0 deletions(-)
> >=20
> > 1. I thought we weren't going to have any more drivers under
> >    arch/arm
>=20
> Can this driver be located under "drivers/misc"? Or is there any better p=
lace?

maybe drivers/platform/arm/ ??

--=20
balbi

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPl6vfAAoJEIaOsuA1yqRE1o8P/jyrVuTWZkuqqMAI/mbLL6xo
u17mdNfmPC/wqtvbzljhdafLB9PHW0W8To4NZcXT1ojNPyMdsYeEc2zwhMDXJrj3
8cQNfI3omaPAfYrz3pdWvDpnkhWN1VPT9nM+MqcIWyVcCgYRCjMiDH5P7mWH0aIa
QCCrRuMfoSeV3GuSYDiTgeYNZgvOQwjw1pCOwF4lbCGSoT4FndulWUzC1Z2xN9/7
m3D/st8kY40hbp32viQwxPPUDQM2kJjfUCijs+RRyMPkFAVySWHUgAtbmDgS7V4p
E30ExEV5qkdzplbphtjRnkV5CnaTdl+4uFJxXuEEiB92Prirt+17xKsjMkL/MMes
uaMTNkZr4nMgvBGDtcjPWDpBzdMesWRzTz+QcKwZBP/hNy2AxYgTBNosDLw5JKeD
tfXZ58Hr42CpsRMsM2uZkBSmC+hcxFJ55JgEuWLAppOfKH1SryR9r6xZgnz7tlNC
K9HkEofj+ruz2q4uE5pHOd8X1DixGOdL0XPBdK3WIzwWc15rH8YOGI5RgJTNx6bG
VgS/M23qRCd5Ky17VZssbc0DXFc5desbKM9W0SIg9P3cM/K7oL8N0XpxlvV3rNx0
kr5QE+GPFHds8wUzAz7fxI7WWRfna++Emp/GBCDlrDUDCY0+EstNKFnAXBgiPypm
Tp2eVknArhrpJ8KQLkCq
=758m
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
