From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 1/2] i2c: tegra: remove master fifo support on tegra186
Date: Tue, 19 Feb 2019 18:11:37 +0100
Message-ID: <20190219171137.GC14351@ulmo>
References: <1550551825-1245-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550551825-1245-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, talho@nvidia.com, wsa@the-dreams.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 08:50:24PM -0800, Sowjanya Komatineni wrote:
> Tegra186 does not have master fifo control register and instead
> uses fifo control register like prior tegra chipset.
>=20
> This patch fixes this and prevents crashing during boot when
> accessing fifo control registers.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Nit: fifo -> FIFO, tegra -> Tegra, but other than that:

Acked-by: Thierry Reding <treding@nvidia.com>

A quick note on why I'm pointing out these capitalization issues so
pedantically: specifically in the "tegra" case, it's difficult to grep
for it because it matches things like "integration", which is a
surprisingly common word in the kernel. Spelling it "Tegra" consistently
make it easier to grep for Tegra related bits specifically.

Thierry

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index a4cd79c9f7a7..e6851904acc1 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1436,7 +1436,7 @@ static const struct tegra_i2c_hw_feature tegra186_i=
2c_hw =3D {
>  	.has_config_load_reg =3D true,
>  	.has_multi_master_mode =3D true,
>  	.has_slcg_override_reg =3D true,
> -	.has_mst_fifo =3D true,
> +	.has_mst_fifo =3D false,
>  	.quirks =3D &tegra_i2c_quirks,
>  	.supports_bus_clear =3D true,
>  	.has_apb_dma =3D false,
> --=20
> 2.7.4
>=20

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxsOMkACgkQ3SOs138+
s6EqNw//bxDRgxqyHkMs4N9WNHcZAIdO+ujyfXMbvXWpjBQsXg+Dt0M6tbEdTWDC
SaIYPvsKQL4t+pv+oBDB7VMq8Mbi/Yvnf2DXLAy1Dh0sX5OcxRhFVoW8IxiBadiT
wbMDaQ2tP78474uGWajEpFzTvXaWBt/BzGOneu9id/YzTFIzmz8/dZlzVFoviUXN
4SYqwRw4jUARTm1omPZgeumXAe+QM1o2N/kPV0LXssIN3lCqI2/4jTVSjWKI+4jO
K7jFElptI/SD947jvynWP7VXL23XVLDbJaqeXl5E57R92u9h8jfPXDukch2z5tSf
ASSb0dzqHxupcTZTLU154cxcWeTHAhPxpIWfurWOkvfnPGmSLgdjOmJHPOJQ2Oq7
42xZEatlgsHhvYFID2kDl0hKM4fN9TlafeivZC5AGUtovkG83o4LFXAiv379ohrm
Ffjrbjrm3ahwfQPjDucJvyCfy++VOezflcLQ8HzC6sDNhikt6xDDBBKgPx7bcQ4m
PacotdS/wqPcl6cBhuaTmgB9VQY2uHq6OntOuAhMjXC99hWCvphGjEMaK1XvGTFK
WzSF4ZR7EWuN1T0WbE9Cg/3KfEIMUTV1SThzsRzG7xkmgTJzdMHmdc6my2i6tA+T
MixVNqd1NS/nBPy0TsceQeKRRXz+DlOGob97p/jrTttHukn5uT8=
=pZA7
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--
