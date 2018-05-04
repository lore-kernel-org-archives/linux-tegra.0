From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/3] Couple more DRM plane features for Tegra
Date: Fri, 4 May 2018 17:17:03 +0200
Message-ID: <20180504151703.GC31229@ulmo>
References: <20180504144000.8597-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1846059972=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180504144000.8597-1-digetx@gmail.com>
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


--===============1846059972==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline


--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 05:39:57PM +0300, Dmitry Osipenko wrote:
> Hi,
>=20
> This series improves DRM plane support by supporting zPos on older Tegra's
> and enabling plane scaling filters (up to Tegra210).
>=20
> Changelog:
>=20
> v2:
> 	- Addressed v1 review comments.
>=20
> Dmitry Osipenko (3):
>   drm/tegra: dc: Enable plane scaling filters
>   drm/tegra: plane: Implement zPos plane property for older Tegra's
>   drm/tegra: dc: Rename supports_blending to has_legacy_blending

All three patches applied, thanks.

Thierry

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrseW8ACgkQ3SOs138+
s6ES9hAAlid8YD5fWzqI2uBb4wrJaDFbNfeXR4yMDvUnYaks4bJ5I1/1OGJQnwRB
4O4uIDBHWXWhPt/iwcjgESmzkO9ma/pezpAw5220pEHSA8taHFxxnYhkR5VVGvBm
rFkRSwyKImYP3WP03E2/r7S25mjEBerWhbVeStGtOqk/KMgwUrPAWYSwKWV3gxo9
MVujAyvSREo1QcAysWiDse6pE0eUiM4TTZwGVVGIOyoCsZPtfirnWVmHDnLQ1ezo
Launis3VXV0Pmy2yUWjHB/don4snqNy6FYyN4iNk+a+CXkSLnt1t3uNu8fs7N+Or
97DrF55zUvKQobQTll7ttCR3sEQKOIqGW/6aZIInUcqJNoOKNpi1ThAgWh57u2gV
Co3FgTVHxBV0infzDczZgm8BxqVc8ZrK0xENxvYNquvRFcxPMliwu8ic/GdtTnMW
82x+opGBHmcYQCTgxUM0kIUB5qBS+4WsZbmjI/yxK3RAbQi4cyqkwb6Y/F2B4BKw
2Qk0z70LTq1z1tIeVCJ5qqN6QcpMQmURFsDNTiajbo08CnCO+gAYuOfvxZbOF9R1
87P0QUVLsp+uiy8n06LtwBvsAXQmTPUB2RAqkVzArmfwFnBRnlrEup2x7uFjCglJ
3FdmwuXXMlL//FfZUe8MOtczT1iwvRjfdtAHplHG1gFxL//c/9Y=
=nCtU
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--

--===============1846059972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1846059972==--
