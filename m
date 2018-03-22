From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: dc: use correct format array for Tegra124.
Date: Thu, 22 Mar 2018 15:30:46 +0100
Message-ID: <20180322143046.GB5853@ulmo>
References: <20180320091144.22421-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0245642599=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180320091144.22421-1-marcel@ziswiler.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0245642599==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2018 at 10:11:44AM +0100, Marcel Ziswiler wrote:
> From: Stefan Agner <stefan@agner.ch>
>=20
> Use tegra124_(primary|overlay)_formats for Tegra124.
>=20
> Fixes: 511c7023cf23 ("drm/tegra: dc: Support more formats")
>=20
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> ---
>=20
> Changes in v2:
> - re-based on top of today's next
> - added my ACK
>=20
>  drivers/gpu/drm/tegra/dc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqzvhYACgkQ3SOs138+
s6HMSRAAsAJtTuoQGKKJRqLI27mnGs3elabEL5nZAHkSPAC9HUNvRdR8OjyxGBZE
KBum6wWCuYbiu615YyoJwqj1DeGlp5YXFfiF5cWyvZUjL1z7Y1Nx5qjrTE0SCeuB
l1x28zKv2t2KPAzRPjijczNjbhnhPpoHxD3HYvzSoYF9xW1LM7Mff3eFyWKMCyzx
UNRQ1oR2W5HOrN9nV3/NqWRwWuE/cfrQE3zNDyjR/87WtdzJI+jwOZR/X7fa2a/3
PbY7kytM3fFLaYPQnh89Z+tboOaqvJ2a46ugfqu99vvhZqA7hmKpyic6O7IJWoKN
T6jn/LTlr9AFIcWmNDxNCxyH1xkOY2ephoxssTqUQgEA/ow1AB9zqMle9JeGg+X0
Xjn1a8yOGI8MBRM3Z4zFxk6aI8LeOtbkhL7Az6mgZq9H8dgxM4YJ5OUa6+ouaROA
988xAyFq/HR6cskeHYcbZDQoMNSkMICnT7xALKVHSR5Qeb3wCp8Q0pDEn7vZtOlF
IM2rSnQvAtwd4Zpyp9NMW6onEct6oPvmsJAwkL0Lp93GP2f8+0Zthdy4Sk4ju2+5
JlGlJxLC5LpsSlTUiRQRgqzl5FgyoiAmiz9HEFIb+DevgVWnv5LgOBhg78L0gyU8
PxIvXE4MEULgGt/EiClfOgVke/lgFp1m9SvmNcWK4X7vS/bnF4M=
=GEmo
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--

--===============0245642599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0245642599==--
