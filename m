From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
Date: Mon, 18 Nov 2019 14:23:57 +0100
Message-ID: <20191118132357.GC2246533@ulmo>
References: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0555400056=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: zhengbin <zhengbin13@huawei.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, treding@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--===============0555400056==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 07:46:10PM +0800, zhengbin wrote:
> zhengbin (2):
>   drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in
>     tegra_bo_dumb_create
>   drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in tegra_gem_create
>=20
>  drivers/gpu/drm/tegra/drm.c | 5 +----
>  drivers/gpu/drm/tegra/gem.c | 5 +----
>  2 files changed, 2 insertions(+), 8 deletions(-)

As I explained in response to the same patches sent for other drivers
already, I don't think this has any merit.

Thierry

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3Sm20ACgkQ3SOs138+
s6Evdg//QOlrbxFxraVGzdTmFWlFsmJ6OwQSOGxufr2gbH2Cpk9BOiAhspTui/RH
GQYR2dUFFihpoXrC3PUVAASsg05R6cinxYDRps838ekBdHd3hSP/jtNpnYJ7+A0n
7nf4+j43HPLQ1PfHGx4UQzyzuorNLy6q3JrUNDaumU6EO9yQYW1i6z6pbaEY74/I
tcFm5eU2iSY9yeIMJcYdOHrzpiKF7w4Nq5sy5iY1t949VMj3dJv101gHSoK2cZ5D
3iw2aYg5rhsOmflfWlktmwyT1eCYINB6NveSvWKRKo/0cHq2xg6jlJJMBnG4dioa
nmksq2eQwXLrktKjvlQ2Bz8E5Sj4SDyHIFWERYqdWoPOPhuNiawrUgY67C6PDl9L
Qm91wBibK+ih9hHvZ9NHmBJofU01p77PFN4MDF/j9im7hvfSYfqwN7f+C3hhnq2z
NU0DYyRG1TLpHNLItF7LVEJ+1NYFsoafDKuogNaQV66CSMEZ33vZkLHTaoKcKZrE
0XRGISUHCf5Uw6NKTbIml+l8/YlBoHU+MaOTuBOs1NPFKko3bN3ZIHyR6TNh2gg9
Veb6pq1LRp/ZqcgqmcnC3AOmTIG5F37kNtE0f8YXdt5jrvdq8UrHlVsS4DD6rEtq
MkT7umxMr/xTulGBLXPHiHCPQ836zY9oCUkbLNlDZdx1W93YTKk=
=4hdT
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--

--===============0555400056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0555400056==--
