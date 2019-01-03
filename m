From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V3] i2c: tegra: Fix Maximum transfer size
Date: Thu, 3 Jan 2019 20:05:52 +0100
Message-ID: <20190103190552.tspqarvalqxlz7yu@ninjato>
References: <1546472423-31366-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xvcagbsjzare2ch3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546472423-31366-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--xvcagbsjzare2ch3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 02, 2019 at 03:40:23PM -0800, Sowjanya Komatineni wrote:
> Tegra194 supports maximum 64K Bytes transfer per packet.
> Tegra186 and prior supports maximum 4K Bytes transfer per packet.
>=20
> This patch fixes this payload difference between Tegra194 and prior
> tegra chipsets using separate i2c_adapter_quirks.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

  CC      drivers/i2c/busses/i2c-tegra.o
drivers/i2c/busses/i2c-tegra.c:171: warning: Function parameter or member '=
quirks' not described in 'tegra_i2c_hw_feature'


--xvcagbsjzare2ch3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwuXRAACgkQFA3kzBSg
KbYMHA/+LnD+R8d8bIvoJv5o1QHm/gDf8I5+0TUCFWzj0TLrn4cvN1OM0k6O0O0K
CB/uCvCdKvpDKxMxXPC+v8TdzVK9EYJyPrS9LeXaPYHTxGuTzsiy6MPhpO4ScPWc
ELpQILlgXoU+ShA06eKcgp35rmEySZQiedKuGv/U927TbZO13glHLizFhwfRVpBl
XmWg3Hdiqljt816BLWupSI7kLt16bdbdgzEz2nPA1JzjKtsn0zimDQd7rcDuIkOw
iCP8TmlkNE6CGrcA94mi1V+EWIWjBZ0ajYoc1rMoEA80O0gKgZRwxUpupY9YCioV
mlp8fcvc34A2iw6q9hXcjr0ZPwTMTp56JwxpQqa97Yd9haaoZ7d4pXsTMTSQAOZK
I7c4T6K5pM4Tmdp2doqa7/tAdU4VOGIMUAxqjh/BDQqb5B+/afV/RziYKX0NXf4m
u3B00hfmogXLE/Lx5TxL08hROVCjV507jHcqwszrW07OkAfafz/D4BZfAmFERYh5
P7zJIoJyvbDDhXzqfw7BuNsujJep7bv41GpTASHtnnYyk2MOXJk9OSZkUc2xpsXC
ISvO3WFQnfW1+YUYFzdt/ODFOjgYwkk5RF4+76VrNUKz6aWFZfybnowXvBpg+61j
3Ub6NhuA6IQPyqL8KhtXyqTItQrmOToDL9mduWq4ehXdCwbLhnM=
=v9r4
-----END PGP SIGNATURE-----

--xvcagbsjzare2ch3--
