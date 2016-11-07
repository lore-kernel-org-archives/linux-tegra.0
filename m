From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: sor: No need to free devm_ allocated memory
Date: Mon, 7 Nov 2016 13:05:56 +0100
Message-ID: <20161107120556.GG28616@ulmo.ba.sec>
References: <1474747650-10306-1-git-send-email-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2021062636=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1474747650-10306-1-git-send-email-christophe.jaillet@wanadoo.fr>
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


--===============2021062636==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vJguvTgX93MxBIIe"
Content-Disposition: inline


--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 24, 2016 at 10:07:30PM +0200, Christophe JAILLET wrote:
> 'brick' has been allocated by 'devm_kzalloc', so there is no need here to
> free it explicitly.
> There is only one caller of 'tegra_clk_sor_brick_register()'. This functi=
on
> is a probe function which correctly checks and handles the return value of
> 'tegra_clk_sor_brick_register()'.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/tegra/sor.c | 2 --
>  1 file changed, 2 deletions(-)

Applied, with a slightly reworded commit message.

Thanks,
Thierry

--vJguvTgX93MxBIIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIG4kAAoJEN0jrNd/PrOh2ZYQAL89mTzE1GhR9KB8BmZa9B6u
FppUfMAV7+PYZkkM7vuQ9qzikuwlABIQgdJRo+GiClWx0dgZWa9/UxPbsPTHHw9s
I3COk/3pN6lhzIcP8i7TaIYjALxd5r2cdDXRbH9JGr6SV50kCWE196yCqGRMP0e1
GABoOt9SBOJ6Iy1FQ7y3jBe4cMZlKMOzZ+E2bInAN+O01JgP8vUGsUE0xC9VcBEy
uIHTBn1wGXB8f0LXxYf9H1PiVFlxWNiCWcqPNOdLVl93W4tLO6tWDcalFFg0hAnA
8ReuXQuH2u/hbJ93cGT3vmqsBEhySU2v7caauRWrZaDQiKkS2gaJof6BQw9Y1GCt
amxh5iK7XxWHu8Q1DciIZik/1vg0+f4GAQkL/xZcW3ikcYfk0pPWzDiJFJ898oDF
3FSiSrKOQcTPbH7MqKuoI/B57yJ6qnSPHfuiIktYTkncq473eRHkCFlRkYdQNfZy
i5vcH+q3ycj1i7Yc0NL0bTmnrAqdcf2TvHVOyqdR6fgmR/Jv3IZKDTAvRahTKRi/
nygt1IHdJimBHDGLtunQ9E3bjUC/UeDFcfdcYTfKMIYNEZEcbq5VoQPwfNXr964I
BOzkZS2nwy8oGN6MVCB1ZMNJxPy/wTnjuOZwEQdZbGum95c5wpZTXnrRxkK/Fskj
FLBGR6rw4WjLPYiafk9G
=V4xY
-----END PGP SIGNATURE-----

--vJguvTgX93MxBIIe--

--===============2021062636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2021062636==--
