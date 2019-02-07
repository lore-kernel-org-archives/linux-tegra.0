From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 17:02:27 +0100
Message-ID: <20190207160227.GA17445@ulmo>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
 <a6b1acbd-9be0-62b7-29bb-081d93ee92fb@gmail.com>
 <BYAPR12MB3398712D185CCCB345EB2B5BC2680@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BYAPR12MB3398712D185CCCB345EB2B5BC2680@BYAPR12MB3398.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2019 at 03:11:06PM +0000, Sowjanya Komatineni wrote:
> >=20
> >=20
> > > @@ -1124,6 +1453,10 @@ static int tegra_i2c_probe(struct platform_dev=
ice *pdev)
> > >  		}
> > >  	}
> > > =20
> > > +	ret =3D tegra_i2c_init_dma(i2c_dev);
> > > +	if (ret < 0)
> > > +		goto disable_div_clk;
> > > +
> > >  	ret =3D tegra_i2c_init(i2c_dev);
> > >  	if (ret) {
> > >  		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
> >
> >
> > Missing DMA resourcing release on probe failure.
>=20
> If probe fails due to other reasons, then I2C interface will not be
> available and boot will not even happen.
> Do we need DMA resourcing release?

It's also possible that probe will fail for one of the I2C controllers
that is not critical to basic system functionality. You don't want to
leak these resources because it's bad practice (other people reading the
code may conclude that it's okay to leak resources).

Also, if everyone is really careful about not leaking resources, it
makes it much easier to track down leaks.

Thierry

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxcVpAACgkQ3SOs138+
s6Hoxw/+NcIdkyYd3PVqW2LsaKXT0vVD59qHSMamsVIWFn8cte8syifEDmFLDvi0
uSLGliFbyPprH9xDtZd0ZZ8KwGlMe8XQbU22clpsvtZ+fj1qY1KymRfxrH8mfS4t
114rQAcewGmpMJSWBmaV+g1kgp397E4FtwFUsdKZcWRrQXAFlNyqZFYQVKg1zUmV
w28rJ9faQeWy3c5H9+LQhzJMC5kBGgN21J37sHwCchwnBtVPXnIojh+nfpDfwE5y
tJG2m6T7YM8VGyvJUpJaz0iVYU3ELxqACCS7y4EPRefb5x9n0Wpm+7jbeSDo7nyK
E9YQd2sqVBQz1qL4EApF7Y3pUyPs44Ch2FdsZwLnp/ynFkmP+s5hPWSLVw8yOGve
5kq0G6uKATVYgy/79eXGynhBF6kLFtUiaEg38OAC5BPWtmk/Gpc75tVm5KMR1c65
asW2hXb0Fa+4Jp4PZ83nHJNsj8DcQX+yRXPPsHnhddWsKmBU9lYIMZxWhQjEAAZ8
54oRd67M4ceivxwut/ew1QOgMZhqQ6YDoDbX3VZ+0sFUXQPOUEsOYiDBOVuNw/cx
tvhsohTL9OkrFKdFH2Y30ax8sO1nWstj1Vj5nIajZqVr5q47WEZRMqTaQ1ssHsrM
wT7Xq7KRBQu3E1uBGVAlcLyiShce61ONjdgi+SckE0WlCJeqJsM=
=TjFG
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
