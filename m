From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 12/13] arm64: tegra: Add sor-safe clock to DPAUX
 binding
Date: Mon, 20 Jun 2016 18:38:42 +0200
Message-ID: <20160620163842.GC6175@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-13-git-send-email-jonathanh@nvidia.com>
 <20160617164746.GM27475@ulmo.ba.sec> <5767B61A.3090102@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0333713361=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5767B61A.3090102@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0333713361==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2016 at 10:23:38AM +0100, Jon Hunter wrote:
>=20
> On 17/06/16 17:47, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Fri, Jun 17, 2016 at 01:03:46PM +0100, Jon Hunter wrote:
> >> Populate the 'sor-safe' clock for DPAUX devices on Tegra210 that requi=
re
> >> this clock for operation. Update the compatability string for the DPAUX
> >> instance at address 0x545c0000 to be "nvidia,tegra210-dpaux" to ensure
> >> that the 'sor-safe' clock is enabled for this device.
> >=20
> > Does the second DPAUX need this, too? I have a vague recollection that
> > they were both slightly different.
>=20
> I have assumed so, but I am checking with the h/w folks on this. Right
> now the TRM only describes the procedure for configuring the DPAUX pads
> for i2c6. I am also asking about sharing the DPAUX1 pads with i2c4.

Yes, last time I looked it wasn't documented anywhere with which I2C
controller the other DPAUX shared its pads.

It'd be good to get all of that documented in the TRM.

Thierry

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXaBwSAAoJEN0jrNd/PrOhDqoP/2tQZOsbsuW+Jkw87H62ryTc
snkxZO/XvsXPTHicO5A/JU7f3eAtdSmd8sj2DJgtourMOhnx6FYNMjyQssAuNrex
+ZGXenIcbasvcqy30LEjPVaFOVw+fhuhdKxrt2iXhMTZ032VzTabRzr7CJxgEJ3X
Nh7NdwExVd32VdpJcEIID8LS/OMXt3eFGJbzTG3y+Od17txJG+jkqmRoQWUY6rCV
45Im9GTjF727mPA7aGCXEzaLP5/LoWHOrmtdqM/lWDArwYq0a3uepMFG2RHZZS/E
IrSG+gnnTuNagH/gI+nNGWJ0lPcoAFhejFEsEtJGEzSjuC0exMR4AZOWdOCrk/ct
iUeVMBY5arHAf+Uz1W4W+/Cz3X4tZzuAEy7Xkpnf+2e1TEHlOQwhuh9J5CC+vo6R
9nJiR48JOZggt3oS8F1z6UiiVDXejdoMYYnJ/00g9nOdnyme4Sb0ZBq/BJFCDWO9
TbpcXEowGB9tDSzsGH5U1wfMewNLy8asVeaQFP2pXyB+Rc2n/KbwOP8LjzGHRm7e
npCQ8Ya0yVGMwWKRL7F7x87kMtUhUDDOGoHqKAnupGQQPIMFAfn3XgR6dM09Uat5
P2ne1xwuq605/PEKNfml88mshwIWPFSgTghCr9BbON4jp3Ba/TerN5QDU/tlsWEe
5IAblJrx4or7VFV+uXnN
=mHRj
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--

--===============0333713361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0333713361==--
