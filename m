From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/3] regulator: tps6586x: add and use correct voltage
 table
Date: Wed, 4 Dec 2013 14:29:54 +0000
Message-ID: <20131204142954.GW29268@sirena.org.uk>
References: <cover.1386108712.git.stefan@agner.ch>
 <127fe07e18665f93aa8d7c03e03164f1a049ddb6.1386108712.git.stefan@agner.ch>
 <20131204121424.GN29268@sirena.org.uk>
 <0983a0fa016faa5674834afad4472413@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pkBzO0lo80FoaZii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0983a0fa016faa5674834afad4472413-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pkBzO0lo80FoaZii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 04, 2013 at 03:17:59PM +0100, Stefan Agner wrote:
> Am 2013-12-04 13:14, schrieb Mark Brown:

> > Acked-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> > I won't apply since I think that patch 3 needs to go along with this,
> > unless people decide the regulator tree is the easiest way to merge.

> I merged the dependent DT changes into that patch, so from my side,
> patch 3 don't needs to go along with this...

OK, though now I look I see it also depends on patch 1 itself so at
least those two will need to go together.

--pkBzO0lo80FoaZii
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnzxfAAoJELSic+t+oim9TaMP/110TNKCQcPjLEzwc4W7nDso
XawviW5KcVx+RJjeXnQJ6K9mZaZFVu+1ZKMPeZpkpWEGH4OThf2VvZXWMcVAMyJ6
Zu1fZIh3j1imSn29iMgTmT7sKL8InInckhczTQ6wW3ZXT8IKJquBxKm/UzWzEgiK
pxpNV++eJjAHBAmjIPn1/0cFh5z/vHNSfdu/1pFtUt56hLmDsaX8tuCLtjkwb952
4m6CVrM7EyeVlo1EjugxmfvGVX1V+2OpkuqnIUdvUbbSZhgu9QHfj7oCVQaDbASN
BtQci+zTiiGbmysnQzahO4BTPfhBuoqtvyZM3irro2dggz7I2SsBbqmumG2M/tj/
1EznhdAa1fSUt8AFpTmHIFVGw/+WtgbFC02mUG8nH4jhIZId1faefusOg8j1oDPQ
IabTjzYzv7JymXjkLmmIC5dXKKpF4gtytULaPXfIMpwjS3iilIi3+DTnpmpc0SW8
59oFBwVS7CMQO1ndaLsLqfUsXBSKqM8/2Sz1QH+nO7gy3zMBDV1bFAXHxfvntd0F
FpLlROKL3jcEoKTRNWOskSqugb+tZPtzF4fkilVJZhNdmLYpGWvdaEyOe78Mcaby
YmX7IUkZbcAK4JmxYMyLPCxvDLj/HeO9gJWioR/VN7iZyP31hIdgI3nwn5h8UJOS
sCHXH++bTw0698hciDhg
=ZFul
-----END PGP SIGNATURE-----

--pkBzO0lo80FoaZii--
