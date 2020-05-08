From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Date: Fri, 8 May 2020 12:31:30 +0200
Message-ID: <20200508103130.GB3030605@ulmo>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2a0404ac-73bf-2f27-9147-8bef28ae995f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 12:50:09AM +0300, Dmitry Osipenko wrote:
> 06.05.2020 22:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Depending on the board design, the I2C controllers found on Tegra SoCs
> > may require pinmuxing in order to function. This is done as part of the
> > driver's runtime suspend/resume operations. However, the PM core does
> > not allow devices to go into runtime suspend during system sleep to
> > avoid potential races with the suspend/resume of their parents.
> >=20
> > As a result of this, when Tegra SoCs resume from system suspend, their
> > I2C controllers may have lost the pinmux state in hardware, whereas the
> > pinctrl subsystem is not aware of this. To fix this, make sure that if
> > the I2C controller is not runtime suspended, the runtime suspend code is
> > still executed in order to disable the module clock (which we don't need
> > to be enabled during sleep) and set the pinmux to the idle state.
> >=20
> > Conversely, make sure that the I2C controller is properly resumed when
> > waking up from sleep so that pinmux settings are properly restored.
> >=20
> > This fixes a bug seen with DDC transactions to an HDMI monitor timing
> > out when resuming from system suspend.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/i2c/busses/i2c-tegra.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
> > index 7c88611c732c..db142d897604 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -1769,10 +1769,14 @@ static int tegra_i2c_remove(struct platform_dev=
ice *pdev)
> >  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
> >  {
> >  	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> > +	int err =3D 0;
> > =20
> >  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> > =20
> > -	return 0;
> > +	if (!pm_runtime_status_suspended(dev))
> > +		err =3D tegra_i2c_runtime_suspend(dev);
> > +
> > +	return err;
> >  }
> > =20
> >  static int __maybe_unused tegra_i2c_resume(struct device *dev)
> > @@ -1788,9 +1792,11 @@ static int __maybe_unused tegra_i2c_resume(struc=
t device *dev)
> >  	if (err)
> >  		return err;
> > =20
> > -	err =3D tegra_i2c_runtime_suspend(dev);
> > -	if (err)
> > -		return err;
> > +	if (pm_runtime_status_suspended(dev)) {
> > +		err =3D tegra_i2c_runtime_suspend(dev);
> > +		if (err)
> > +			return err;
> > +	}
> > =20
> >  	i2c_mark_adapter_resumed(&i2c_dev->adapter);
> > =20
> >=20
>=20
> Is it legal to touch DPAUX registers while DPAUX is in a suspended state?

DPAUX is never runtime suspended and the dependency from the I2C
controller on DPAUX should ensure that they are suspended and resumed in
the right order during system sleep.

Thierry

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl61NQEACgkQ3SOs138+
s6GjtA//Q0nDwPEFe97oobpaRT2DP6tcG8oDw9mHJnLMqn8mNQr145SPgU0+lfCB
KM9HJz1OnKkyOgaCvnGOdWvb+dRD9embfUE1KPGA7/X3V4Hz9cmN1Keto/8JqlQ3
Xi+arMst7m3k930d2UFiH7HyAq0VzorCvkCzn96tLO5BctV/Y3VWcAIvo67tKqVX
mpjxYvd9YkScfrH1iaYBH9NvdLBCXZ/Env6iafAMHJB4+xr+UpMq6VotN2qJ0uny
EkSxyfzc9+anr+T6+dDms//4X+xVOyOXbDHQUaqC9WZPRmDnmvRxnAgGLtWM/pIR
IHUjg8Nrz+mvlX4Nc4o0KJsMUPoyLhL5nP0dtT6QAcZUe7FQaLDF51UGIufPfOCU
Xhde4FJtT6T5GHlFTlm+Yu7L5InYjr9QWG4UK2apl/2KrEya5hB4wj43sX++Dcrp
HdvzzMjjsuXAcpS0Rlj7mdAvMLi9AVfX4fanyMz6aHvrINbEUvHWKbESrToSooOg
Kr2intv9VgaaaRDZFudc50SQsQCtuerD8MG7xS4QLQTPFsvextiObtdYK6IQSyr3
n1Fw5g8y89HJ7NeiofpjHdS/PCRrkS6GIw7iP63K8O4JJRLHFppccb1ojsvWsJDD
cVr2Y64YLYiU/0rcDvR+oYIikcSJA1kRIiDvSBW7OKMgEp5Pu08=
=rWk2
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
