From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: regulator: core: Request GPIO before creating sysfs entries
Date: Wed, 24 Feb 2016 12:48:55 +0900
Message-ID: <20160224034855.GP18327@sirena.org.uk>
References: <1456129440-28143-1-git-send-email-krzysztof.adamski@tieto.com>
 <56CC5D1E.6010101@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+/lp9f/wU8jZ28Xb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56CC5D1E.6010101-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--+/lp9f/wU8jZ28Xb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 23, 2016 at 01:22:38PM +0000, Jon Hunter wrote:

> It appears that commit daad134d6649 ("regulator: core: Request GPIO
> before creating sysfs entries") breaks boot on tegra124-nyan-big in
> -next today.

Please when reporting problems provide some concrete description of the
problem you are trying to report, for example a boot log.  This makes it
much easier to understand the problem you are trying to report.  I see
there is more information further down the thread but it's good to get
this stuff in the initial report.

> Looking at the change, it does not appear that the exit path has been
> updated correctly and so if a regulator is deferred then there is a
> crash in the exit path. I am not sure that there is a simple way to

Again, please be specific about the analysis you have done - in this
case what specifically is the crash?

> workaround this because of fix from commit 53032dafc6b9 ("regulator
> core: fix double-free in regulator_register() error path") unless we
> move regulator_ena_gpio_free() into regulator_dev_release().

That seems like a sensible idea, do you forsee a problem doing that?

--+/lp9f/wU8jZ28Xb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWzSgmAAoJECTWi3JdVIfQOfQH/AjUVB18zoaqwO5dzISlHreh
zNjmdjkpRjuTqopL1dDy6pEZwxjVLKjmlKR2Wn/ffsMTzWJyKv5i3A31DqHil5AE
oIBW9Sod8sXDne4WTrID/uaNAwvK84UMAJnBW3KkpQDUc60tsJzq8PJ4wA21SCG9
TPS+yz3Qp62ot+I52iXYU7rYHoZ4+PSiYdf/lxRATT227fjVRw3vd8ejldwe52Yn
eTvQRZVhXzMqirJB0fxQ9CiXuuiA7ixurVIJorMoS0sEX+FfG4/Nk6qmKcYA0X1i
V1PNC2v8nyilGoV07i0DDP7KMepIAc/kgA9q90euTqiSE+opuf0Wmuw8k1653f0=
=rUha
-----END PGP SIGNATURE-----

--+/lp9f/wU8jZ28Xb--
