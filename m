From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH V2 06/11] dt-bindings: i2c: Add support for 'i2c-bus'
 subnode
Date: Wed, 29 Jun 2016 12:41:14 +0200
Message-ID: <20160629104114.GB1793@katana>
References: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
 <1467191877-26017-7-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467191877-26017-7-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 10:17:52AM +0100, Jon Hunter wrote:
> The I2C driver core for boards using device-tree assumes any subnode of
> an I2C adapter in the device-tree blob is an I2C slave device. Although
> this makes complete sense, some I2C adapters may have subnodes which
> are not I2C slaves but subnodes presenting other features. For example
> some Tegra devices have an I2C interface which may share its pins with
> other devices. In order to share these pins using the pinctrl framework,
> it is necessary to add subnodes to the I2C device node that represent
> these pins.
>=20
> To allow I2C adapters to have non-I2C specific subnodes in device-tree
> that are not parsed by the I2C driver core, add support for an optional
> 'i2c-bus' subnode where I2C slaves can be placed. If the 'i2c-bus'
> subnode is present then all I2C slaves must be placed under this
> subnode.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Acked-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>


--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXc6XJAAoJEBQN5MwUoCm2Hz4P/3dguU8HbIDV5+BSWYWwieIA
jfyuAxSJHpLC8irP0diW1iQeqenCONjkbbgOlfGWsrUhkiyQUtK8v7aVuaXNSzQ1
j4HEw8WGJaiDSrPGrlqK6Fv8KMTHcEbwfu74ZlDgB7Tv+YtxKdPwMhA9plHkvXdZ
4MrzX2zHoc82qJARf/wuUM9cvpkdtN0aRBweSvmkivkz/7CbuXoxpzxZ/cuzxAWL
O7ir5/Ki0qE4SSl6E1WADzWwVppkUZjWOT97abiUxo6n1nXn30dt5OlTV4bcxprZ
DMwDx+X20kwAFj1QfK6SIf04WrltnLZ3ZXne+xbjpEiC1smdJAsAUV9iVo81NE5d
hjeYV822+OHAwKvalbFfIxKf6XGUGZ3jHZQ8rScKRXPxcfaMkY+2+ZFC6zIiWw7H
VfYCQrHTVPUZ1SW3KIAOTUtVMWxYLfqoVjAiAVt0gIQo0Wk2LGrdti1GTe8454sI
DhrdoleS19wO3sT1e9Xue3J3WNgeMZzBCKxyAs6FL68L78NRfR2AW6+gMAf8nmlV
agAvF2ecb3BoghkaC4SQF/oKaWDEWhdmWh11aav0+SVbcq6tWRwrkFJVCldQGw9L
cZtFg+yVxCr7/xmW4We5BmAQn4zMvvnRqqPNBdgdpc+CDUE71Duyt0OPkEGg0XDa
OFjORFLtafjUzd2kjjLN
=fQ1W
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
