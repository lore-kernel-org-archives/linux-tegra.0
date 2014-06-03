From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] arm: tegra: enable igb, stmpe, i2c chardev, spidev,
 lm95245, pwm leds
Date: Tue, 3 Jun 2014 10:45:37 +0100
Message-ID: <20140603094537.GQ31751@sirena.org.uk>
References: <c5522b0efcbfc7690dcde6aaf78b9dd568f99604.1401665237.git.marcel@ziswiler.com>
 <39a8704a4c8170d6b0620a1e5e44042eae6d8810.1401665237.git.marcel@ziswiler.com>
 <538CA24B.1010602@wwwdotorg.org>
 <538CA635.4050502@ziswiler.com>
 <20140602221627.GP31751@sirena.org.uk>
 <538D64FD.2010909@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/YnR2r17TIEndSCI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <538D64FD.2010909-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/YnR2r17TIEndSCI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 03, 2014 at 08:02:37AM +0200, Marcel Ziswiler wrote:
> On 06/03/2014 12:16 AM, Mark Brown wrote:

> >Your DT is broken if it's got a "spidev" node in it, you should be
> >describing the hardware not the Linux implementation of the software.
> >It would be really nice if we had a good way of handling this but we
> >don't yet.

> I strongly disagree, it almost perfectly describes the hardware. Unlike on
> I2c where modelling a bus is enough to allow generic user space access
> unfortunately on SPI this is not enough as it requires a specific
> chip-select as well. This is exactly what spidev does and maps to our
> hardware perfectly which has one dedicated chip-select per SPI bus on a
> dedicated header which allows our customers out-of-the-box spidev user space
> access to almost any SPI device connected to those buses just like with
> i2c-devs on I2C buses.

When you say "generic user space access" you are describing a specific
detail of how this device happens to be controlled with your software.
This is not a description of your hardware, it is a description of how
it is controlled with your current software.

--/YnR2r17TIEndSCI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTjZk9AAoJELSic+t+oim9kfQQAId5SYVghKAMdrMjnj3g8YKF
bbtMGzCSak+usaY/5XIFb9hnSMhrpYUwVYJFyBDk0c5UEFH+7yhoVSYDqGPW4iaO
4VumEqZVgs+5W+4qvEmfYSKdgsg5La8RpeklfdP2W+Znq3knU1usOBjUAzxiZxr7
6D7jgB+QuUohFEQ4X4RLBFiLCT0Bdvkhg8snIFbEmsqiE1TC+ceb/UAlkfohH85B
7OtZ0Xtki0/ZHYlBq5mQ1YpCL6c3XZouYThAkn2dDWQscd4IN8lznPe9WQH4f7Pi
haGXiq6vUisDhaPjnEXiCF+u13uzJrnXEbC+1/EI4yKUPj5tI4TTU/OyMowt1RRG
DgKIV55pEGRuZTV8osnp0LIfcclxnADau2/VtrGXHK+lZiKAJHAJy5njP+qh3vtb
XHOniSzZY2FVz1L2K6O9XdeXtOfiAE83GcWCYa+tmoQIDYklY+eiLzZQa9n6vlq+
LSwGEP+VuBfoE44BVXoHXjt5oYv2f8Pox5SdP4LtzY5GljrFExyXk4VpULgpIkmN
3yO7ZTcmCjaokONzmjssp130muvGa2Nqy/NJBu15K1q+ULKGoYG8Z+kZaKdVA0Ua
w4clx28Po9+37Yd+PGrtadt+A7oZ9y1xpiZkoLYALbn/qldLJzd5O/RaH3lZdfD8
WNi9HLWAQMeGIwJ3KIR2
=xviU
-----END PGP SIGNATURE-----

--/YnR2r17TIEndSCI--
