From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V9 4/5] i2c: tegra: update transfer timeout
Date: Mon, 4 Feb 2019 08:54:54 +0100
Message-ID: <20190204075454.GA19087@ulmo>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-4-git-send-email-skomatineni@nvidia.com>
 <53b3f00f-b3a8-e1ef-b04b-1bdd5f5473ce@gmail.com>
 <BYAPR12MB3398D89D631E65C484DC8267C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BYAPR12MB3398D89D631E65C484DC8267C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2019 at 07:37:45PM +0000, Sowjanya Komatineni wrote:
>=20
> > > BYTES_PER_FIFO_WORD 4
> > > =20
> > >  #define I2C_CNFG				0x000
> > > @@ -893,8 +892,9 @@ static int tegra_i2c_issue_bus_clear(struct tegra=
_i2c_dev *i2c_dev)
> > >  		i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
> > >  		tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
> > > =20
> > > -		time_left =3D wait_for_completion_timeout(&i2c_dev->msg_complete,
> > > -							TEGRA_I2C_TIMEOUT);
> > > +		time_left =3D wait_for_completion_timeout(
> > > +						&i2c_dev->msg_complete,
> > > +						msecs_to_jiffies(1000));
> >
> > So potentially tegra_i2c_xfer_msg() could take more than 1 second
> > and then fail with -EAGAIN, correct? In that case we should set
> > adapter.timeout in probe to a larger value:
> >
> Bus clear pulse threshold we are setting is 9 (default as per spec) so
> bus clear should happen after finishing sending of 9 pulses.
> So 1sec is very long time for bus to get released and in case of ARB
> LOST whole transfer to return EAGAIN will be much less then 1sec

What if for example we have a very long transfer, say some 64 KiB on
Tegra194 and about 95% through the transfer something causes the bus
to lock up. The transfer so far would've taken something on the order
of 5 seconds, but we'd still fail, potentially with -EAGAIN, right?

Or is there some other mechanism that would prevent the above from
happening?

Thierry

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxX78wACgkQ3SOs138+
s6EljhAAt+MUmk+ZOHT9xpvGDUq5ASvO4Na15Hhu+NjQ6oA+voUmUBy1eaQBaeQz
lcndp3hcsUio6hhYpcuFv/3ltAgpJI2UuL3gYsDuNTWtwHuf4Sma52uSRvrx7kDg
kDZQgmJ4V7i2+8cHYTmvoOX2UCX5DaI9Xr7yZNcluJ8M8sGpUU2553Ya5MXH0jlt
0UWmpXtK97wtmvAtf0Uy7y1DtwU4uGLQFpurSvt985SfwlfhUmjJwAO0ZNstyBxv
1OP0ht11nMjYrGxxuUsNpycTzpmCzdpujTTtH5VrvXdl7mUEbwHMyNqbLmUmc7e7
6o0wG7cABcRTYmEOylxsQZwm7slncDZ3fdDanhdpFR5Rn3Nf555wBWJ2aFb/ikhF
cSju4Cr3jsRIAFJQ+fjqONohgINtG4Squr7V54DzDpr3rKyLEFBXRPXENAdzwETa
XoNj9M8oupw8g240RAiWzz7/LcBDtSYZomCQcFFGtMU90DePXuPhEaJ4K0DdDjE9
HV3fn4ahH+VdAjT3QUtSLutANh3tJGZKH+drYqdIt9D5j7RRX+Dms6Awdljh4HPs
4gavF4OBDzDtW9sQZB074LVSY+5fBqYlJIEHcMXRWnqfHM0Es6R0ecJaljU9zSe9
5LdQ3UhbjVOkCSyh1QPcpTWro1i1MUsNKXbbF0jFPFmC4Nfel5M=
=70Q9
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
