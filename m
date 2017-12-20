From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/5] drm/tegra: dc: Link DC1 to DC0 on Tegra20
Date: Wed, 20 Dec 2017 21:17:00 +0100
Message-ID: <20171220201700.GC31757@ulmo>
References: <cover.1513783738.git.digetx@gmail.com>
 <816995caed0e5c0ffdc0a5c02aff57d555707135.1513783738.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0732717466=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <816995caed0e5c0ffdc0a5c02aff57d555707135.1513783738.git.digetx@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0732717466==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2017 at 06:46:10PM +0300, Dmitry Osipenko wrote:
> HW reset isn't actually broken on Tegra20, but there is a dependency on
> first display controller to be taken out of reset for the second to be
> enabled successfully.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Change log:
>=20
> v2:	Got rid of global variable and now use driver_find_device() instead.
>=20
>  drivers/gpu/drm/tegra/dc.c | 80 +++++++++++++++++++++++++++++-----------=
------
>  drivers/gpu/drm/tegra/dc.h |  2 +-
>  2 files changed, 51 insertions(+), 31 deletions(-)

Applied, thanks.

Thierry

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo6xTwACgkQ3SOs138+
s6GWyRAApVl6GLC4soUNTAvyaiN4oKKJaKvf43GdZI1UlnXeShkyDE+ZFLVvy9WH
HfutyfCbyBxP8vrUidPDXfLOTWNqnZRCpBVdYXWOe/s9Qhvv+1/RmEcMwMZYT3Y+
lvTmxk42XhdgbqZXk6lNQdHCDabTyBgaaEqs9zxZcJrE04iCZOUg5Shw0XQoFgSh
WEMjS1oWBsiD26IOey25jrLsdUBHFc3m9+aw1O02V5qnBlFkSUCqzxFg9e+emb/k
uByVdipo3n6q6FAoSRV8GtKa2OipchK/6RcspH/BrsIJx9pM8vgLc5uUrYLbU1E/
k3ZW+iuIlcl1LQYKQ/y8HnPddC6U64D9Oq1SnmLc/MjIYx7fT+cj1Y+AfJxSuy0Y
p99Nz6VtUegsVT2rkMaD+gur81ZLq7AMUGh1hzGXq8KhzYk4KS+6TS9NfQLVcUVB
I27EGomU1Dz5Ljm+G/ODeDU6JOT02ostOtORDc+MSmNrlMqMtGBtdnD6Rlu/mdBL
P3OZmjiV6fJwtqTVA6Qhbi1JWcWmvZxld43B/ITTIl01IutGsh1lmwI9UYqyJvzd
MFi8BxSeQ5hjSM9waLH37MzTfbVHNWBtQDtO9GzEAi+cRffAMfeNWM7c+Fvk9lnX
19986AOkOfjuspfteUXEQqbm3pc6/yLbLLPbvQxUtrD83HjkJS0=
=ciQ+
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--

--===============0732717466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0732717466==--
