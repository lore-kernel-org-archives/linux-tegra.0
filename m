From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [patch] drm/tegra: checking for IS_ERR() instead of NULL
Date: Mon, 14 Dec 2015 14:38:59 +0100
Message-ID: <20151214133859.GB986@ulmo.nvidia.com>
References: <20150817143703.GB23820@mwanda>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2022520880=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150817143703.GB23820@mwanda>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============2022520880==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2015 at 05:37:03PM +0300, Dan Carpenter wrote:
> The tegra_sor_hdmi_find_settings() function returns NULL on error and
> not an ERR_PTR.
>=20
> Fixes: 459cc2c6800b ('drm/tegra: sor: Add HDMI support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Sorry, this fell through the cracks. Applied now, thanks.

Thierry

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWbsZzAAoJEN0jrNd/PrOhOm8QAKh66eTRu0YP1sQ/iZgwuwP5
70YxzLVsv2csPI93qb0/xGttxzSyVV4b5WNAXJIkK2FrzEwF7EtdXr60vy3MB1Xy
c4zImHL2cpcMhnJZK+sXAee2TmEAxf+ay8OOVPVQ8HUWO88AOP1syceMLAUBxZsS
tFUlgdTiU/XPndAJhFNQpIH/qwYKZ7X/pNfwkgq08EXTgOLXVpJBmOOt12wMRWwj
mgT1dulhBb0yc2yrEi+H47VLBKZiqutKu86BjFybwr7jlgm/giR7imwUkz/Y4p4G
S/WYXc4F+1Hu3X4W6HVne8ixX/fPtq5vhIrPzYaDlar8QHUkWLcIq15JS2AJI04f
eqIPZTskX35dAgFbps1qsSveWLpQ4EV8o1HF103NAL6YBwmQs3zw1KDC+f39Tqdd
B8yV/rNHzKe3wvciiDDZ4qAp7DCI2iwCr2+lTgj8Ky9PRcbR7nKnl8KT7LlXABtK
/vUQ53Ue9sf/2ZfjYpi0cX7meQyvzm6QHX0ziZ5ICmpYQp9bTZpnt3uCZOxHzgcE
GD96B7XSrQdqjS442VeMa1sv8zu3CPw2K0NBfccfepHTGuJRLJUm81fMMQLJRPPF
W9QxqC7CiHwNOREk0kpUzzMe+5HzbrB2pGUnsHrlS+XKL47zw2k2VGkRoCTY6LRO
UekygzukSK9SuI0Hk2K+
=Ae9u
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--

--===============2022520880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============2022520880==--
