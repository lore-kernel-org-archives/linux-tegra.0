From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] serial: tegra: drop bogus NULL tty-port checks
Date: Tue, 14 Jul 2020 17:52:44 +0200
Message-ID: <20200714155244.GC251696@ulmo>
References: <20200710135947.2737-1-johan@kernel.org>
 <20200710135947.2737-3-johan@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200710135947.2737-3-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2020 at 03:59:47PM +0200, Johan Hovold wrote:
> The struct tty_port is part of the uart state and will never be NULL in
> the receive helpers. Drop the bogus NULL checks and rename the
> pointer-variables "port" to differentiate them from struct tty_struct
> pointers (which can be NULL).
>=20
> Fixes: 962963e4ee23 ("serial: tegra: Switch to using struct tty_port")
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/tty/serial/serial-tegra.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8N1MwACgkQ3SOs138+
s6HN4Q/9GbF9ywuYWv23IziNN5Nomf0Lg5LzLc4u2KZiDaVFS94F7kqYc2ZVI189
xKiFdeXeWfKadEcU3b9v8aSZeG+jQyjRq8SjlVa0jwN3pI1MQPEGUHeIKS53rWuy
nmm3csdutYZEP9N4I7WPpgUJkhL8ReY5ycJmgAQT8Pw6lc/ikgg2RqZo8GK/L4vF
DfcXXOGWf0C9rM8FS0Gsm3j0ZEiMNpo2mWqIb58nBZIW0DrYfg+E5CNB3KeVc6ry
BXANwBwth2Np20gcTu29RYClJ+jPIaHLIyoyu/z1JFu4fKuQ8fE+5srm0UqrvKnB
XXsr7Uck2Pp+cIICAwURnkeAdP/81ak27BvPJe+0039CRs0HxrQ8aLbEgfMU+0i+
MoGuqpjYC+HmMEoMDUICoB0WHtHAoaeocUxN7wO45HMei4Vme4yDHrpsVQMeZ3Iw
3SPuGaSPcjRqYnxvkDcMwLpbdj6llcpPO3vf5FGHD8LdgxGTcugz2/n43By1rDLS
+1QitK/7JPf4hvaoBeYvd59GqRSc+oO0chrnHoWODjhC3kqS+VAjdU8bhcJLDEet
GiWN2CqDsKujxrLj8gRqg72YE5CVXriVCiQdkULQz6g4qI9XA1/hP+wWKcJybB6l
FQylj2A4/s1ZU5+APCsrmUlAOWkVYKradW0d0iG8Pozn120jpik=
=O4HE
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--
