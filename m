From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/6] gpu: host1x: Fix client_managed type
Date: Sun, 26 May 2013 12:17:19 +0200
Message-ID: <20130526101718.GD1652@mithrandir>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
 <1368791388-31441-5-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1368791388-31441-5-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2013 at 02:49:46PM +0300, Arto Merilainen wrote:
> client_managed field in syncpoint structure was defined as an
> integer. The field holds, however, only a boolean value. This patch
> modifies the type to boolean.
>=20
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/drm/gr2d.c |    2 +-
>  drivers/gpu/host1x/syncpt.c   |    8 ++++----
>  drivers/gpu/host1x/syncpt.h   |    6 +++---
>  3 files changed, 8 insertions(+), 8 deletions(-)

Looks good. I'll wait for v2 of the series before applying this to make
things easier.

Thierry

--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRoeEuAAoJEN0jrNd/PrOhEckQAJgu1tKUf7rkWCOFWZTuWJ1N
T3teimxD1g77C4QiejiFx+PdZra/PneRWVsuJYTFwfKOZ706adg8vnP8fsdpXWB+
Mngyg230JY+NTIqlMjFSxuOlzBHD/HW2zW38tgF2+Du+q2BuDKtVG+1ucQUT2pX7
EHRhiwjqxXq9aXbZf1H4XiVpaG6lXFFaLTNGDSpd51ponBICBmcx8UDZLqw/3CvQ
OuvDQP1J+V720g3ri5Zyq7JiO9CzzDQARlNNtGW5m4QN9fM/GkoEj/K0xniS0F5A
zRylsjJn+n3ELBJfsrBayod+kDFPw+pHVvBRM3EUcaWrS6oUkXmGBeGX8AgGXalA
omTd3K5dpKG/i2IfehpQBO4z1Dc20G2YQzKyaW6F7ptJHMWkOgEc3bd/hzYObtbF
zaFvU/rNm7pNPRqwTdsCxReqtlVfvyDZSZuV040sa6venQf3N011nS0BN6JPOzNt
dcDa6JGzD9m8kLnvtAAkJ2QIlPuLZdTuZ8yYETBfDXhnsRUgnyk2qOQ780jwRowW
olUkZrc2DGPGMK05mVAuvJwjtlurov6tNyCI7WlbWxqxl/xPoQupSXnyD2SMuzSZ
W/e4zz7v63ReFk4RFyIOLM5Z/0pIAwUA8VQ7DGbsa4D8MGXM10A/f2thpCyJflIE
4GJLfXwsQgmo7iAs8JYG
=nZLz
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--
