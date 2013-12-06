From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/3] regulator: tps6586x: add and use correct voltage
 table
Date: Fri, 6 Dec 2013 12:55:02 +0000
Message-ID: <20131206125502.GF29268@sirena.org.uk>
References: <cover.1386333697.git.stefan@agner.ch>
 <7c948660cda4684d28fa97f82295ab84f6ef658e.1386333697.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xugVLPVe/nLWwmIL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7c948660cda4684d28fa97f82295ab84f6ef658e.1386333697.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xugVLPVe/nLWwmIL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 06, 2013 at 01:51:46PM +0100, Stefan Agner wrote:
> Depending on the regulator version, the voltage table might be
> different. Use version specific regulator tables in order to select
> correct voltage table. For the following regulator versions different
> voltage tables are now used:

I think this is the same as the last patch I reviewed but I don't see my
ack on it?

--xugVLPVe/nLWwmIL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSockjAAoJELSic+t+oim9sRQQAIuMIK4jteEQOBORNmVx7u+a
CRsMw+aZCoRF7NL/BiE8AfTZiMKLJSQrhoy8Q3IeNAYktWsWApXhpIG7+fXWDAJ9
OwDXGIkE4zGjrZnwvIW/N/b6h4lvR+y8DRaoWhJYfhd2JxghXarxllECCbofywyh
OeTwf68kVzWQsVeD+Kf7LrYDxRuPRs4i2tA7OruKOvXdyvLdfTuwWPcYeelNPwxV
ePrC+cUX58NnmG+GfM0o64hT7InYa4GhBVRxAmBt8j8xPQMrUVKl8i5M+kJdxTpw
QXFkYdl1uwQyAxz/Ma5+McXfo6ePd7EuGK2e2761PBdMYHE8ZDJk2RkKUgn6sAid
G85hg2lkhL/0zDnXAozfzVu8enPmYwWX7EDe0DHmdPO+6D7A51n2IMABpmt2DzOe
YX/VQ/lwAVENl5DTQz0lgTlXfytYXx2rN4cM2gUVMF16in+JYr1HNDSkbPwR3qSo
3ctr07aPnyRa8yF3Gqc3s/QbOnL/9NohY/N36AbyZakOg9oh2wuS/t8S/ygnsjV3
u1RdxQUWM3uO61DGfRqFURBLxDfl+dud3JC6aiMrMVYOfsXbaqiUReobCeJx9mPj
IJaRH8F2Oqerzg087I+9zyxrL/uUkO0mnSR/5arjYstFZrJWW3YiFbckIJ+oZ+94
SxXJGhlcBzg+pw+aW1ss
=lXOl
-----END PGP SIGNATURE-----

--xugVLPVe/nLWwmIL--
