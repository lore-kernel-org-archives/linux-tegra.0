From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 5/5] drm/tegra: Correct timeout in tegra_syncpt_wait
Date: Wed, 20 Dec 2017 21:17:29 +0100
Message-ID: <20171220201729.GE31757@ulmo>
References: <cover.1513783738.git.digetx@gmail.com>
 <c7314f8a7085205695a69a7e248161d4dbe326c0.1513783739.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1222010518=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <c7314f8a7085205695a69a7e248161d4dbe326c0.1513783739.git.digetx@gmail.com>
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


--===============1222010518==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline


--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2017 at 06:46:14PM +0300, Dmitry Osipenko wrote:
> host1x_syncpt_wait() takes timeout value in jiffies, but DRM passes it in
> milliseconds.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo6xVkACgkQ3SOs138+
s6GBOxAAmstKwYeg49mtGekJg7PwvodgdXIj/zW6iMKQFsBASF/TBPSOCPhxdWQL
hx4XgcXKI5MW/kAo3PoSVfru3BxXbeDIAkUMPLByhS1S10BNAlieuoP0WCDEAYRR
rxH2qYBNMm0Z0SzUqxeY2TpVY+GKeWVffUrj1iRl2o3BtatEXIyR01J5bld4CyCD
kTJw7IkZ/UQGct8oZ9jImMb91yfIFdVzcH92vgciXT0FOUTMPvlQ+/Z7OSP75nWC
f2uBQt8UJF+n0yM3IFpVuqpc7iv2XpkCzFf+LsnwzjzdtK4z9ID9FOjiYqxgivbA
7VfvRsu6Wn7AxPrPkkFRiQLVcIJWfI73NUe2uG/svPGYSZxpPBGtRkFFVtwIPWFM
IhpMmIEsi0Kbg+5jS4J5IQuyc1nP+z2eUK206ZZDaZzM49hQPLYoe0H1rOjvHtEF
6Juh2JXi6AmmlZ9BqNdon4IuKIxEakzPXcX7az8cVjm2l1DZjr9Zc7hlhTHHJyRk
7falG3DbMqguO8Tc4xMYfDRvltNjPoL5QCEj0Atxsn5oJAFdjyjB4Ys/yabl3d7P
Td7muJAz2OB1eYZTh6uvyIdLz/r20mF/2JuEnklYymIW2v6zPEQf0Sw8RsG4PBuF
zdOEL6lPTXLHy5O+2zEAk0Qn+zcqQz/KA+NUyDNGPBbCsf8feVM=
=xXcx
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--

--===============1222010518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1222010518==--
