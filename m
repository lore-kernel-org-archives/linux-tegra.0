From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 4/5] i2c: tegra: Update transfer timeout
Date: Thu, 31 Jan 2019 13:48:13 +0100
Message-ID: <20190131124813.GJ23438@ulmo>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
 <1548915387-28826-4-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kr14OxHsRwZHHqxS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548915387-28826-4-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--kr14OxHsRwZHHqxS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2019 at 10:16:26PM -0800, Sowjanya Komatineni wrote:
> Tegra194 allows max of 64K bytes and Tegra186 and prior allows
> max of 4K bytes of transfer per packet.
>=20
> one sec timeout is not enough for transfers more than 10K bytes
> at STD bus rate.
>=20
> This patch updates I2C transfer timeout based on the transfer size
> and I2C bus rate to allow enough time during max transfer size at
> lower bus speed.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V8] : Added comment with explaination of xfer time calculation
>  [V5/V6/V7] : Same as V4
>  [V4] : V4 series includes bus clear support and this patch is updated wi=
th
> 	fixed timeout of 1sec for bus clear operation.
>  [V3] : Same as V2
>  [V2] : Added this patch in V2 series to allow enough time for data trans=
fer
> 	to happen.
> 	This patch has dependency with DMA patch as TEGRA_I2C_TIMEOUT define
> 	takes argument with this patch.
>=20
>  drivers/i2c/busses/i2c-tegra.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 025d63972e50..435518cd91b6 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -25,7 +25,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> =20
> -#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(1000))
> +#define TEGRA_I2C_TIMEOUT(ms) (msecs_to_jiffies(ms))

I think I would've just gone with direct usage of msecs_to_jiffies() but
this is also fine.

>  #define BYTES_PER_FIFO_WORD 4
> =20
>  #define I2C_CNFG				0x000
> @@ -901,8 +901,9 @@ static int tegra_i2c_issue_bus_clear(struct tegra_i2c=
_dev *i2c_dev)
>  		i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
>  		tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
> =20
> -		time_left =3D wait_for_completion_timeout(&i2c_dev->msg_complete,
> -							TEGRA_I2C_TIMEOUT);
> +		time_left =3D wait_for_completion_timeout(
> +						&i2c_dev->msg_complete,
> +						TEGRA_I2C_TIMEOUT(1000));
>  		if (time_left =3D=3D 0) {
>  			dev_err(i2c_dev->dev, "timed out for bus clear\n");
>  			return -ETIMEDOUT;
> @@ -930,6 +931,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i=
2c_dev,
>  	int err =3D 0;
>  	bool dma =3D false;
>  	struct dma_chan *chan;
> +	u16 xfer_time =3D 100;
> =20
>  	tegra_i2c_flush_fifos(i2c_dev);
> =20
> @@ -945,6 +947,13 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *=
i2c_dev,
>  		xfer_size =3D msg->len + I2C_PACKET_HEADER_SIZE;
> =20
>  	xfer_size =3D ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
> +	/*
> +	 * Transfer time =3D Total bits / transfer rate
> +	 * Total bits =3D 9 bits per byte (including ACK bit) + Start & stop bi=
ts
> +	 */
> +	xfer_time +=3D DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * 1000,

This doesn't really explain the factor of 1000 in there, which I assume
is just to scale this to milliseconds required by msecs_to_jiffies().
Might be worth to replace it by MSEC_PER_SEC to clarify the purpose.

With that fixed:

Acked-by: Thierry Reding <treding@nvidia.com>

--kr14OxHsRwZHHqxS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxS7owACgkQ3SOs138+
s6E76xAAvSz9qAlZnj7BW53L1XZQeW7kegHf0EWkwPTJ4Y5xOBK/K6vmPzoiktAb
B7IvwQs5MWFz1QN8T3ElgWKBffzpUrxk9jdMM77xqKEOuPPmpx4s1w5H9l47aSkc
krq4Su92XeHGzbB8+kDJvTYEUjqgMI7r0gUEU1qnHyFb1Rzcz/vfgP7BHYPKMhKx
hwWkPchG/TyVvKqhbaaUdMQt4Q5i9hNlN2ZftjQMHQOe1PTWaFV/yc+Y+xkCSTJB
fXtz/iq9XD4TbJkbKAaeECkNaGsteq4kfmmG9v7yqiocEo0zz85NfoFNn97Ax8mU
gJQvwNgQMbN5LW9oNfK0lg9t8ksMIaCA8WVGFXu8+2oDzp8PiAhrUNdzu1SWo+6s
gW4JDdj5uEywtS/qOKm/Owjkhd2It5b+EyvFSr7N/lw1AnCZoXcC0BVNazqmBews
iB8XYgOvN+lxGDhTynCDfWAEykArqfYYY3jLEdVD8wNI57QuTfRHZay6V5qW2i+Q
lZz3NKjI8Pe117A2N/+QP7GHRLQub+9+6B9DaFW+aAmGnSSOL4yfW15pGSl2eXql
Avd49+hSYtyJEb/S9dm7ywO0M35hIcPjU++7NrQFxhX6NSpAm/kNu6/jcQTvh9M8
PW/74CRENFdPWyjX5zQ3Hn5Be0lqFs9++fIg1csSVcJvWDhVm7A=
=yHym
-----END PGP SIGNATURE-----

--kr14OxHsRwZHHqxS--
