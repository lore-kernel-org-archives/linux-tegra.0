From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: fix clk_out parents list
Date: Mon, 27 May 2013 16:55:57 +0200
Message-ID: <20130527145557.GB9460@mithrandir>
References: <1369641279-6894-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1369641279-6894-1-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 27, 2013 at 01:24:39PM +0530, Prashant Gaikwad wrote:
> Number of parents for clk_out_2 and clk_out_3 was incorrectly set
> to clk_out1_parents. Even though it did not break anything since the
> size was same better to fix.

This last part of the sentence is hard to understand, I think you meant:

	Even though it did not break anything since the size was the
	same, it should still be fixed.

Other than that:

Reviewed-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRo3P8AAoJEN0jrNd/PrOhT+8P+wTNC5E1IeZNRPfVRwvYFdKb
UrrgVRdohf5tIpOAlFnRCStL/PgtiWPK+YOLdLku8UzO86VRVY2/c/GinRq93Ycc
lnEmXiZnoiQ7kVJw9mPds1t/a/sVIr07BN2F/cRBF71Dd2sdaWRCSJrnW6aFbTwr
HTIBHbq6S0evG1yEEcsUPWPUgFjHeEfhknbhSFYaj+snuHk9fNrG3MQYaTmSfyK1
YNk2Pi2TVad2O9YeTBqIF3SZYPMHk2y7/wCZMFfnw+5WOHftRR3VrE18o8gweRla
B4vikI5ZODVnxcQHf/+a25T728vo/wVVNbmawHT7LauYlsmUzfvbvaMmNqZcxm/b
s+ayt2nempGcM5z+PJ0GLp7FW0P2+uhYUGgVmS/48bKfT3Dh/T0DlMIO50QbFim1
QwbWS75yPPwCLeyMzh6fCII4nE5BNeRAS6xTwKN8mzawU1sZGFQ48at0X4eFdxI6
V7cHjYKWEoSqcpl9cSsrqJfYpbCiDQAP4LF+dctT7avBQ1X1MVtvJwuH+qruNI+X
41ebgcsZMZABgs9gV5TIP1wLYq8mi6KDOGi4S8+b9zGVjOLuQ2XwKqCCPsTBxrtw
tOOg9ocTtszyxGlmlqMcDbI1nPCAWzVFGS7xzobwwYsfqAYymLF31VILxWjrh2sq
vFbPCiIJFFvCDBV70RsH
=btuK
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
