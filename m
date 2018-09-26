From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3] gpu: host1x: Detach Host1x from IOMMU DMA domain on
 arm32
Date: Wed, 26 Sep 2018 17:12:16 +0200
Message-ID: <20180926151216.GJ12980@ulmo>
References: <20180830001247.29257-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1321426755=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180830001247.29257-1-digetx@gmail.com>
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


--===============1321426755==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5cSRzy0VGBWAML+b"
Content-Disposition: inline


--5cSRzy0VGBWAML+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 30, 2018 at 03:12:47AM +0300, Dmitry Osipenko wrote:
> Host1x is getting attached to an implicit IOMMU DMA domain if
> CONFIG_ARM_DMA_USE_IOMMU=3Dy. Since Host1x driver manages IOMMU by
> itself, Host1x device must be detached from the implicit domain using
> arch-specific IOMMU-API.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Changelog:
>=20
> v2: Correctly placed the detachment code, now Host1x is detached regardle=
ss
>     of the firewall state.
>=20
> v3: Compiles now.
>=20
>  drivers/gpu/host1x/dev.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--5cSRzy0VGBWAML+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlurodAACgkQ3SOs138+
s6ErxA//YIMmHuMOIY2rKugJUzxpmzPHSGP9Jhoplsk1uhzsy+keyGYfRUtWFDUy
uKd+jfSmqkGVncASggoWFRyfcpZZHJRQJxb0hMUqVboYW5HzQdf/HUpDGkKrJc4X
AAHjgZ9uMERzPpX6wFyIkdNRqYYsoLME74NK4VZ1bhOirNcFnni64cbYJjgbd9Vt
mT8JyqRtNdZPzB25YtL2UW1c2f1sk2JhDfnhZFs/EcCIr3unHp8XzYLrqovPdOpz
WrdBfYix9WFdzseqC3faZeBPnoo+1HdRaWw24rUaOUFdm7XadeWJNvULRBqZeglw
vJaUpFYOnbPmlmYvXY2ehwamoy8H5pyTeUUep4LwH29xDLr/yS4i6r1vqtBWsXtT
KeQM/aU1C6mtbwP3U+3SiAuTwSvMVzYarKR15ah5SBpVUSQrXxY5sN//2hVcnFY4
TTwqwQ1xBsycIUN4Wt3AdHWaBmhbgPaYV00MMX/cm7cpBqqCivbtCDNKUtW7nmIp
RW9wiLfbX3pBO0jkL1Ii33bXbT+E7z89Jo4SXD7MX2VUg1fYoKQI8u8UhiTTtD3e
UZiUX/xoHsxioZadPLGTU9cokRj/6qaPNpj5Z+Bid2qipExpF1IojebG2rcmrzur
cq9ZHNeOrcMJnfuIG8d4tcIDxyRY0QJ9ZOp6kclIvhVvzF7bK9E=
=ex+m
-----END PGP SIGNATURE-----

--5cSRzy0VGBWAML+b--

--===============1321426755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1321426755==--
