From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/4] drm/tegra: remove irrelevant DRM_UNLOCKED flag
Date: Thu, 23 May 2019 11:15:56 +0200
Message-ID: <20190523091555.GA18130@ulmo>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0751200552=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190522154702.16269-1-emil.l.velikov@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: linux-tegra@vger.kernel.org, kernel@collabora.com, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

--===============0751200552==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 04:46:59PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
>=20
> DRM_UNLOCKED doesn't do anything for non-legacy drivers. Remove it.
>=20
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

I assume you want to take this through drm-misc? In that case:

Acked-by: Thierry Reding <treding@nvidia.com>

Otherwise let me know and I'll pick it up into the Tegra tree.

Thierry

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmZMgACgkQ3SOs138+
s6HDbQ/+Nb4/XzRK2QUP3qBku8izstd6Np9t5erO7ZgQ0T/v5ctkG3ZZFMTjXRDl
y647hQphtVliCn3BzOyl51VzDN/vEoifIidUI8wkJXnm1fRb9tZxwzJHi/5iDgq4
mfbtN8sumBNp/YPDiGRR36te8qmf+BHPnuJ1diKb5foNFu871NkBWMzUBnSiDzcv
fLHluu/o6OJ7QdGYA5j145BbFlwtI0BNSq6PwGhDG+mZ9NQ4EX+EluJ2NS8fFN1l
4j7rY1qUMldmWSu/WEJR//jHlAUDOVvlLRhkVzHq06UD4OoU+cS2pTSju6cYQ9CH
daTJK+lNU0SFW5RfEtbMGhXLwXRXM9Z98YEXZcuLnRAN6U/gK8i7CHnC6mt89Ak6
LaCRACFyNiaeMC+ISo2F5pc4Lzujbxl7et9JVqgyCrwlVhK7XicjPklV/seXZYuU
fUQOryXR0d//mgo80+FR1lQg7KzsySQyXV1GsFMjNrmeoDniDmrO+3vVVyK3zHKc
EbLsrz2AzU1b8BkD88PjXJeu5EfG7ebo9LcOPa3p55EpZC7YPuRZxf2NmwsaBBYi
sNqkUl+/7Qz+ZihW2PqZYT25pzBysEeEIib9KwWM9yM3m9YlroU5zbftoBOxE91J
aqOAkN4KU6ixgOmh8Ymm5ky5ClfxMw/E2uJkPCmoBGEEpFmjb9Q=
=JLGP
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--

--===============0751200552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0751200552==--
