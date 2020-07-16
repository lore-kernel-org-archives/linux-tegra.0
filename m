From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] PCI: tegra: Remove PLL power supplies
Date: Thu, 16 Jul 2020 15:00:34 +0200
Message-ID: <20200716130034.GE535268@ulmo>
References: <20200623145528.1658337-1-thierry.reding@gmail.com>
 <20200623145528.1658337-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200623145528.1658337-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 04:55:28PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The Tegra PCI controller driver doesn't need to control the PLL power
> supplies directly, but rather uses the pads provided by the XUSB pad
> controller, which in turn is responsible for supplying power to the
> PLLs.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pci/controller/pci-tegra.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Hi Lorenzo,

do you have any comments on this? Can we get this into v5.9?

Thanks,
Thierry

> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index 235b456698fc..f87a09d21eb0 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2025,7 +2025,7 @@ static int tegra_pcie_get_regulators(struct tegra_p=
cie *pcie, u32 lane_mask)
>  		pcie->supplies[i++].supply =3D "hvdd-pex";
>  		pcie->supplies[i++].supply =3D "vddio-pexctl-aud";
>  	} else if (of_device_is_compatible(np, "nvidia,tegra210-pcie")) {
> -		pcie->num_supplies =3D 6;
> +		pcie->num_supplies =3D 3;
> =20
>  		pcie->supplies =3D devm_kcalloc(pcie->dev, pcie->num_supplies,
>  					      sizeof(*pcie->supplies),
> @@ -2033,14 +2033,11 @@ static int tegra_pcie_get_regulators(struct tegra=
_pcie *pcie, u32 lane_mask)
>  		if (!pcie->supplies)
>  			return -ENOMEM;
> =20
> -		pcie->supplies[i++].supply =3D "avdd-pll-uerefe";
>  		pcie->supplies[i++].supply =3D "hvddio-pex";
>  		pcie->supplies[i++].supply =3D "dvddio-pex";
> -		pcie->supplies[i++].supply =3D "dvdd-pex-pll";
> -		pcie->supplies[i++].supply =3D "hvdd-pex-pll-e";
>  		pcie->supplies[i++].supply =3D "vddio-pex-ctl";
>  	} else if (of_device_is_compatible(np, "nvidia,tegra124-pcie")) {
> -		pcie->num_supplies =3D 7;
> +		pcie->num_supplies =3D 4;
> =20
>  		pcie->supplies =3D devm_kcalloc(dev, pcie->num_supplies,
>  					      sizeof(*pcie->supplies),
> @@ -2050,11 +2047,8 @@ static int tegra_pcie_get_regulators(struct tegra_=
pcie *pcie, u32 lane_mask)
> =20
>  		pcie->supplies[i++].supply =3D "avddio-pex";
>  		pcie->supplies[i++].supply =3D "dvddio-pex";
> -		pcie->supplies[i++].supply =3D "avdd-pex-pll";
>  		pcie->supplies[i++].supply =3D "hvdd-pex";
> -		pcie->supplies[i++].supply =3D "hvdd-pex-pll-e";
>  		pcie->supplies[i++].supply =3D "vddio-pex-ctl";
> -		pcie->supplies[i++].supply =3D "avdd-pll-erefe";
>  	} else if (of_device_is_compatible(np, "nvidia,tegra30-pcie")) {
>  		bool need_pexa =3D false, need_pexb =3D false;
> =20
> --=20
> 2.27.0
>=20

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QT3IACgkQ3SOs138+
s6EuqxAAmbuhEZ73eykpJoyukSD0EIbLgRuPnj9vhKPQFXy7MYsbMqCX8t/T41eM
5SoxSB6uAZ73QqLWsx8OnzwJwwTRJYBVUQ19mA7YV31NL4BPER6RnreAX1JGhOt1
pWJrzNvYK1EwQJVwPUh1eal4vg2psQeFJevJmiokHwP7f6ylVOx04tK5jdq0BneH
nes+VllTvszh7dAURzlEg9vZ7sFFo5am4GBCgnL+WmXkMhB2PRcxdZTvpmcvS8FX
OR5Na17hyKDeWldpcpqhErfkkPozXnZ3KeanpIoiMk2sFRXuyM/qP4fYPtNc0oKB
PtjTf1ByAOc6sTSemCYF6OCp6WGulpjdBiJfNKUTIXZig5Stcwetu8OcI5QdiVwP
ztA7wCbbTmYecH+1/jqgNoLzSq/ZDKIze7uwmk9eLimHJa0Vf8c8XojqoTonVjUQ
iEZGKmRnFHfIzgc6hiWGmL54ZVfWdIEPsEydpulEtgQUd/sxaBdXCxLNzS+0eoFl
fX2I7WmvQHfQEb4B6H8/i5iMRVvSIWskivjkYcHvLDFKzn3HmUPlp2z9PnuKrvcp
xEZllBdRf7CRUD/yg5tdfhFtHRL7T4qzn1BZZP2Aam887xC4DR3EYN7UMpUJtSMS
iABYTTAj9cqr8Ev52nwLcGZ4DHGSHx2Nr/63KTDM5dMRuYtEcT0=
=Sp/M
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
