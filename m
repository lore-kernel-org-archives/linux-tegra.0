From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] of: configure DMA for host1x devices
Date: Mon, 25 Sep 2017 09:44:48 +0200
Message-ID: <20170925074448.GB12494@ulmo.fritz.box>
References: <20170924090454.28116-1-mperttunen@nvidia.com>
 <20170924090454.28116-2-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170924090454.28116-2-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hch-jcswGhMUV9g@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2017 at 12:04:54PM +0300, Mikko Perttunen wrote:
> Devices in the host1x bus rely on the old behavior of of_dma_configure
> to set up DMA ops. Add a check for them into of_dma_configure.
>=20
> We must do the check using a string comparison instead of using
> pointers since the host1x bus can be compiled into a module.
>=20
> Fixes: 723288836628 ("of: restrict DMA configuration")
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/of/device.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 64b710265d39..12368418cd33 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -104,6 +104,9 @@ int of_dma_configure(struct device *dev, struct devic=
e_node *np)
>  		if (!dev_is_pci(dev) &&
>  #ifdef CONFIG_ARM_AMBA
>  		    dev->bus !=3D &amba_bustype &&
> +#endif
> +#if IS_ENABLED(CONFIG_TEGRA_HOST1X)
> +		    !(dev->bus && !strcmp("host1x", dev->bus->name)) &&
>  #endif
>  		    dev->bus !=3D &platform_bus_type)
>  			return ret =3D=3D -ENODEV ? 0 : ret;

Maybe a slightly better solution would be to add a dev_is_host1x()
function that returns dev->bus =3D=3D &host1x_bus_type if TEGRA_HOST1X is
enabled and returns false otherwise. That way we can have a "proper"
check for the bus type and avoid the #if in this file.

It's slightly more complicated because of the dependencies between the
DT and Tegra DRM trees, but I'm sure we can get Rob to either give his
Acked-by on the drivers/of/device.c change or carry the Tegra DRM patch
in the DT tree.

Thierry

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnIs/AACgkQ3SOs138+
s6Gtww/+NdPSvOPh58HPoZS9XmrLsbsRR2Gxip+vyrIoTHkqFOUAbdEdHLhCWjpS
U7qWqrUGzRw5ijPJcmElQI9f5Tje517PUyiMFMrkMnankaJLBgkjosbm0hKVasnI
6isXX5A0Cucf8PxDWrGYaGQ9vcMPDi+TBQM4B1rHQ43N/X1hA51BuaCLU4iga06z
T6VF0+u8lLztpnfIsUEVa5i1TGpj05j2IcrrBLtU3IpbO2by+G23tUq0XpMFNDVi
vUoDd4KSep191sbtN3dMNQ+blTClCtNIcmh9QgWzDQEJB88qiXV77Nmzftpl/TbK
/HOysQG7/An2tRo4xBleFdb2IDI44GTH+6kMp5IVxRSHtq3fW7tlnYIG7hcLuKwA
SmhpRXvxBCpx4Nqav+WqDI10qk4zccYUt3M/fejLfsKB/1I1cPBEl411TsR8NHd9
QkyLE/Lp2ffk+1CzGnsVf4bZW79274wRqySy8fv7cg7v0f57P7VPvNW9krFD2C+A
bghe0kOaXdclVj4sOxoY+ZI6QPtPEi/8zFSEPLMV4CwPX2myd6A59bsngCFcvOyD
1eI7+PYI1eb/r/SjYdXLrY7mLX9WJ9HvGSZzTChdyzgfcr8BRFnDtykzZxLGvRpj
2U0wABMqcfXIt7R9EhqR52KQsCf7IqB4tqfcaseTZ2/YeiEIZ0U=
=t4/K
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
