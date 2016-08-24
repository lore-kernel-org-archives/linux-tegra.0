From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] arm64: tegra: Add ADMA node for Tegra210
Date: Wed, 24 Aug 2016 16:50:23 +0200
Message-ID: <20160824145023.GC6887@ulmo.ba.sec>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
 <1470756082-19099-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470756082-19099-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 04:21:17PM +0100, Jon Hunter wrote:
> Populate the ADMA node for Tegra210. The ADMA is used by the Audio
> Processing Engine (APE) on Tegra210 for moving data between the APE
> and system memory.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 32 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 32 insertions(+)

Applied, thanks.

Thierry

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvbQvAAoJEN0jrNd/PrOhqPIP/2WayHnmBIkCePGMLqwz0+nI
PIvg+xedbTMPPEjFmghtYxgq6vmyGEVzTLuNrFSy5BM9y8ca/rmGY29vKZaoNmij
47HIuwDhj2JWtzZyUWIEEOmZAfKnbl887Kf2OLyZlIAU07BwkflW+/xmTAOqGQrv
Ko6nzA/3dHqsCXBdJ6Cgaas+6VoNjIHl86gnEKJVqKYx54UACUr3v/tszVsKgR50
ALVeh6swSev2tx1D5UqDda8mRdsTT82wh2lTihkHGAg/stJaA13NMmhO9nh9Hqbk
mT8MujA6/zwmbAi+tXkUlbt9FPhF//Hq/rLZYX5zXBnGg66yO2fZYHtjBbtYMCoL
/CBKbdxsG9G+q9sDa50ueG+5DShGud1lU1QtW2wmPwi1ElMdS5vFohZkh+lKCw7E
dDoVVXYhJDtmKtYf1aT0XBHiTzQhptqYZQU5ecUOF5U/+Qp4E8D3M3HuFzxKzpVm
e6adPXZJDbnIwDgBgw8FdFt//YvXq+8PZX0vTjinEgBhp35vcGmApfbfDcON27uI
fcH23Qg00J4RSWJbJV1UrRhG3JGJ7nQ082oyxemGtWKLa83ndXfMRgYKo1wfHZCE
XKsbl+4lymgjjUKVDDaJvucg6leN9VYliof2fP4YhyDFxt4j3ZQ63CSPhZkSyNF4
Ff+5RFfz2Ro37rqskmw0
=4zu2
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
