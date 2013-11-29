From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/31] dma: tegra: use reset framework
Date: Fri, 29 Nov 2013 14:47:33 +0100
Message-ID: <20131129134732.GZ22771@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-13-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5FDiZl1vRbLRjwwc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-13-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--5FDiZl1vRbLRjwwc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:07PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra's clock driver now provides an implementation of the common
> reset API (include/linux/reset.h). Use this instead of the old Tegra-
> specific API; that will soon be removed.
>=20
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.
> ---
>  drivers/dma/tegra20-apb-dma.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--5FDiZl1vRbLRjwwc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmJr0AAoJEN0jrNd/PrOhr1kP/36MAFHEPNDC1f/ZgbF7yfZJ
2qHCHyL42v9Vegv0W4lRtgV2TCPV26vQwUQXKLDUBUZDdDTDsPHbKDs1CCBnTNbW
5kkZYmbwXy0OTDYQWhZh31VRXJn+RSMJM9PXk+z92I4dc6/rw1SqN2ZIP+8sbxMQ
M7u8fKvbaUC77jwxfUaKuoKI0d+1/qm2n8ZzenP+41jItY7faShIZaz8pgk9dyqB
pfH1m2zJmKCb7/7HFR9o1VyqI0CGU7LrUgrwjm0ONmP0vYRIe3ivro2ZbjRqmrNk
G4DZFBzU/pQK8pi9lMS7YPVsAM8Bu2g5XdslYF30wI56rfOvC5r34yIPewnQTUYn
I9yQHn3kBH65a1CVVzEw20oqdWsNx7mF2ycx5nyTFmN9ep68blw7oaHpzKBxa5xF
uRVsLC7NAY6puE5NBauTQu+XCBO7KvXjlb2yVHPglKZTa44jclnju15pJUXpjK2J
0QFqWg/gOb8/pTU25sHeF4K6++GbXjq1Jekx8X/uWtiOdbShFSU8w7nQ6cmtk8qJ
fp+cihhyAGYkwcEgjxhnaiLKNodWFxxZz9QkuomFOMX825pVOT1caS5Xgmt2ApvD
WnP/40Wnicev48wPU+egfK7uMxYN7ZEXefDb78WSGZdFUkrLwFKFFPla/oONTVQJ
v5S/oB/sJjGrx7ILel46
=ekEm
-----END PGP SIGNATURE-----

--5FDiZl1vRbLRjwwc--
