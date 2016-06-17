From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 00/13] Add support for Tegra DPAUX pinctrl
Date: Fri, 17 Jun 2016 18:56:11 +0200
Message-ID: <20160617165611.GO27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S0GG+JvAI2G0KxBG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466165027-17917-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--S0GG+JvAI2G0KxBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:03:34PM +0100, Jon Hunter wrote:
> The Display Port Auxiliary (DPAUX) channel pads can be shared with an
> internal I2C controller. Add pinctrl support for these pads so that the
> I2C controller can request and use these pads.
>=20
> Jon Hunter (13):
>   drm/tegra: Clean-up if probing DPAUX fails
>   drm/tegra: Add helper functions for setting up DPAUX pads
>   dt-bindings: drm/tegra: Update DPAUX documentation
>   drm/tegra: Add sor-safe clock for DPAUX on Tegra210
>   drm/tegra: Prepare DPAUX for supporting generic PM domains
>   pinctrl: pinconf: Add generic helper function for freeing mappings
>   dt-bindings: i2c: Add support for 'i2c-bus' subnode
>   i2c: core: Add support for 'i2c-bus' subnode
>   dt-bindings: drm/tegra: Add DPAUX pinctrl documentation
>   drm/tegra: Add pinctrl support for DPAUX
>   arm64: tegra: Add SOR power-domain node
>   arm64: tegra: Add sor-safe clock to DPAUX binding
>   arm64: tegra: Add DPAUX pinctrl bindings

There aren't really any hard dependencies between all these patches,
right? I think the worst case would be if the arm64 DTS changes get
merged before the I2C core changes (i2c-bus node support), then the
I2C core will complain about the pinmux nodes, but that wouldn't be
fatal, or have any bad side-effects, right?

If so, I think it would be fine if the I2C changes went through the
I2C tree. It might be nicer to have the I2C changes in a separate branch
that could be pulled into the Tegra tree so that we can get everything
ready there and avoid the warnings.

Wolfram, if you agree I can apply the I2C patches (binding + core) to a
stable branch and send out a pull request? That is, once Jon's addressed
any comments and you are onboard with the change.

Thierry

--S0GG+JvAI2G0KxBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCurAAoJEN0jrNd/PrOhh50QAJlKR9ZUnINB5e6o6T2qun6C
aCqyLLtd8QSj2M9W1pUdl4hPimDT3ETR3uayFpSy8ys5pd5Fe+y0VbxVzxsQCXkT
ZvlEAHoWSTGgcs4Ytg/yImieZPn1kd/tjltiREs4tHIiWvZpa97TiyfBTRsXDJYs
DXUj70iyL1ZpSpLIxGcz7nipXU3QWZEXSGYNCeljatU3KcTec/tPsn6FrSWeTHWK
IqmXunbQvjoKD9YN2xA9MSxQMEagJhpoJIJGXKiv2tNxZkj8kXJ6KZIGzBTyMWUs
sJurAxLbgNZQyuUODr5jYvN0FQcucYFuOkQSFP33FJ1Z22nkCuw7vn4dP3fyIglf
1A8iO8y1F+oK+s5MQ4k0s4RE3ilk51DQDyifljVsQk4QwZXUvT5FWAklYwqExepk
PrKnetuTLs0NW2+DetINTfYLXhgJgavpFMVKfBT/4xAWJdM+OVHBARtLcmeVewGM
RbwPaWIQYGF+8pezBgi9Eu1cqda2HZuJIfVdGGncHkCfJk/PFjNpZN/Dps3xR4Te
Ocb7odlIyI7EH1VYK/wWJDlAZkeyI2txxjbxOgBZQ5P4mYi90eAfMGA4dl3KJ802
TA2Y8+xvbGbcE8c/c4i7fvg84+3gv5C0iKehfC9tiqbTuvhyMYI3Szph8fEp7W8y
KQe1eXegIJBv12VDSeGv
=8Pjl
-----END PGP SIGNATURE-----

--S0GG+JvAI2G0KxBG--
