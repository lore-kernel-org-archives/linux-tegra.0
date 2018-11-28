From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] i2c: i2c-tegra: replace spin_lock_irqsave with spin_lock
 in ISR
Date: Wed, 28 Nov 2018 10:13:15 +0100
Message-ID: <20181128091315.GA17419@ulmo>
References: <20180911145446.53621-1-hangdianqj@163.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180911145446.53621-1-hangdianqj@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jun qian <hangdianqj@163.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2018 at 07:54:46AM -0700, jun qian wrote:
> As you are already in ISR, it is unnecessary to call spin_lock_irqsave.
>=20
> Signed-off-by: jun qian <hangdianqj@163.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv+XCgACgkQ3SOs138+
s6FpjRAAnZUyw+m+jt+YEVco0UNR5KOjPcSqzdhHi4TLI+3AJ9UE2zr0o2BNvxWz
pVvgaVX33+Qaok2yBQsHHZ5HjhIrk0xqjaoMe/glpv3rP0S0HPN91BB1dqehhGb/
/0lBcv6nU52kzqjNx0RUtiIxgSi81YCAfcRjg+ORT3crxPGr+hUunPegVryvHoTQ
vSaGwKZBKlBwt+iExxZQ/cXIwoio5YuIWyCWU/G5cNcLuVyTJ/lVDjU/RqX+f1PY
1BxXNIMQiDPAAnw9uKk36sZUduBpXjyxfcONQlhh4aHldLgZJytX/BoO5UkF8/CS
ebXAPQLpMyJylsVToqPWmVBybSTHlU9nuZVpMcufsBXjuQM34IY1uvZtJNHA7aZD
67BvzwL1YA0G4px5ihOAGSMYjF7NFtYkQq337bgD9AeEEZSxAYIPBkMrxASed4/J
W4D9flKbhIjUbI8d9ZhtGgCp6TOC0afnfijKNRQvPiCNBE3Q0NZW5RiTq4zHnzHZ
gIBBNrpXaZcCqGb3/PV6bstFIKCNDEoQiYVqM8M7kdDlPrn1jjkWRzC76fTmmYhi
8cmwZdyByXuXuXWs6QfR137P0nxjATq6/EervnL4v921fM+BWCtVtcKJCPLAnfDe
t98CG57KK89l6S37ZI5Z6kGp5gTdH4igRA3bEOVVHcv88I3kC9k=
=E9df
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
