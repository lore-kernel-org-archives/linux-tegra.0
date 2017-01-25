From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: paz00: fix __initdata placement
Date: Wed, 25 Jan 2017 09:11:13 +0100
Message-ID: <20170125081113.GD13025@ulmo.ba.sec>
References: <20170123074347.GA29804@dtor-ws>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170123074347.GA29804@dtor-ws>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 22, 2017 at 11:43:47PM -0800, Dmitry Torokhov wrote:
> To have expected effect the __initdata attribute should go after variable
> name and before initializer.`
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-paz00.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied with an updated commit message.

Thanks,
Thierry

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIXZ4ACgkQ3SOs138+
s6HUFA//W9aCuKSYL164ArImULJbK3a4eFpIiQcWOjUhVf9L+TkFkMXAhLffOHcm
8t1TbgyYmumbg9LmY0W3Qv6EUvZP7UBozSgXa7mP8LjPu+dk4G7wO9zojO1N8quF
5MTWoEUMgw9qlLw6v3pddnse6bP6be3bAL8Dq+EiB4FJxVoeKYJxELgk6IMQXrhe
HlFMcjckId6A5DiYiYFqby1ncQkrjqpt3nmLus6zM2p51BoTa65UC/etUYjWcND1
z3b7RIqXgbLd3i3V9rEygLL5bfTtezCykw7mxKhh/u/XAHt8eF17REHbgHZow6uW
3R02QWOXHkh2zvW4kCG2cSLAD85Mbg6LEQOOSOdJs4C5kS0BFZzHWyPzHkufmjAv
Cb79AOUU50B/TB9doeCPGQ3cRvRF9Fl+qwx5JNwDY4kYVMzcZPKTN8C49u2Pv5B0
tYHG0450IrPBtBgPojdJuScQlkns8h2wZUkYFHjY5FyZiZ3wErAyECVjA2smhPGN
Vjqf4CTGARLIzpJbQg6Y5jmuGwN+KM6tUDwxErfeWQwfr87pKFLreBDN6lg0RKSp
rizRonB3ZitupM5L2HBNRyDS5CIICNuN29hZMIG7RRgNEUmez1o4xBYzo5hMfoiK
QT3L8f0XfG0bgT9w4N8RP6S/qa8vZedimPfWGV6+Wiiv/04jBGI=
=k8G1
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--
