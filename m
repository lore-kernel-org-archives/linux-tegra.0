From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 2/2] i2c: Add Tegra BPMP I2C proxy driver
Date: Fri, 10 Feb 2017 17:37:15 +0100
Message-ID: <20170210163715.mmukrlbgfjyyi7qp@ninjato>
References: <20170127083939.20393-1-thierry.reding@gmail.com>
 <20170127083939.20393-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="v6zxsqbvpjpconfy"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170127083939.20393-3-thierry.reding@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--v6zxsqbvpjpconfy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi there,

> +static int tegra_bpmp_i2c_msg_len_check(struct i2c_msg *msgs, unsigned int num)
> +{
> +	size_t tx_len = 0, rx_len = 0;
> +	unsigned int i;
> +
> +	for (i = 0; i < num; i++)
> +		if (!(msgs[i].flags & I2C_M_RD))
> +			tx_len += SERIALI2C_HDR_SIZE + msgs[i].len;
> +
> +	if (tx_len > TEGRA_I2C_IPC_MAX_IN_BUF_SIZE)
> +		return -EINVAL;
> +
> +	for (i = 0; i < num; i++)
> +		if ((msgs[i].flags & I2C_M_RD))
> +			rx_len += msgs[i].len;

You could have done with iterating over all msgs only once, but no need
to fix. I think I'll update the i2c core quirks feature to support your
case and rework that incrementally.

> +	/* TODO: move this somewhere else */
> +	memset(&request, 0, sizeof(request));
> +	memset(&response, 0, sizeof(response));

So? :)

> +	i2c->adapter.class = I2C_CLASS_HWMON;

Do you really need that?

> +	err = i2c_add_adapter(&i2c->adapter);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to add I2C adapter: %d\n", err);

No error message here, the core will do that.

> +static int __init tegra_bpmp_i2c_init_driver(void)
> +{
> +	return platform_driver_register(&tegra_bpmp_i2c_driver);
> +}
> +subsys_initcall(tegra_bpmp_i2c_init_driver);

Have you tried if subsys_initcall is really really necessary?

Thanks,

   Wolfram


--v6zxsqbvpjpconfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlid7DUACgkQFA3kzBSg
KbavMw/8CAE/h0iZri4pSzkNJRinzV92X1g3rIwnyh1Ay9vJrhvtmdptvmIilZ8n
9Hrbu5HmdIWjUdLEccmoyCVdzRxG9c4ollbWgf9pHza+PGiuBNXAX4dK0TeeQsHq
n29Y/76Pm8/CmUp4Z9Gh3SLU1rtRAOX/JdipKsXhujgGexiWUJXh8pqeVr9qufMo
spXQX65GldMhldOHfFzP+DRyH2ho+OyZnkIkbMkajGY9qMww191qSDQbGN7fy2pE
HENryHOKEnxIe+V+sYjviwRx93QBzK88dg7s7XFSzvmROwZfsGugy1f+fvJrx/B2
nGs+BfX/6cxTLcoHphjNaeaRkHEsjr9V1Zkvu96XSfdAgOiBP/iqOexrHLCUxsg9
f0luXBRsW9EOnR+7C6MklNFNfSsTA80nkRySlRISWeBCXZ5IPPZ/KgTV7fxO0PbE
YS2l5U/Q5ol+YO032KAYRwGk7/ghbe1ZdBoFRxRs56nziFU566EomBVd7UQKDFW4
j20XdY6bwwJxDusFiUZ7vlA0932tok9dQet0oRt9d/VyaV4E4cXkYcwFXVwjFIvi
toyy5ZXdDdlmVJTd1KKsQ9raW6NnmWCn7oo86f+H2PKfMXUpEQ7uXKp+3x4eCBph
T3H5XpPgS4e4HJVMut1xrmtjIu4BTFpBj6HQMte3LHN7JsOkBKE=
=Xw4M
-----END PGP SIGNATURE-----

--v6zxsqbvpjpconfy--
