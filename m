From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: fix error handling
Date: Mon, 7 Nov 2016 13:02:06 +0100
Message-ID: <20161107120206.GF28616@ulmo.ba.sec>
References: <1467526737-13591-1-git-send-email-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2116954924=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1467526737-13591-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gnurou@gmail.com, swarren@wwwdotorg.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============2116954924==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Content-Disposition: inline


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 03, 2016 at 08:18:57AM +0200, Christophe JAILLET wrote:
> This is likely that checking 'gr3d->clk_secondary' instead of 'gr3d->clk'
> is expected here.
>=20
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/tegra/gr3d.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks. Sorry for not noticing this one earlier.

Thierry

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIG0+AAoJEN0jrNd/PrOh1MwQAICV9rT3gdsMkI1DfQ63npKR
UQyihlstcgVEghGon+KKdBCNXORvWtAQic8/F4Qr/hjoZCttWATGlWq2XL3vxaNz
psNgE9PTFVFozDDthUrJoqKAaBvkK+osNn0+sqvnhNA6GYXT4KdYyBjT2MzO0BN2
/aVJcsU0a+GKBgv1+2nwFI26fdqwYit2xCED0WSaj+z6a/XeamZZrg71FojVFIZ/
cvHycEW67LbEDoOzw5c3dqE/IEECJ8zvtR3n7hTk4y8XctGUx6BDnFhP5pL/yM7K
tdSJXCsmS+o2nvdYCtDwWH0ppJ/HEHiTvl0B8T5QdhU01btR5YRfxv0NVgLCKIAz
AaTUYd7gmWVE4QFR7jmWFKxFCDUiOlmAV7k1YMrh1l5Oe17bdDWe0nTCoGTP6VEA
N8Nlf9QG6drhksIDK0Dkc/I8YbL21GLP4fTBFSl6dfBCuZfFgFO2rkevHExavg3b
HEXJVuZEdJ1CsIFlYO9vBXJHY56FDeubq2iSAOHIstW0ICkbLMeKvbRZKBKqIRtl
0hmtb5qUm8vcsfLF7AztPetrnicKmMki4jNsXn8fXukGKLhB82G2JyZRe09sBZQr
urLliYQpdb/HHZ7kcxpLSN2XE8all1Tebg1T7M35iSLa/64NJPJ5+g67DZLo2Ct1
MDJYQDVXQToQ87kZ9u5m
=4ctp
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--

--===============2116954924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2116954924==--
