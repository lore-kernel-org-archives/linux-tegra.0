From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] i2c: tegra-bpmp: Enable Tegra BPMP I2C adapter
Date: Mon, 20 Mar 2017 15:05:03 +0100
Message-ID: <20170320140503.GA28203@ulmo.ba.sec>
References: <1489580410-9541-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489580410-9541-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2017 at 12:20:10PM +0000, Jon Hunter wrote:
> Enable the Tegra BPMP I2C adapter by default if the Tegra BPMP itself
> is enabled. This adapter is used as the I2C interface for the PMIC on
> the Tegra186 Jetson-TX2 platform.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/i2c/busses/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 8adc0f1d7ad0..9e024ae8a067 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -933,6 +933,7 @@ config I2C_TEGRA
>  config I2C_TEGRA_BPMP
>  	tristate "NVIDIA Tegra BPMP I2C controller"
>  	depends on TEGRA_BPMP
> +	default y if TEGRA_BPMP

I think "if TEGRA_BPMP" in the line above implies "depends on
TEGRA_BPMP", so it's redundant. "default y" should be equivalent. That
said, I'm not sure if we really want to always enable this. There could
be boards with a BPMP that don't use the I2C controller.

But that's fairly unlikely, so with the redundant dependency on
TEGRA_BPMP fixed, this is:

Acked-by: Thierry Reding <treding@nvidia.com>

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP4Y8ACgkQ3SOs138+
s6GLDQ/+M7oA7EXZRn4ckJDRgtCZsrcb3sZ/loNERWCsWjcIeCDepaxnZzMOkjhQ
R7Gh/H6B4B5QOWLZgvkrMFi3KNi4TPqpOiXqi8z2ShFW/dTeaRJAxRmEdA5ilqOj
Il5WD4qdfAq23is6raGoyWzU5VIcYsSzKf746X9M43RwUuMDFHuRvFjMJFLfEA+I
135bKliMZvjnIti1pYm8KUWuLXU0YOymwUY4Q5vq+gOHf5nDDKGxT3LQ5ruhh1xl
jjailUFpGUNYV1FBsnhaBU6o88A03ithH6SiK2hIch2Xi17XjOcmM02e8Z3DNdgS
Y+v3X/5QnY61JL6prkU5v5VX42a2yDwOTX9LIzO5stDIxZqkQ2XGXBM71T03ESsS
kd2La2R4p7/eSwP6twUmKFuAMoXR1u3Zq9lK4cUeGY4f/lMkbDt7KQOuGAypIbWg
CSHlGkWM4KG06qLOc7tGqW5agD7agKvPAFmxuKJCHq48i0K20leS2a1qISHOyukf
uhkhUaDlVlKjm0XSbHt3AMWJkLXJeX4Va5VSfJPW63Vgd9Knf+dgCHZwF3NNNu64
nm2J6BU7WiIYjFKghF0/E9r53sigQsdHv4zfGqe0y3a5euov+xbjXA5omVqL2XrD
WFEHclzKEVjDA+LuWD4OrFs96TDcueYqv7xXSys9RHf/B4LG8S0=
=nPDd
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
