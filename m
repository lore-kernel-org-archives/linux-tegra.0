From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/4] of: Add NVIDIA Tegra XUSB pad controller binding
Date: Fri, 11 Jul 2014 14:58:00 +0200
Message-ID: <20140711125759.GB10744@ulmo>
References: <1403177830-28595-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403177830-28595-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 01:37:07PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This patch adds the device tree binding documentation for the XUSB pad
> controller found on NVIDIA Tegra SoCs. It exposes both pinmuxing and PHY
> capabilities.
>=20
> Tested-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v4:
> - drop unneeded #address-cells =3D <0> and #size-cells =3D <0>
>=20
> Changes in v2:
> - move header file to this patch and refer to it in the binding
> - update example to match the latest binding
>=20
>  .../pinctrl/nvidia,tegra124-xusb-padctl.txt        | 127 +++++++++++++++=
++++++
>  include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h   |   7 ++
>  2 files changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a124-xusb-padctl.txt
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h

Patches 1 and 2 applied to the for-3.17/xusb-padctl branch with Linus'
Acked-by.

Thierry

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTv99XAAoJEN0jrNd/PrOhb/gQALIwB07tJwDQvIykPVA4DoZc
lV2+sfpTVdmF0SsqffXo+y/0WD1R5BVIifufr3AdRll7qwNZ44VMr6rMLNg6dSgd
bXFYKLAv2gV5GzV1Zd5HYorEqOm78ULv/OM/FeS9bVKerbOFb3MEWoxzkGLetTjm
XJKqF/SiVyUh8wvV6tQGlniH7s2FXk5eGv20pPP10Pnpe1QZsRgYyCILlMmpPgzm
W+GVGLG/krVczaEmB9w+ISHOx8SbZ+89Uz/rr0rrVZXZecyDFF7kYeAk4Y+/46vx
S0d40/a9rgkCMVfqtZ9x8o4/C9wD6qgUcmcYbGj6trPw5hl4GwFtfjLsUS1no66e
2Z/Ij/xeL/oGsAw2AUNyjiXuZxDtMMRfj7zmWPNsIrdf4Y7+7xH4DhROhZL6ImI7
5p4jYuiHgSlC83xcimDjDWWZ4KKWQ16RQpnZ+gehOFQ7rHWJQBqDB4iEwXLTcdbe
pR5RHU8+hJ1huqu1GQdKMK7UyT1KYm5KWzc8M3nfZLvJFPoW4uKg/h5p80hzHeSa
iEvMP7NnF0d6GebFNWimfl8RdLxdGQ3Jiu11REf9K578EJ5iX8ARn9i2cX4QwuL9
UHsh4qsMD5rvUQoXT8U9nHG+OjEnhjJvVpcZzIaoqbllmisEvD92DUq/vSkLcU3D
hPAMb15cMJnHJ4aIRA6w
=1a2d
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
