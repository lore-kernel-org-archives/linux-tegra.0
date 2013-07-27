From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] spi/tegra114: Factor runtime PM out into transfer
 prepare/unprepare
Date: Sat, 27 Jul 2013 20:18:17 +0100
Message-ID: <20130727191817.GK9858@sirena.org.uk>
References: <1374924187-29715-1-git-send-email-broonie@kernel.org>
 <51F3BAD7.6080303@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lvRZZFMRNRLg22E3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51F3BAD7.6080303-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--lvRZZFMRNRLg22E3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 27, 2013 at 05:49:35PM +0530, Laxman Dewangan wrote:

> The reason I kept this in transfer_one() is because
> prepare/unprepare was getting called in atomic context. But after
> the change,

With something like that the best thing to do is to query why there's a
restriction and/or fix it - it's a fairly obvious thing to want to do.

--lvRZZFMRNRLg22E3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR9Bz2AAoJELSic+t+oim9aIsP/070l6fyr7DiS6U/5JjLgIpa
chulvrRE5rhF9/JIhpg4CrnGiM/V5VB4X9fJd1OwSBgEXoBv28dOQMkGCsa1PRDf
ahHrwPh/CJoP3FB4Lg8X+tlHzHq3yiSDASWCKtsKTiwXiwJRe0fsT40sQtw5UG4U
sQJ+rhwCeZ5wzuVQFOBgvGztUWwkiYaI9W4G5MLkdDt+hnlfL4a/D8+v4JuUBxdx
+1QFx9rMDxZp2fq4m8VhyiDywNcsp8fMiaDGK8M3pUo7uiH3jkcJMegi5DOmtuC4
iPlDcfat55U6ZizRlq3WSOLYV3ZYoTsoETeNPXVH/5s0+CHxr4sP4Z3NuEp/nJV5
NnHwKv34PBpamdbp/mdbJPTWXYLoN/7PJWX7FX5ff8yo2lKuAk7qOaTTx6G/oxAA
X/6DBQyk0W1XpAr88WsPdn0xL6MJ/z/YIB8Qr8cY4hyb4HObjWUWJBhaLTq9do/M
JphzKtTaftLEzmhKM/bgjTEKkJVs2mErPpkc/2fcat1+lIJEnRtFrMo9j+lctKt/
m1xkh3iD8WM4FlzL9z1YV/v3dBY7pDFc8q8nLzROSIEmttt61LMBTu34/OvO4qhp
nk4Kyidmk0OTC+6rKjmQ1mD7/LWhA14sj367Xm4UlFC2tL9bb+VDLGwDWO1qQ71X
xsMRH0NKcjXIxOYsxSef
=qbFJ
-----END PGP SIGNATURE-----

--lvRZZFMRNRLg22E3--
