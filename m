From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Fix window[0] base address corruption
Date: Wed, 24 Aug 2016 16:16:43 +0200
Message-ID: <20160824141643.GE3714@ulmo.ba.sec>
References: <20160821085915.9424-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0217132208=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160821085915.9424-1-digetx@gmail.com>
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


--===============0217132208==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline


--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 21, 2016 at 11:57:58AM +0300, Dmitry Osipenko wrote:
> Window uses shared stride for UV planes and tegra_dc_window struct
> defines array of 2 strides per window. That's not taken in account
> during setting up of the window addresses and strides, resulting in
> out-of-bounds write of the 3-rd (non-existent) V plane stride that
> overwrites Y plane base address.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied and added a comment to the code why it is safe to do this.

Thanks,
Thierry

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvaxJAAoJEN0jrNd/PrOhQiYP/1mreALmPlalNic0galHs7Jp
VOu0hygkPk5Z+EWrnHytaerdDj/tl5gbzUE8qm4dmCvSi1NowBhcBjt2Ut+Fx+w2
dn3bfXIRyKIz0RUUtjIet4ys/vKY2Eb9r/mwt8SK8btnXQqhzK8fNfEIm8+sEMu9
xTzZHflw6a/YFl5D0bQzV6wdJhrqeQ2gps67VL2as3LwA3MwFCc15D5+xSdkXv6r
Q5cNyx3tE5ZUjNSV0UvwNWubLtqkY9/dJO4hPZt9bHF+DDzXYhqTCF4iuyhWQJiQ
Vz71dD/HHAu8HwBez5xteWyglUuUoHypxnx2TjVo2oxm1B4ehukbwwMDkjRKLWn/
0XGo3RhftSCeESCoUoju1NJ5XULhrg3BC4MfjjdvWJNvnMq79ORFtEiuBCfdHRMi
WOqauIAkxgdbTFjRKmdZHSQcK5sb1T1kJxsRtNprfeCp2hCIeoEIr4oXacfV1bZJ
WUyrSMD9BawonkEXY986Uw2eWMeGw1shVEZzlX1GpsfIB2+sd80xkbDpd3NbKYlx
Azl07isCwWS/jp99A7dH2GJTZQM/Jwy0W05zJrJCz4231i5R8q2yraQKM6gnBY9m
G2xzog61eAEFbwfaRbSM8+N/djKtwIFRGmmAQT6BbW50WLPl1ZbY49GiUbBlnQT4
5XeJHb8diA8gMRyN9Q7J
=5pUq
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--

--===============0217132208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0217132208==--
