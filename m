From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V18 2/6] i2c: tegra: add bus clear Master Support
Date: Mon, 11 Feb 2019 13:44:32 +0100
Message-ID: <20190211124431.kys66uzp5hwa5ret@ninjato>
References: <1549652382-5476-1-git-send-email-skomatineni@nvidia.com>
 <1549652382-5476-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yt4liwd2sdc4itsr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549652382-5476-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, peda@axentia.se, digetx@gmail.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--yt4liwd2sdc4itsr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 08, 2019 at 10:59:38AM -0800, Sowjanya Komatineni wrote:
> Bus clear feature of Tegra I2C controller helps to recover from
> bus hang when I2C master loses the bus arbitration due to the
> slave device holding SDA LOW continuously for some unknown reasons.
>=20
> Per I2C specification, the device that held the bus LOW should
> release it within 9 clock pulses.
>=20
> During bus clear operation, Tegra I2C controller sends 9 clock
> pulses and terminates the transaction with STOP condition.
> Upon successful bus clear operation, bus goes to idle state and
> driver retries the transaction.
>=20
> Acked-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

We have a bus recovery infrastructure in the core. Tying your code into
it should be easy. You probably just need a 'struct
i2c_bus_recovery_info', populate the 'recover_bus' callback with
'tegra_i2c_issue_bus_clear()', and attach this struct to the 'struct
adapter' if the IP core supports bus recovery, otherwise leave it empty.
Then, you can...

> +static int tegra_i2c_issue_bus_clear(struct tegra_i2c_dev *i2c_dev)
> +{
> +	int err;
> +	unsigned long time_left;
> +	u32 reg;
> +
> +	if (i2c_dev->hw->supports_bus_clear) {

=2E.. remove the if here because the core will check for a valid
i2c_bus_recovery_info...

> @@ -759,6 +818,13 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *=
i2c_dev,
>  		return 0;
> =20
>  	tegra_i2c_init(i2c_dev);
> +	/* start recovery upon arbitration loss in single master mode */
> +	if (i2c_dev->msg_err =3D=3D I2C_ERR_ARBITRATION_LOST) {
> +		if (!i2c_dev->is_multimaster_mode)
> +			return tegra_i2c_issue_bus_clear(i2c_dev);

=2E.. and use simply i2c_recover_bus() here.

This will help making bus recovery use consistent across drivers.

Thanks,

   Wolfram

--yt4liwd2sdc4itsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxhbisACgkQFA3kzBSg
KbaXfw/8D5oseEP3Y/5D8I63l1EVBNyE3QSoHKp6mPkNltlBc+AS6LlZqo5rbu+R
nW61wGlOxlIFyCknQu2hcOk1+nqmGCeeHdXTS3qu9VN+Lb3oeMPQigLLrPnE/To+
2EUJQtX54Tp17YwJLBQjllKwBuCUDue78Sn8BaEV6e7HzuIY/UaeezWVXU4/K7uA
t1xM8vU+G38Pi1FK68EnFo0rT/OGqrNLLBv3yT/zUj+6SAtE8lbQzboq9HRnWMmD
9TlsiBlZBV2eDgT2yEOA6e4v2FPEg/wMcY0CBb5FGYVGcOb3PRRg6xAUON0fy9Kn
qVQePBgOLsX+KooENUsvPsECZLhHtRHWw6BEs7r+rZq8zf3OCb3uk5fkG0fnl1xE
tTtB0RUSRWrHmZiT40qT7ElxmLHkjbM/sNZ+weCv9/V4NRnzpcPP0HQR14kg/bey
MM9b+BhxhiGZR112eqP0Fe7HHBWz6s27aCKNUayd6il/Vv+jhYt/WGPj5S1eSVYp
ASFxOxioRyOgH8nOBNFsy1Xh1C/T7PHlmTuhdUEOD1SDjZ/GeDCbVvt8kU3Pq1j5
+XPH4mCPzl9BSJaJ6RsDRVr5AY4wIR+WJNiWIA7mGQjb7d/1a2ET2vhU85H8otTF
+rk0Sw/R8GFrfN1k3vsCjNAfDLY4FFkJmt+mNJhNhMB5fG67zI0=
=nRY5
-----END PGP SIGNATURE-----

--yt4liwd2sdc4itsr--
