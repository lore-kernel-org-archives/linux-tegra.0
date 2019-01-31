From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 3/5] i2c: tegra: Add DMA Support
Date: Thu, 31 Jan 2019 13:06:40 +0100
Message-ID: <20190131120640.GF23438@ulmo>
References: <1548864096-20974-1-git-send-email-skomatineni@nvidia.com>
 <1548864096-20974-3-git-send-email-skomatineni@nvidia.com>
 <1f10cb76-59a1-93c5-ae03-ccc0cd8db1a3@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dWYAkE0V1FpFQHQ3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1f10cb76-59a1-93c5-ae03-ccc0cd8db1a3@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--dWYAkE0V1FpFQHQ3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2019 at 03:05:48AM +0300, Dmitry Osipenko wrote:
> 30.01.2019 19:01, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
[...]
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
[...]
> > +		return -EIO;
> > +	}
> > +
> > +	dma_desc->callback =3D tegra_i2c_dma_complete;
> > +	dma_desc->callback_param =3D i2c_dev;
> > +	dmaengine_submit(dma_desc);
> > +	dma_async_issue_pending(chan);
> > +	return 0;
> > +}
> > +
> > +static int tegra_i2c_init_dma_param(struct tegra_i2c_dev *i2c_dev,
> > +				    bool dma_to_memory)
> > +{
> > +	struct dma_chan *dma_chan;
> > +	u32 *dma_buf;
> > +	dma_addr_t dma_phys;
> > +	int ret;
> > +	const char *chan_name =3D dma_to_memory ? "rx" : "tx";
>=20
> What about to move out chan_name into the function arguments?

That opens up the possibility of passing dma_to_memory =3D true and
chan_name as "tx" and create an inconsistency.

> > @@ -884,6 +1187,8 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_de=
v *i2c_dev)
> > =20
> >  	i2c_dev->is_multimaster_mode =3D of_property_read_bool(np,
> >  			"multi-master");
> > +
> > +	i2c_dev->has_dma =3D of_property_read_bool(np, "dmas");
>=20
> Not only the existence of "dmas" property defines whether DMA is availabl=
e. DMA subsystem could be disabled in the kernels configuration.
>=20
> Hence there is a need to check for DMA driver presence in the code:
>=20
> 	if (IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
> 		i2c_dev->has_dma =3D of_property_read_bool(np, "dmas");

Do we even need the ->has_dma at all? We can just go ahead and request
the channels at probe time and respond accordingly. If there's no dmas
property in DT, dma_request_slave_channel_reason() returns an error so
we can just deal with it at that time.

So if we get -EPROBE_DEFER we can propagate that, for any other errors
we can simply fallback to PIO. Or perhaps we want to restrict fallback
to PIO for -ENODEV?

I wouldn't want to add an IS_ENABLED(CONFIG_TEGRA20_APB_DMA) in here.
The purpose of these subsystems it to abstract all of that away.
Otherwise we could just as well use custom APIs, if we're tying together
drivers in this way anyway.

> Also Tegra I2C driver should select DMA driver in Kconfig to make DMA
> driver built-in when I2C driver is built-in:

I don't think there's a requirement for that. The only dependency we
really have here is the one on the DMA engine API. Since dmaengine.h
already provides dummy implementations, there's really no need for
us to have the dependency. If the DMA engine API is completely disabled,
a call to dma_request_slave_channel_reason() will return -ENODEV and we
should just deal with that the same way we would if there was no "dmas"
property present.

Thierry

--dWYAkE0V1FpFQHQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxS5M4ACgkQ3SOs138+
s6FDEw/+JxOcZL0QNOUsgqN799nEJ7ytF+t9JghF5uJacTi7Ez0ievlZVZk+kpTb
xRLHMY67MlcuiW4zKB9H6qAPUj0vXJLrSOFR6P0DXf23KOtRsmavgUzO3tp6EI1h
23TPmPwQJE1my4Q2VOovaJ9Oc0UrL3r5mYZBf+2eqJcFHZwgCKTo1OwUCOO9rELK
gaYX1lkWC0MLO5LbSSJqVi3y13V983C5WWrn3KTzzZVSI4oYafknAAE2248E0UQZ
cuF+4XWsPi8iEbk0fsKe8/rrDOcd5cA3YxjMHQ1N3SiwQx0817jtqgOaavQkee8F
51Z/yyQrWCPkPiBjaPyoWs3eTWTmg2Kl6ukItnU8rQok5nWdAiVfsDRev6gvV8oD
N+z8x/m/xuQ+ucqz+7NhEtyp2dWUOuhtRDjdFivr2Yoo5ye1f11CUuNRVHpd9Qbd
2AXwZFqSsPHaLM6lwYRL0eJA4vyRNI9fnKxRi+ng+1Z1H5LXInvdWYE4TpoyhY81
zOMw183VtmP9uJXbf9TZOQ84ims8RNamHKTyd2AEKWwUu4fmIkkxh057RA34iQuK
iXGv/cJPRE6KiR8ZIq66Usro+YZE2hya+lnWNWS3p0gPdiLqYhSZO/0UZWyqXH9k
C/0VdaxE6hVpYCkQhFFV4B1YOwmgFsuE+nt/izyJO9i794CuA/I=
=p6wt
-----END PGP SIGNATURE-----

--dWYAkE0V1FpFQHQ3--
