From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: fix runtime pm imbalance on error
Date: Wed, 20 May 2020 11:40:35 +0200
Message-ID: <20200520094035.GC2136208@ulmo>
References: <20200520084012.30190-1-dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200520084012.30190-1-dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Cc: kjlu-OJFnDUYgAso@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 04:40:12PM +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> it returns an error code. Thus a pairing decrement is needed on

s/even it/even when it/

> the error handling path to keep the counter balanced.
>=20
> Also This driver forgets to call pm_runtime_disable() when

s/Also This/Also this/

> pm_runtime_get_sync() returns an error code.
>=20
> Signed-off-by: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
> ---
>  drivers/pci/controller/pci-tegra.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Otherwise looks correct. It's came as somewhat of a surprise to me that
pm_runtime_get_sync() increments the usage counter even on failure, but
it does indeed.

With the above fixes to the commit message:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7E+xAACgkQ3SOs138+
s6Ev0A/+LbNyGHEdbiqOD9y5/qaNsNqqMWMlwIt/mWXfZScDeEIpC3QPIsDtD5xU
ouYqP8sbmo/0Elu56py6NUKPWEC0xDRX9TwopJ7HwSFa8egl1AjR87eHOgjXFXgd
EuVB7+7TyE2rxp6UBtqQu1y9PDcTWmjQvyLaXBfQMyZqNaSt7e71yTdsz3cMHVa0
DnNipyvYDrGUzr/cgadt/kN5FrTGQbgEodLebDnkgzOHVuqeJKuCBGpOGUL2eEKS
r6fg3zb64SNwzQxB8k5hBek6+S+drfyTRcxzJgJOctehCq9xFA/5COUwdZpdzWQr
7tD8AVEe+GUb1MS1VugJyVdMe3QecRKCuO7fqJPLjLuy54LCHYJVUyMpWBvVYslf
Sl1e3ClVjUUt65y3Rtuvf0c7WzhRURoVBycKxsGlwM/nWZ+JjF/eejknZsifFZLQ
FDtEgX+MWIa0XL59NY419YH1ul6xwTIkK6mU7F+gEkK0E0lcsVyX1ItHKPPJWQ0C
hsRJCuGMqTlYetZorIzkAuOQCY0qR7qtsif1g+k7y2NeGBtDVDFmrsZjJNw52NRE
6wDjxlZaCGGAXMu38SqDjUCSuXSSBywODU+BJuD3AyzT3CZ6nU/gfBv4K1QsITQi
M9Q3U4+kFzKGpLHCVngyRhbZG9IYh012GSJeEDY+K+PX+I+/MU0=
=0vzD
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
