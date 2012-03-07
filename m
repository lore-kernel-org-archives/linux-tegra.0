From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] i2c: gpio: Use open drain support from gpio driver
Date: Wed, 7 Mar 2012 17:31:57 +0000
Message-ID: <20120307173157.GT3107@opensource.wolfsonmicro.com>
References: <1331127494-6913-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sDhuxz86kt5qlkuV"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1331127494-6913-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--sDhuxz86kt5qlkuV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 07, 2012 at 07:08:14PM +0530, Laxman Dewangan wrote:
> The gpio core driver (gpio library) supports the open
> drain pin handling. Therefore, it is not require it
> to handle in the i2c-gpio driver, just require
> to pass the OPEN_DRAIN type flag when requesting the gpio.

Reviwed-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

but note that this is a new gpiolib feature in -next and will need to
either be applied via Grant's tree or wait until after the merge window.

--sDhuxz86kt5qlkuV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPV5t0AAoJEBus8iNuMP3dnFQP/iT707PFwE6bw5wb5a0hsxrq
MSj7aOItxpYJWPxwddVJZkgmluH+P1kzqiINqNF1sIQ7FfS5qJ3uZkwu2D2bzCHo
F+yVd4X4zYTP15tx1Z2zZUipFo15XhcB0hTSrqvUPuyzVfWl/+jS5rJCxdWncVs2
doGgevvun2nM9kxmXCIR9TVhCFjQXHl6ySA2hzk+uuNuzBo9gU5OgoYpNpSiUVj7
L5ZEmo1QzhZKlMWSxFWLf5ySleI9vSqTDIHzDumse9B6aE+8MEC7H4281+VD0tHv
mI3O1YTn0WfdHAMqyYvx2hd8s+t6UP6/Xe8tYOoPob8c9JxavAVYgE2ad/RLIpT8
8g6S7fZa0uB8St9nac9hAVEJh1NIIIqTnWRhCuLu/T7j1MZea4fc1Tvc5bUEs25H
FUzYkQEVrOUDs9hV3b13muWJj50MmodnzfwE2/lRgkparFHpsZiKH+J4q8J95W9t
WxdquEu27RYb0mQbbY1fkv9YIesjTLQn/ovn8Os7DJhenoeVb0hJwrDYDi30f5hB
tI0ZD1fRBIh5+Lc7zWYJ8xo7cuvuQUZTjraDhnagz1r/K4U9bQS+W5NECsR4cHL8
4eMKYydSCL7X/E2myeIwDJjGpUrXVXbQ3iwXYny5F6Ncaj2Dlq8fFFIDAL58WCz6
FgdrLN4kkMWyS5f6XXTI
=ijI2
-----END PGP SIGNATURE-----

--sDhuxz86kt5qlkuV--
