From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] gpio: Add Tegra186 support
Date: Mon, 13 Mar 2017 08:06:23 +0100
Message-ID: <20170313070623.GA15513@ulmo.ba.sec>
References: <20170310162629.31455-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170310162629.31455-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Suresh Mangipudi <smangipudi@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2017 at 05:26:29PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Tegra186 has two GPIO controllers that are largely register compatible
> between one another but are completely different from the controller
> found on earlier generations.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add pin names to allow easy lookup using the chardev interface

By the way, I tested this using Bartosz Go=C5=82aszewski's excellent libgpi=
od
that provides a really nice set of userspace utilities to detect and
manipulate GPIO chips:

	https://github.com/brgl/libgpiod

So for userspace access to the Tegra GPIOs we can now run something like
this in a shell script:

	#!/bin/sh
	gpio=3D$(gpiofind PCC.00)
	gpioget $gpio

There's a bunch of other features that the library supports. I'm glad we
finally have a standard set of tools to deal with GPIOs in userspace. It
seems the internet is full of libraries that deal with the GPIO sysfs
interface, but hopefully we can standardize on one library and the tools
for the chardev interface.

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljGROsACgkQ3SOs138+
s6H0eQ/+OlGnzhjkOmitKvXkR54fdxPFt4e5ZmGSndjX201mlYzsbmWtjihvT6NH
kYjs9NPKir1OTX58dokek1C1MTlbMXI3C1js95Z358iZDV149bBowKoE53Fr/MeB
MnpevPX32WcGP5Bxk6/1aCdn6T8iKSvEbNN2FhvFvRuvYI/lN0lLSEeU9i64StEt
wB7G0B+cCHYOhEWTbFRi+qd99MdjBYUBk6muCsiYBTEPWaAp34FqnrpRxdm994f0
lrjPSg+HhQPkrtKWT477Kq+duasW8dYb5KkBWvNzqHiwjZzJG+ipZPSFXbdYs/pM
nbDA15DNyjl9altgkWvH7cGEBKz7o6XRUFDkKvPzyFUyiOi+a1HzKZPeBsPJstVN
IYZY/cShr3ZS0yuqtXkkiYJ/Ocxz0K0/BW44NKMjZ2DkQ3m+nQmpdRS3c858yb4D
p/n51SbWWOm9J4jkFIHQ+JAF+iFoi0lxtpM7JoX0umDlp9XgQcpbU7kOyRpXSXWh
oS408SXySgmRX3wWxvq22kTgQqdIu1oRw+ZEhquteKASSKVgKY7C6NJcxCDdHavf
19eH9MMQSOAwcMSRpS7Z/cvbngJufTqv0bySVBWQGiok6zGAZgfiY3WU/prth3gc
1L50P7p4Tq46Im1fFcOKZEWnv6Z9atUMdvityWmIzHbNA08r6n8=
=XElp
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
