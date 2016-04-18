From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 4/9] phy: Add Tegra XUSB pad controller support
Date: Mon, 18 Apr 2016 13:43:18 +0200
Message-ID: <20160418114318.GC17716@ulmo.ba.sec>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-4-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457108379-20794-4-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2016 at 05:19:34PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Add a new driver for the XUSB pad controller found on NVIDIA Tegra SoCs.
> This hardware block used to be exposed as a pin controller, but it turns
> out that this isn't a good fit. The new driver and DT binding much more
> accurately describe the hardware and are more flexible in supporting new
> SoC generations.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v9:
> - export public API for direct use by the xHCI driver (replaces mailbox
>   API which had introduced a nasty circular dependency)
>=20
>  drivers/phy/Kconfig                        |    2 +
>  drivers/phy/Makefile                       |    2 +
>  drivers/phy/tegra/Kconfig                  |    8 +
>  drivers/phy/tegra/Makefile                 |    5 +
>  drivers/phy/tegra/xusb-tegra124.c          | 1747 ++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.c                   | 1017 ++++++++++++++++
>  drivers/phy/tegra/xusb.h                   |  421 +++++++
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c |   20 +-

Hi Linus,

the changes to the existing pinctrl driver here would need an Acked-by
=66rom you as well. Effectively this turns the pinctrl driver into library
code that is used by the PHY driver to preserve backwards-compatibility
with older bindings.

Here's the hunk that does this:

[...]
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl=
/tegra/pinctrl-tegra-xusb.c
> index 2f06029c9405..946cda3fee35 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> @@ -873,7 +873,7 @@ static const struct of_device_id tegra_xusb_padctl_of=
_match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, tegra_xusb_padctl_of_match);
> =20
> -static int tegra_xusb_padctl_probe(struct platform_device *pdev)
> +int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev)
>  {
>  	struct tegra_xusb_padctl *padctl;
>  	const struct of_device_id *match;
> @@ -955,8 +955,9 @@ reset:
>  	reset_control_assert(padctl->rst);
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_legacy_probe);
> =20
> -static int tegra_xusb_padctl_remove(struct platform_device *pdev)
> +int tegra_xusb_padctl_legacy_remove(struct platform_device *pdev)
>  {
>  	struct tegra_xusb_padctl *padctl =3D platform_get_drvdata(pdev);
>  	int err;
> @@ -969,17 +970,4 @@ static int tegra_xusb_padctl_remove(struct platform_=
device *pdev)
> =20
>  	return err;
>  }
> -
> -static struct platform_driver tegra_xusb_padctl_driver =3D {
> -	.driver =3D {
> -		.name =3D "tegra-xusb-padctl",
> -		.of_match_table =3D tegra_xusb_padctl_of_match,
> -	},
> -	.probe =3D tegra_xusb_padctl_probe,
> -	.remove =3D tegra_xusb_padctl_remove,
> -};
> -module_platform_driver(tegra_xusb_padctl_driver);
> -
> -MODULE_AUTHOR("Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
> -MODULE_DESCRIPTION("Tegra 124 XUSB Pad Control driver");
> -MODULE_LICENSE("GPL v2");
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_legacy_remove);

Since this merely implements the binding change, does your Acked-by on
the binding apply to this part as well?

Thanks,
Thierry

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFMhWAAoJEN0jrNd/PrOhMJwP/jeNZnJV/egX6GEQOOKnkxeX
LsFSnWloEKl9D08uLkArACL3kHA/s02GNtZnIZmgvZrRo+mjFMCnTMDzY4hCk/bP
qzrFSDbXreiL9yLmoiBf+jMHavDa8faAF1S0l3+D2kf+2ubfE59nKUWLoDbcT291
ff7t9Ns0ohFlgAMHFXTEwreyta5ubT6SgzlhTofiK4EqUw58d3H+WzFK+I5TmAey
SIpW1W7qUXcaVEz9ZoieoPPEn5fCXDouN3VxuCvGJznx/faS1tWjpHltmNyzLgw5
4AhhUFFqFNxjtXtOSgPTPKCuSrLWO7wWhW1HBFMNxdMVYg54vmVotLKK4DRFmN3E
y7Tyz6HO7qluM5k/MsMz/Sabpp/FUkoWUU6o/tNUvbKC464zMRcqKZe63svqLZuw
iOvo20XR9MHDPhl0VUGju7sn8R+IVZ/n5ceqC6D2b/DGB1ywK8nW+Ht1qsswsRuC
Esjm80aQtFV5MpSijNG2z7X36qgOV5dlvIXGopaHtd/R87q9Y4owKvPiz8z7R/fy
+dan/fX50H7auLBgpZbkXPifQWhX5N/gfJU86SuKKl4MCbyX0oDO2/1Uh2lVrRnX
nWcsJmo5XYZYn9v5xDfAvNfxT4gh7qLQZk5EkPI265mrxn/s9TTN/1bv11JBrmon
NaGuPu0eIdeSKqxItivJ
=Sgsq
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
