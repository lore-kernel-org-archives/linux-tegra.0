From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: match return type of
 wait_for_completion_timeout
Date: Wed, 11 Mar 2015 10:23:33 +0100
Message-ID: <20150311092331.GG19577@ulmo.nvidia.com>
References: <1425219461-3261-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XRI2XbIfl/05pQwm"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425219461-3261-1-git-send-email-hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XRI2XbIfl/05pQwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 01, 2015 at 09:17:41AM -0500, Nicholas Mc Guire wrote:
> return type of wait_for_completion_timeout is unsigned long not int. As r=
et
> was only used for wait_for_completion_timeout here it is renamed to time_=
left
> the type changed to unsigned long and references fixed up.
>=20
> Signed-off-by: Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
> ---
>=20
> This patch was only compile tested with tegra_defconfig
> (implies CONFIG_I2C_TEGRA=3Dy)
>=20
> Patch is against 4.0-rc1 (localversion-next is -next-20150227)
>=20
>  drivers/i2c/busses/i2c-tegra.c |   12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--XRI2XbIfl/05pQwm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVAAmQAAoJEN0jrNd/PrOh68YP/0LaILAIkuoXVuYYZBF8aPBk
IxdyHZjszm+jdYbqRoPGNjXjvtkUNJYhME2ygKGIi6FJKxr8uSZKKA1MTwFFXN1E
9UkB+LNYvvxfbnmkz7CrYc30XAtOHNM3UbtjO121BdgmTxPaVwHxUAJXDkTvGlsC
CX1mZKBWbfynk7xf3z8G716JcdF1Dvm1aI47Y9cRTCzCVUoO4LNS6dmGbou0o5yd
25IM0dghHl030KDwAvxvC6fCPBlAv1C5rRiIjYQ2YxXoSujmzOSXXVmSESaayz9b
0c1bHWMEVlpTXklSvAod5ICy1PSY6B8HUB/JKwmGzHd635lMu64CBkAvjD8LrlPn
2kW8DD4lY90JY+tHRUVvNu2DJFOBNhhnPJhGCHUX+nRjSofQ1JD/F8bBK/2WrZfZ
UWafT3U2Oinhj9C6MrzXubZ+ZxKrMq9jOHR8TW5iVG3/lGfHLudC1rqVebTORqvj
lCu5KSL9eSCUbUq3ZA8ctKdsyyHsam/AX8g53t0QYQpd7C687v7QfRxbgUAOMbmQ
tA/LwN3dLYDW6/0gw4Nst/U0D+t8MznXChiSYl+UhM5xX2TB/MLi8QDH7czlDlZw
xfFiVSX5dWec+hrjWLCDXI8u9vkWzBVqtYrj8jfOuA8U2Y8GQFBgzQzUINzkNzb5
jarn+dhNMnWptV0MVcw2
=6krr
-----END PGP SIGNATURE-----

--XRI2XbIfl/05pQwm--
