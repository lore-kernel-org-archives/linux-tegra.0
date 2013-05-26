From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/6] drm/tegra: Fix syncpoint increment return code
Date: Sun, 26 May 2013 12:26:08 +0200
Message-ID: <20130526102607.GF1652@mithrandir>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
 <1368791388-31441-7-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UBnjLfzoMQYIXCvq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1368791388-31441-7-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UBnjLfzoMQYIXCvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2013 at 02:49:48PM +0300, Arto Merilainen wrote:
> Add syncpoint increment to return a proper return code based on the
> return value from host1x.
>=20
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/drm/drm.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Maybe this should be folded into patch 5 because it is related to the
fact that host1x_syncpt_incr() now returns proper error codes?

Thierry

--UBnjLfzoMQYIXCvq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRoeM/AAoJEN0jrNd/PrOhOcQP/A8bTVbRudqsLjxCuC0fZdpH
F4ZsvRyOENuLu9uXEzUgcHYlAmZ82r2r9FV5BxUnk9sw/W2wJjije1w8V3oDwlCG
ufXBGI7/QjilXMaAlQEYcU9HBKRZVRedtDwpRclPy9fh0BsuospINBri2sFKOYqB
wx827Y+/aIMe161QcKX9ePMFQ2F/m9OFAxpYABA8HUHZH0Hc08yy6//KmFlVAe3u
M68uK/1A/93gW6TKBH+ad2rSPQ6lamjspKIaIgbeCQtseGG9L0nZ0vaQ7WqDWjMC
eFEhW4resB3VHvLyhTNMAR6fZlf+npJu3UIT6HOL/KVUtCVmVkp1vlYixwvLO2K0
PMpLFouVeN/9Ye7UDSl1bYng2I5CamP6iEAmpvIxMIMxEw/MEXGJU5OrAq25PFnN
6d58VAo1JKWMVSu5hRh1ifwnb9QvxIVaObWYhZI1UF4T2pY4jsJzXKWKqX8QyyaA
oLrYx6j+vjHGUTvqYhBKFc59rM2huOVRhP4XlGpyHmThTND7Trha4SoX6kK6pOo5
98mpNT9Xo6fjY8rTkfRRRLTki3EHxK7x68ZeEEfDDXbCP6OybOH1c8OG6ERg4r52
3+BbTWP+BH5FFFyCf91Ic3Yore34MY6l9a0HfTmSHbuJzXi1VOA9UkZh882cpS2L
owYt6LXYuayLIcwsw2u2
=axDN
-----END PGP SIGNATURE-----

--UBnjLfzoMQYIXCvq--
