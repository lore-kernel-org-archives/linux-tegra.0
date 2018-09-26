From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: Detach devices from IOMMU DMA domain on
 arm32
Date: Wed, 26 Sep 2018 17:24:25 +0200
Message-ID: <20180926152425.GK12980@ulmo>
References: <20180819142421.22567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1626964683=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180819142421.22567-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1626964683==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pWJxWxNlJUNgDlXi"
Content-Disposition: inline


--pWJxWxNlJUNgDlXi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 19, 2018 at 05:24:20PM +0300, Dmitry Osipenko wrote:
> All Tegra DRM devices are getting attached to an implicit IOMMU DMA
> domain if CONFIG_ARM_DMA_USE_IOMMU=3Dy. Since Tegra DRM driver manages IO=
MMU
> by itself, the devices must be detached from the implicit domain using
> arch-specific IOMMU-API. Note that this works only for arm32 and not for
> arm64, which will remain broken if CONFIG_IOMMU_DMA is enabled.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied, thanks.

Thierry

--pWJxWxNlJUNgDlXi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlurpKcACgkQ3SOs138+
s6EBQhAAwlyLVEmclgv6zDTns8fWC0dpQL+cSCtgJ69xwuf1i1JPxYr/1Wzat2on
5bkEn1sp+nhszs2Ra/Q9e4wKE27otPVruXY6QX8hhM7aU6oerJF0BnbGCW84pKfg
2DYxISrQ3QhdN06YkguqPbIlzTLIPL+SmE71n+n/+eKGGuVjbH0cZHaH9ulGZG18
/ed0ZPZTa5ihllD+LNiCt7Ej8Hb5Yd+A8NgcqXLFnaByWOjxp+dsUrKcrKFStaqX
bpO/sdyuEYeWTvaRLhBT/kw4sQRcdaGyJpRXQD+MuStBxO8lPYEWHyRrjd5CZwta
oclaMfvbKJ1TzFd4hy3WwZFtIrWGSFK/6MU94JX4si7xeZ0uR0slRRrs/TV+okcb
RMWkFQk2bWr6J2Wq/1vCmM2Z7WbfafvSvqyOkAMepsdb+SVjPkM8+9muxFa8wm5G
huwdKEd+oRvE1wAutTGzYCvzzyGPEsaPGTikl02PQtfvzOscMM8bVPdXsl4cLekT
WtdzKCJGIerXsvFQSBXqnzP/K18EXyDJXP1oqWJUOoCgDmoluCew81Hgmga50lQ/
+DXTXfi0xDNi7aedcAhqLTPIBWLRJm/C5i0nr/zxil3FhM8ggPnh0wueTBib1YnQ
0dq3UmrjHHTOSXOoV5VjSra059hmD1KPjzY1OQ53L45JOS8aXVU=
=wjr7
-----END PGP SIGNATURE-----

--pWJxWxNlJUNgDlXi--

--===============1626964683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1626964683==--
