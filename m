From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] soc/tegra: regulators: Do nothing if voltage is
 unchanged
Date: Fri, 10 Jan 2020 15:43:22 +0100
Message-ID: <20200110144322.GG2233456@ulmo>
References: <20191218185535.28009-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NPukt5Otb9an/u20"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20191218185535.28009-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NPukt5Otb9an/u20
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 09:55:35PM +0300, Dmitry Osipenko wrote:
> There is no need to re-apply the same voltage. This change is just a minor
> cleanup.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/soc/tegra/regulators-tegra20.c | 8 +++++++-
>  drivers/soc/tegra/regulators-tegra30.c | 6 ++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--NPukt5Otb9an/u20
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YjYoACgkQ3SOs138+
s6Eusw/9G9TlQ95LtoxHiZ7aTwYjtkWu8hMQHdaqfAwA4dTYFXFR+GEwFiG8sbZE
Z3gymKFyJsGtJ/ZjEfpHjSIr17XgJSWjHoLWbZFMKK83qDhvvZVorATVgYxrwEVd
PGX/ID+vStx6nD+5wKBraSSTNZfHXDIcX/sZk0Fsg/Rt22d1pJP9o2MsPdNfCKss
NFnTF75mg/v1t5c7K4kj2GXmJS1ML3Md7rFapSohYO3F7nUSjG2W9J41skROaoLO
QnxXxzzEicALtEkzNqZqFrQpvJivW/gsE4WVStx1ycMQF82Z8Ev2+Lvj+MiuHCYO
EmBfQmz4uYxWMCJVZfnuaKCy20/TMDySYFJLbNS5qwdWubx/Tj3l5ZkwJQyIkLDO
o4W0FzUvIfPIIwbf8n6J93jP/1rDN3zKfAZyqbwbYfYAz964ztBak3LYirmtIHD8
pkOhDin5glDOUkI5it24wfS4SyOb1a6wKtluSRMSrPBL1e+074HoWAhpv5kt7Gyu
PcizKWX98I3gLfdhQ5I28/Zk8244psnk/iHulSs3207nQlurzirO+9dK/PGEwjJC
fZEGD0ed4psamobjXwYQQbilRFkWpf14EwkiBwvBVEd3J1knlrX78JoW0tDj3tQT
1Z6YmkSsIQEuJwE3pMN/rMkHGr0jmjcQFWFPBEl4+AzBbypQubk=
=gKKP
-----END PGP SIGNATURE-----

--NPukt5Otb9an/u20--
