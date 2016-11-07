From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: dpaux: Fix error handling
Date: Mon, 7 Nov 2016 13:00:27 +0100
Message-ID: <20161107120027.GE28616@ulmo.ba.sec>
References: <20161028090945.11573-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1735054371=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161028090945.11573-1-christophe.jaillet@wanadoo.fr>
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
Cc: gnurou@gmail.com, swarren@wwwdotorg.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, treding@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--===============1735054371==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Content-Disposition: inline


--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2016 at 11:09:45AM +0200, Christophe JAILLET wrote:
> 'devm_pinctrl_register()' returns an error pointer or a valid handle. So
> checking for NULL here is pointless and can never trigger.
>=20
> Check the returned value with IS_ERR instead and propagate this value as
> done in the other functions which call 'devm_pinctrl_register()'
>=20
> Fixes: 0751bb5c44fe ("drm/tegra: dpaux: Add pinctrl support")
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIGzYAAoJEN0jrNd/PrOhI2UP/j4EmLh7ZP9DT1pWEL3CSTXI
rAuy26S6W2+qoMMDfjcOspcVdbjZfN2jL+keiWY36cPuuEfsAWd8oeVVGYYypxzl
syl0hgSnm3GgY8KpEnoZHTrylmJK4eiHrD+HrZfs7TOnl8OooF2/9jNDJQH/WVzQ
twGe32xMxxTVowdgdDwFw5eevcziN+OUS1PanoVs35D0ndkPbc4ayiUveiDCoBZg
NxRx/skn6hS4V2xkbAikM3BDxTY67KH2TrNly9tg9li0UHkx4J2pZag2Tik6yO5v
5sWPHIYpqq/X5mdE2NuBRqanl1GXpXN9Qii0/aYfszdbYDHwKHSUm4Fjutk8+2si
kwG5XhOxRSwmthwnbZ5k5C/iIt5J4fh7sS7n6myjKkBrqQuVAOwKrUTUyWKXUIvs
hni2slNUJ1S+6Hr1mg4BmUJOffucf4m0nDJjm6VMG6PsuzRY2Ftjyrfby088rda3
9Pm/QJPMKR5nNjZew9OlEyj/KsPgu9jf10c+2HYcYRQ+ytzrj0mTU+rAiN13uoEm
HkzoHgoKCnb0+/YqEN1y80eAvddlFjgScwZ9WgTQn4/Nvea+CSLKJ9ltSRFfSMXI
pwWLw2FBQQbcQfd+wSKFQciGbtygAuhraL4wKu+aOvm1Irx1Pjj46DW+GWpP6sik
shCSNJVLzhw8Kb4g9rh/
=sMnB
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--

--===============1735054371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1735054371==--
