From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: of: Try to find an I2C adapter matching the parent
Date: Mon, 1 Oct 2018 01:02:30 +0200
Message-ID: <20180930230230.GE1059@kunai>
References: <20180925160611.17736-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0798460290=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180925160611.17736-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: rechner@vlado-do.de, dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0798460290==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Content-Disposition: inline


--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 06:06:11PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> If an I2C adapter doesn't match the provided device tree node, also try
> matching the parent's device tree node. This allows finding an adapter
> based on the device node of the parent device that was used to register
> it.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Hi Wolfram,
>=20
> This is a fix for the issue discussed in a long email thread a couple of
> months ago. In a nutshell the issue is that we want to be able to find a
> I2C-over-AUX adapter based on the device tree node (this is to hook up a
> I2C adapter for use as DDC to query EDID from a display panel, for
> example).
>=20
> Here's a link to the prior discussion, which ended up getting split into
> two for some reason, possibly because the initial submission and
> subsequent discussion took place over an extended period of time:
>=20
> 	https://patchwork.kernel.org/patch/9516105/
> 	https://patchwork.kernel.org/patch/10200879/

Ok, I read that...

>=20
> I never got around to submitting the patch properly, but here it is. As
> mentioned in the discussion linked to above, I think the problem here is
> that the new lookup via the parent device only happens when looking for
> the adapter from its device tree node. However, this also means that the
> children for the controller won't be added for these devices, because it
> only happens for adapters that have the dev->of_node set, not for the
> node reference by dev->parent->of_node. However, I'm not sure if that's
> really a problem. A device that doesn't have dev->of_node set would be a
> "virtual" I2C bus, as in the case of I2C-over-AUX. Proper I2C busses are
> still going to have to have their dev->of_node set, otherwise any child
> devices listed in device tree won't be added.
>=20
> Anyway, let me know what you think of this. Also adding Lucas, Rob and
> Andrzej to the discussion since they were involved back at the time.

=2E.. and it looks okay from that discussion point of view. And we could
stop reusing the parent's of_node for the adapter's of_node. Which is
better practice. Rob, can you confirm.

> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index 6cb7ad608bcd..37d34885ea2d 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -121,6 +121,14 @@ static int of_dev_node_match(struct device *dev, voi=
d *data)
>  	return dev->of_node =3D=3D data;
>  }
> =20
> +static int of_parent_node_match(struct device *dev, void *data)
> +{
> +	if (dev->parent)
> +		return dev->parent->of_node =3D=3D data;
> +
> +	return 0;
> +}
> +
>  /* must call put_device() when done with returned i2c_client device */
>  struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
>  {
> @@ -146,6 +154,9 @@ struct i2c_adapter *of_find_i2c_adapter_by_node(struc=
t device_node *node)
>  	struct i2c_adapter *adapter;
> =20
>  	dev =3D bus_find_device(&i2c_bus_type, NULL, node, of_dev_node_match);
> +	if (!dev)
> +		dev =3D bus_find_device(&i2c_bus_type, NULL, node, of_parent_node_matc=
h);
> +

To avoid the double loop iteration, maybe introduce
'of_dev_or_parent_node_match' and merge those two functionalities?

Regards,

   Wolfram

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluxVgIACgkQFA3kzBSg
Kbbo2A/7BCVeMlIuz9Ycd+CnkOnoZOYAS8NefcHF18ivFLysXB31tBgKic3u4n3r
3cZkeF0xJcbZDUWj4jnJ/459ZsJhtQ4Sq+zesZNmnkpvcU6VhfcDUqgbibqGornR
Mup0ksUmiBhWDhxdQhZyI2P/+HnpNVD1ih1CkXw8JWli1IGg6LJ3xRiaWp6oCOaU
yGPkeA+XVEwAhUuJnReHnoLvF14VLaQgLOhfmH3vtnsPRoOP0j5T0SOdUWHw38KV
36z60IXsfgYmDveZqIuCQK58tFciISQ1aIgZFN1NegETTgYcX3eQh4WZB+iwzhmg
9j5KOnR7i0Pdi7ACd0S9b5D/TJWRdPi7AAJN4u0r0BGyuvYZhClla+hU9dthcCux
djNbZBcTyXO3VGyEDq2TACE/SHytlIO2ojgdQVCNQgtBvvXDtfZtTqpNAO0LdGOO
E6cuvpcLu5/OwtMPKLcftviW6CXY3j7azmu5t6QoDD6g9Mi8bACJSW8EfuJnHoXf
mFMR2m6ScrHgILorcUTjSIOUxYwYjPW9dWWvXa+qn3/mmqzchthb0jFC3FT4vcNZ
MFZv39rMbcpiisU9xPgkAk8cc4qlRNKMyUJzr4B/4iUy3SpYIBB9c7RcQTVuY4a3
E031FF5ZH1UwdRL9dYPyiTc1BpymWUieLqkJDWdc79UIwnvNzUY=
=hpJ7
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--

--===============0798460290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0798460290==--
