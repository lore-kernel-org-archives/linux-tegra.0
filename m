From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 8/9] of/i2c: Resolve interrupt references at probe time
Date: Mon, 23 Sep 2013 09:34:51 +0200
Message-ID: <20130923073451.GE3051@katana>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
 <1379320326-13241-9-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lkTb+7nhmha7W+c3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1379320326-13241-9-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lkTb+7nhmha7W+c3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2013 at 10:32:05AM +0200, Thierry Reding wrote:
> Instead of resolving interrupt references at device creation time, delay
> resolution until probe time. At device creation time, there is nothing
> that can be done if an interrupt parent isn't ready yet, and the device
> will end up with an invalid interrupt number (0).
>=20
> If the interrupt reference is resolved at probe time, the device's probe
> can be deferred, so that it's interrupt resolution can be retried after
> more devices (possibly including its interrupt parent) have been probed.
>=20
> However, individual drivers shouldn't be required to do that themselves,
> over and over again, so this commit implements this functionality within
> the I2C core.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/i2c/i2c-core.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
> index 29d3f04..163a1e8 100644
> --- a/drivers/i2c/i2c-core.c
> +++ b/drivers/i2c/i2c-core.c
> @@ -236,6 +236,21 @@ int i2c_recover_bus(struct i2c_adapter *adap)
>  	return adap->bus_recovery_info->recover_bus(adap);
>  }
> =20
> +static int of_i2c_probe(struct i2c_client *client)

This function should be in the CONFIG_OF block.

> +{
> +	struct device_node *np =3D client->dev.of_node;
> +	int ret;
> +
> +	/* skip if the device node specifies no interrupts */
> +	if (of_get_property(np, "interrupts", NULL)) {
> +		ret =3D of_irq_get(client->dev.of_node, 0, &client->irq);

of_irq_get really sounds as it does refcounting. +1 to change the name.

Thanks,

   Wolfram


--lkTb+7nhmha7W+c3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSP+8bAAoJEBQN5MwUoCm2G9AP/Ay3YBsjFpAv5Ki2PC2bMrlS
7TV4G1bzGYDvSvDJHT/azoOF+5HofCL9iXtbuqX6CB352AphfHh4XIP+qKc9K4cN
e8K04mQpXhkrlOmC9HUB2z2QtLRCKBiaahKeH9OHTK9FtvqtIx2Xcn81WNQj742k
1Vn2EYVdF2YmfLQruAksT+9GxZNuy5Mk675HHK4nTquXPHlbhZMP8t8LpsBX/f7p
mgdPvcy6GREO6Yn8RJkxpdc3tyBo5IHuHwDyG1UGEDeVpMTlkYnrRszB0TzCwMEr
LOIQCbb9ZOPaU7ZEqZvz/cXB62jYPk0B9xMmhEjkiOgylzWmU0jxeVAkh7KO9ofu
hUZ3NNqLKaH1WChUvqGFbvwEWAbF5YisWquV4KSX8GlVaxoAco65WgjH6Oyy8xyJ
Hr1ZjtFY/w4DFLsS3v/K71ghFik/A/BZq73BPgw5LKM57NjSiQQJiVJpWODt2Gxe
tC/82zok4aGgeMbXrWt9MQ1pa3pG2gcl06hTjBRNcWU/8aX9Yspt3SNzkYHKQlYB
Hu27YJ4HyOn4hbB+QkmcyIFnsFSxPdnBW/6qPgAuo1VJ12erParTbXiupe5yejCi
Q79D0EzOaOtaD2mQ1JPx3m307kW6SqEuMdZVSfa7sX7Wk/BJe0emCWGZFmMehvfT
Ku3RPeKJrrkh4KVUMG84
=/7nF
-----END PGP SIGNATURE-----

--lkTb+7nhmha7W+c3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
