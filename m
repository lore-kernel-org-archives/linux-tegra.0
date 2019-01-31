From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 2/5] i2c: tegra: Add Bus Clear Master Support
Date: Thu, 31 Jan 2019 13:44:57 +0100
Message-ID: <20190131124457.GH23438@ulmo>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
 <1548915387-28826-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fd5uyaI9j6xoeUBo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548915387-28826-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--fd5uyaI9j6xoeUBo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2019 at 10:16:24PM -0800, Sowjanya Komatineni wrote:
> Bus clear feature of tegra i2c controller helps to recover from
> bus hang when i2c master loses the bus arbitration due to the
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
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V5/V6/V7/V8]: Same as V4
>  [V4]: Added I2C Bus Clear support patch to this version of series.
>=20
>  drivers/i2c/busses/i2c-tegra.c | 71 ++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 71 insertions(+)

See my comments on v7, with that:

Acked-by: Thierry Reding <treding@nvidia.com>

--fd5uyaI9j6xoeUBo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxS7ckACgkQ3SOs138+
s6GY5Q/9Hq082Qy6L09+W1CmZvGOnDiqAUC+sz/Ci7EcoUiDRfRXS86q1CLZWxGj
UT5fzk90sZDHSvx0pJLWjvnBy7laB21dYzUd4UowIf14/GmnqljluZ5AgA62Hg5z
go6JPXNB2/igk/5Px6PTOqO8LuJjYjk2uPcooahvYay+JuCRO9IBEMI0KrHKgwIA
8U2r1DjH6OKl6y9tJgg041Zt1m0sw/CL9bRVrfA/1w+WbNKOCQFpizFF9llaHa0x
KZ6DJw3EudNqdKyTs3RZ/vsmswPcPHeT2eqRgtUjKlCbwXdGs9TUXGAizNEKLp9W
wmEvI1J5kll/dW9s15ibyGPBm0MLaqw5xc3KAz2jz8WHLHpmfA3bC8tZ4uYhi9wV
SHrnAZXvjuPtVidf7tmMQ5FPvsNluJ3HbeD9WCxl1psNjBnnLn5tK1mGjCYd7L/2
H8q1jacZTsAf0CBw2k2XZDAoikNlrYCIWD2GbVRemwQJHZfJecGxygrI9AIc3729
K4ht8/wHoTTGm2cIl3GquCLMvzaAEf1I9jzFVgForE9WXHn/aB3OPCNPFHXWZ9P2
m7WYKOyvHn8nV/IndxdC+zqv3WWUsXfJgK9702qXdMoBrC5/0idmBC/BLd8x/XNF
QlIqgAE5JT/IkW2o770e4dj7KaYoCYn8BfthVX5kYbKxOxEiQ64=
=909g
-----END PGP SIGNATURE-----

--fd5uyaI9j6xoeUBo--
