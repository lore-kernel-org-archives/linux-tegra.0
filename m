From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] gpu: host1x: Fix memory access in syncpt request
Date: Sun, 26 May 2013 12:15:52 +0200
Message-ID: <20130526101551.GC1652@mithrandir>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
 <1368791388-31441-4-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1368791388-31441-4-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2013 at 02:49:45PM +0300, Arto Merilainen wrote:
> This patch fixes a bad memory access in syncpoint request code. If
> no syncpoints were available, the code accessed unreserved memory
> area causing unexpected behaviour.
>=20
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/syncpt.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
> index 5bf5366..6b7ee88 100644
> --- a/drivers/gpu/host1x/syncpt.c
> +++ b/drivers/gpu/host1x/syncpt.c
> @@ -40,7 +40,7 @@ static struct host1x_syncpt *_host1x_syncpt_alloc(struc=
t host1x *host,
> =20
>  	for (i =3D 0; i < host->info->nb_pts && sp->name; i++, sp++)
>  		;
> -	if (sp->dev)
> +	if (i >=3D host->info->nb_pts)
>  		return NULL;

While changing this, can you please add a blank line between the loop
and the new 'if (...)'?

Thierry

--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRoeDXAAoJEN0jrNd/PrOh66cP/31Qz7r7EscS9F9FilY2jzkg
l/HPZZUPIyrh39eNlYX1uv648nZMGTdUhJrM4cftHpD0YeRlX6SBuE1uD5+0BWml
2ivixxYXm48RKjX7W/OhzOL2gGQnAVON9Wz1z3Iw4a3DrxWaXrEariZWeM4s9orS
h9A7hLWbvsTU0vxgU4lKX4YNYuYxsU3FCsSc5LHcf5idtryyWPrC0k2IgqhN5lpJ
wL+EkCsfDESL44196LZ4q5jTNw6iqyo5AyXgYPQBUxd6gG0Gy1l4wcpB6PyC8naI
6BjRClYo9xdYDwmAhgwhH9KsrlsWpAz3OJmkg1iEfI3sTKOcHKxgKZg8Q5RDBYqg
x7taWw3kYs+Gb6XV54leTHqcaBTLCEPHaleMR4jDUbjqf7W0G1WSyeIaTAc/N40J
boCiMZOLMiASORt4EZlAy3HM3YNA6RVr163ZFj8aHghyUbozpaysg5IoQ+YR8niz
6wAjiT3Sl0UzcUjmiBb3uEDP0oyh7tTKgzJ49u3KO6pjtWmT5YfiwftCMpEG47rl
0vEGCtAU0bwnT1NtXnZowFe+D8+dPjs23ogPahb0DkLDuQdSn5pcqNifoHuGHfsg
y94c2og1ESMNIzsnE7Kf28V8lf9ioUd3Q5+wg4egKYKgEJfcMLq0A668kRO6CqR0
sThHzKu4e9xFRTXA0T37
=XOLF
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
