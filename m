From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: DSI panel not working on -next
Date: Fri, 13 Feb 2015 10:55:18 +0100
Message-ID: <20150213095516.GA17888@ulmo.nvidia.com>
References: <54DD99B5.2080504@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54DD99B5.2080504-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2015 at 03:29:09PM +0900, Alexandre Courbot wrote:
> Hi Thierry,
>=20
> I noticed that the DSI panel of SHIELD (tegra114-roth) was not brought up=
 on
> -next. I have bisected the following commit as introducing that behavior:
>=20
> commit f4c5cf88fbd50e4779042268947b2e2f90c20484
> Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Thu Dec 18 15:29:14 2014 +0100
>=20
>     gpu: host1x: Provide a proper struct bus_type
>=20
>=20
> With and without this patch, the DSI panel is probed, but the stack trace=
 in
> the probe() function is different:

This shouldn't make much of a difference, really, since we're attaching
to the panel only during mipi_dsi_host_register() anyway. And the panel
device can't exist earlier than that because mipi_dsi_host_register()
will instantiate it. Still...

> i.e. with f4c5cf88fbd, the panel is not probed from tegra_dsi_probe()
> anymore, which means DSI remains without a valid connector:
>=20
> [    1.378513] [drm] Initialized drm 1.1.0 20060810
> [    1.384564] 54300000.dsi supply avdd-dsi-csi not found, using dummy
> regulator
> [    1.396394] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    1.403021] [drm] No driver support for vblank timestamp query.
> [    1.409080] drm drm: No connectors reported connected with modes
> [    1.415128] [drm] Cannot find any crtc or sizes - going 1024x768

=2E.. the failing log here does indicate that there is no panel, so I'll
need to investigate why that's happening.

> Are you aware of this? Does it affect other DSI panels? Does SHIELD's DT
> need an update of some sort?

I'm almost certain that I've tested this on at least Dalmore and I don't
see any differences that could be causing this. I'll look into it.

Thierry

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJU3coEAAoJEN0jrNd/PrOhagwP/j/Xpsw6mw+6WWaVl/kTlgSO
HBkfhryMlYkfRwLcl3CTN+Q5+YsEsNb6PA/C8TCIAB169H3f0vcaXGSPYdjZezz9
3BqMUI5Fk/GpcPtDXQRNJ9givtUDM/WLSANFEVtScy+4YWS0yQr23trKEcw54dr+
KKbHUPkTSNtwevJ84zedg8OjVHqbu/4GmcKou3gzoa/Xb92/bcME8O/9PSCOBfDj
SdlHx8oK0QjcKDiT0c6cL7i29Mpk/XtG5nKUejG2pPQZPcdfc/sXk/s8lkCJ1LgV
K0fKaRFJaagoiivf+ykSpaY7MST6jnAeOlyOyzN8ZKy+l7yHcSgdN5s0DDOiV6za
rwQWoCQYns9ECsUw3cT1o+qOCoygICj+pfzLY2pQGwV2C7F4Hn8BsQ8QQjk4SDLW
+ivmdGKldw/dNjvp6Gq9h14pkhHvckzhWBxlEnHApo23oT2f2MXhlIIBRFiHjt6W
yPJ8r+9fwQtUfHT6QSsp47yfBvuXKPEggGmSLs3rw3Mu5C+mNDdckSxUWRCPbAV9
aSYBSjJ4+XqndabmcuXjBcUhO/Ry/IgmA+Jbf5Exg9Ir2evC/V/VrJ0HBlKSE1ZW
DGvbkhOcB8r2GmhIPtKtQ27+Jw4A1PCNqpuHLA/GPOkMBVgMGHzYeemQjFzo59VF
SHFE/ILwCiUJ4LEU9AzT
=jNfp
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
