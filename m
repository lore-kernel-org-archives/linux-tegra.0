From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: make 'host1x_cdma_wait_pushbuffer_space'
 static
Date: Thu, 17 Oct 2019 15:30:07 +0200
Message-ID: <20191017133007.GA3931256@ulmo>
References: <20191017110427.31354-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2093777177=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191017110427.31354-1-ben.dooks@codethink.co.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============2093777177==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 12:04:27PM +0100, Ben Dooks (Codethink) wrote:
> The host1x_cdma_wait_pushbuffer_space function is not declared
> or directly called from outside the file it is in, so make it
> static.
>=20
> Fixes the following sparse warnign:
> drivers/gpu/host1x/cdma.c:235:5: warning: symbol 'host1x_cdma_wait_pushbu=
ffer_space' was not declared. Should it be static?
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/host1x/cdma.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2obNwACgkQ3SOs138+
s6F+aA//aS7lK9wsgW8RKg0cYIVMsuuPaHV9YA0mw9ZBcrS7AUWBIklMro1yeZOr
OWlz26ZnZDqhJ6DVZDiUT386GUukomd6804rnwrc+sf9xy7EdR/Jnhf8GLZN6MeH
oVakuZw0ZAIVCD+ZKAvvlPVYeRooi+n1Uk9f58uA1UgziiWYJIYuTaV6I7hb5jRY
QjPnkJNGk2+yR54vkCDy0YXQc5WwcrxC2GiuPT2P1dfPC5UjqgtiqXOlVGLm53bf
u+ZXGqYlTAToSiDZ/B784asN0AhUW6UTwxT7aJaFMQRYyyE/tR3kUGsRtD8w6Ucb
3GD3b/45eCaFtGmnYOMjbFZE75vOR9BqHoxX2DG6jqNNOhCiqPYtrrJvaxm10vIg
xYd3Chf6zmNqDiLEvmUKycKfdaojENpOwLGWOr1jjhCKeUaKkhJW1geEiCu/7RAg
cwCESTakB+Y3SDweFsnNsxRShEzadmgYqdSQCGiu8AU9yrFGDradvkjrEZmxTkkH
G0tr4SoSnJw2YVeHD213DepUTgcD+q6aEymsTNaQz78NbJ66K3gKqhboqn+9LJ5g
1Ppd4+g6MaIYx28b91cJvOf7mGY3r+b/+VORCrlSUZzhfpiYnIecwPeMh6VsCTSC
RA9HHkKVXtaGZMNJx+5v4Cs/F4do1tCGddf7FoWw6dMgAgImYvQ=
=vNtF
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

--===============2093777177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2093777177==--
