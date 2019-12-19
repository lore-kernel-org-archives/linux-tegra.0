From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 3/4] usb: phy: tegra: Perform general clean up of the
 code
Date: Thu, 19 Dec 2019 13:54:37 +0100
Message-ID: <20191219125437.GB1440537@ulmo>
References: <20191218175313.16235-1-digetx@gmail.com>
 <20191218175313.16235-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191218175313.16235-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 08:53:12PM +0300, Dmitry Osipenko wrote:
> This patch fixes few dozens of legit checkpatch warnings, adds missed
> handling of potential error-cases, fixes ULPI clk-prepare refcounting and
> prettifies code where makes sense. All these clean-up changes are quite
> minor and do not fix any problems.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 367 +++++++++++++++++---------------
>  1 file changed, 197 insertions(+), 170 deletions(-)

This could've been multiple patches to make it easier to review, but
either way:

Acked-by: Thierry Reding <treding@nvidia.com>

One minor comment below...

> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-=
usb.c
> index 15bd253d53c9..76949dbbbdc2 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
[...]
> @@ -310,13 +315,16 @@ static void ulpi_close(struct tegra_usb_phy *phy)
>  	}
>  }
> =20
> -static void utmip_pad_power_on(struct tegra_usb_phy *phy)
> +static int utmip_pad_power_on(struct tegra_usb_phy *phy)
>  {
> -	unsigned long val, flags;
> -	void __iomem *base =3D phy->pad_regs;
>  	struct tegra_utmip_config *config =3D phy->config;
> +	void __iomem *base =3D phy->pad_regs;
> +	unsigned long val, flags;

I think technically the "val" variable would have to be u32 because
that's what readl() and writel() operate on. That could be a separate
patch, though and isn't really a big problem.

Thierry

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl37cw0ACgkQ3SOs138+
s6HXoQ//enaIv+19+8YhDuO73TpetmdsTfhTcNwIw276WtV7j53pQ/KcHAKir3H7
PBCui7fiZXLj2b90PFucEjenupecmSC07u1Gc2pjTHCYWSHJLr2N0EDNkUiina00
9ebxKCNPttnMFZAdcCldRTQ/lgDF6crUUoXpwSc+j9n6Pl+OhMFb3XhQ2/NNYPaM
D7MnZU0sz4zN3/OcaBX42nhENrG6bUqXChImGkfAZnxXQgjFFLpR3GYjMX0pMy3g
j+c3Q35I8QE9QbHmIyOEWuX94wc/j1ZUQbw3KmQwGQdx+OfAShvjynj4x+orA85o
6cIF/WVoQk4ybulnKOvh7RkXf10BoNgQz17a6Nq0JSWMR8ju4XjmL1L9RN6hFcgC
dq4cs8H4RFVMVX4Rb9cbbqysF3oMHKyIBbxLf3gw82KeVVT70/fZ0fpwyaKR9dDk
6Cui0PlS8Eb/Ya5RC9rMmXOQQtUyXXtwVeNS3ye3fXC5uGNsSWqVrn/mUz1SR/FB
5/qoq7jtk4wNzRMz6LsUW6iRLSYpnZZrgK73wAlM6pPJykwsq3Hjx4KrVDrgMiGH
A9ZvXLkIeDWLKa6/d8GCvRvnb3jy7W5ivez65Ut1zDCkPh1ASqnOrEjlsAr7BT5z
lcidEPxRLCoAj1GIK6LYYZgWDSpxoPulrnDbySY5l5MRgZBZNU8=
=nQyV
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
