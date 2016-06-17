From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 08/13] i2c: core: Add support for 'i2c-bus' subnode
Date: Fri, 17 Jun 2016 18:24:29 +0200
Message-ID: <20160617162429.GG27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-9-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gvF4niNJ+uBMJnEh"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466165027-17917-9-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--gvF4niNJ+uBMJnEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:03:42PM +0100, Jon Hunter wrote:
> If the 'i2c-bus' device-tree node is present for an I2C adapter then
> parse this subnode for I2C slaves.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/i2c/i2c-core.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
> index 952d2f0c02c5..f552d97bad32 100644
> --- a/drivers/i2c/i2c-core.c
> +++ b/drivers/i2c/i2c-core.c
> @@ -1452,7 +1452,7 @@ static struct i2c_client *of_i2c_register_device(st=
ruct i2c_adapter *adap,
> =20
>  static void of_i2c_register_devices(struct i2c_adapter *adap)
>  {
> -	struct device_node *node;
> +	struct device_node *bus, *node;
> =20
>  	/* Only register child devices if the adapter has a node pointer set */
>  	if (!adap->dev.of_node)
> @@ -1460,11 +1460,18 @@ static void of_i2c_register_devices(struct i2c_ad=
apter *adap)
> =20
>  	dev_dbg(&adap->dev, "of_i2c: walking child nodes\n");
> =20
> -	for_each_available_child_of_node(adap->dev.of_node, node) {
> +	bus =3D of_get_child_by_name(adap->dev.of_node, "i2c-bus");
> +	if (!bus)
> +		bus =3D adap->dev.of_node;

Maybe
		bus =3D of_node_get(adap->dev.of_node);

here...

> +
> +	for_each_available_child_of_node(bus, node) {
>  		if (of_node_test_and_set_flag(node, OF_POPULATED))
>  			continue;
>  		of_i2c_register_device(adap, node);
>  	}
> +
> +	if (bus !=3D adap->dev.of_node)
> +		of_node_put(bus);

=2E.. and drop the extra check here?

Thierry

--gvF4niNJ+uBMJnEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCQ8AAoJEN0jrNd/PrOhdZYP/1wY+NhmNXmVn1KnCHvxdA+7
BTnFDqczvsXo/xdBSPVmvmCMnt1bvL8RQj2PKkrRNuODFaEBfyIjeezG49fTfkZV
GOyVPQoW/h9Ndaj6nquGgL/mBOcyDd7BA2soNX7vLsx43+r7q4ADzdKjJ/OAHU/p
cgZ3raIIRsRkVMOuJBSc7+qM11J0L1Txsza2yWbPCqkLKoB/535Ow7gp9Rf1JKBk
QP+HsNwI1MZxQhX55cAOpZ8+ANaVQiLxXNcvaQqnWGuL/YuCllQRVHapinB0QLMc
Q/nxSGJ9hDmHWg+pSZmW1nLJmG6DXAk0VUH8LIJZFGS0Q16ED0GJggbWXdKco4LU
WYiwn6kIqBj+Gn3dJ8JL7uSLv4fxAnkac2wfds9ZYhN2Pp3sgdHWzwYbiGNbIsqP
Pmkx9rnqtHNUlHgFsIqflzPjMCmQiAt/Q23O6nZKetGsd079tsyAZ+T8ozXQVI/v
RFGt9WaTT+cVQMq6uIqOqeILaLoDzoMGfhxZgo4eAcnL0bF3qFToI0AW7EFLchg2
HSVaCxTvxuZdCNdY5LtO33UBFMdNEap2VvkkIlqj2Pnln0V8q6Za3TOdvVHFazZf
9dVomWe0Vj6mGo2TN8m2BmFYNpDCwhrlZyaYX2I8m4z3aFBZ1D3icUczet3+xbKd
19KqpJV+o2kQUuglI+zN
=tTEE
-----END PGP SIGNATURE-----

--gvF4niNJ+uBMJnEh--
