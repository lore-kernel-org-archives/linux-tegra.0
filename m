From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: import latest Jetson TK1 spreadsheet
Date: Wed, 22 Jun 2016 14:54:07 +0200
Message-ID: <20160622125407.GI26943@ulmo.ba.sec>
References: <20160621185149.20625-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a7XSrSxqzVsaECgU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160621185149.20625-1-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--a7XSrSxqzVsaECgU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2016 at 12:51:49PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This imports v11 of "Jetson TK1 Development Platform Pin Mux" from
> https://developer.nvidia.com/embedded/downloads.
>=20
> The new version defines the mux option for the MIPI pad ctrl selection.
> The OWR pin no longer has an entry in the configuration table because
> the only mux option it support is OWR, that feature isn't supported, and
> hence can't conflict with any other pin. This pin can only usefully be
> used as a GPIO.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--a7XSrSxqzVsaECgU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXaopvAAoJEN0jrNd/PrOhGDkP/2UaoJEfcdzVNP3fviO8DJAx
h3GFw+hK2D6EY2R9so7aXhN6oJVm7wI8xIJe+PCrSiIfXsSVY5F3iiONqV6bvp7u
pKEMfQ5Qoc8xLCHSp8pKGQiNT/i0C9GRHhTrYs1nuueiPMMrlzGtgd8ec1sVl2LM
3dGJUOAgNZr/VhKi5z+QkfvumlDzzjhrFm3U9fF441CyszaC1E57MoP52Lu7SyOW
gMHEuDcF2oNV4euQ1D8Vu0zzUtrnhL+BvKuoAMJE/9x1ZAlu6Mwi6VH3iei5Fnl8
AdP35JqjW3IXznJK2hsiCZFN/I83Hl57keuBFyj3cLNiOF7q9GrjroqOYbYYiErY
/1m6f1iJWc/p4tc2AJ3jzwxR1ZIgV/Z99DasnMA4tKwU3ZueAL9z1yb05Ip0DAei
yLpVM/5Uyh3foMCpVoVJbEDUxz0LImv9fpo88WkbCzq6Z3AFDBQpahfwkbFNp0XR
We7SEbWjq6EShDLbgw6KSxB9huxuhQ1qAvNAoJzPvA9r5q7ZJ6DmnZE9tYrBfD19
zInWx1T2o1b6T4aUu0AuSvNiaerNTg0QfFaXqeajCOBWhhsGN3P5jswptPJfHlIM
fPCxVuefl/+PcMGDsyUkyYMe2cyqXl9zSPGBmi0zKRKVlj0P766aZ/tQ2HXrUuEB
u8ipwFOjEsbwcfoTqpOC
=OY6o
-----END PGP SIGNATURE-----

--a7XSrSxqzVsaECgU--
