From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Register host1x node with iommu binding on
 tegra124
Date: Mon, 31 Jul 2017 16:48:13 +0200
Message-ID: <20170731144813.GA27815@ulmo>
References: <20170709163614.6746-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170709163614.6746-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 09, 2017 at 07:36:14PM +0300, Paul Kocialkowski wrote:
> This registers the host1x node with the SMMU (as HC swgroup) to allow
> the host1x code to attach to it. It avoid failing the probe sequence,
> which resulted in the tegra drm driver not probing and thus nothing
> being displayed on-screen.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-4.14/arm/dt, thanks.

Thierry

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/QyMACgkQ3SOs138+
s6G1vhAAsCVqRTfCgSNRc3/qhOr1GEuw+4jXF5N2uhW8wFmCEeeG8York383JZgu
Drn2aXToJaF1aA/3f43N2C5jXs+1vgWkXANkIfJo9x3er19jb8hC3HywVCtN5VG5
FrmRBkUzFfbdDM9YJ1e3y5R/7yM+VSULMxppNT75oQsZhB3kPUQ1iR0m5G17islm
YRbL3t61sxDRXjKmJqTHx9YVDu1ZnfLzOTiSlcv/TKGGLLCcVXIj91xWdPrgtHWq
G88HCqHvOI9l+rxmiv6oc+rLHa1+IiQlFs9zY64m5XGepc2I9H1UxBqCUE1r7atw
IzGNWAOrr1kUw43o2QQuVPHPq/FzyV8f5ysebtY8b7DkpFT5Kg3qE1EmGeVrGrHn
l3BWBYCkXole815vHuXoOe1pxIDK8QYWuP8MDmWhmI9XQ1SpSk0Hzp3KjUtcfLZd
1RkVxOxEYjYW55VN9r3emqtXa2MR1vGe4PXbX9Q/c0rCL+BoLX/1lQkodYImD1aN
SdWDozDI1vAHFnM9vxEVStS1pna0ug6ox1vIF+Svr5XVLoZxVXGcfJJGoq9WQSwj
Y2kPPERtL0OnVSar0yQ15ZmfgBuggiNyci8Cc8xcEjaMD+/nQwESyEf/wutHnTQe
KrtdBq4e4DYse1MRA9NdX6bVSYGFbcI9TDKIGew+Dgl7RQRGdVo=
=/LZl
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
