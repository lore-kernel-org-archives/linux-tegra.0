From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Date: Thu, 7 May 2020 12:03:15 +0200
Message-ID: <20200507100315.GA2890327@ulmo>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <20200506224336.GA23423@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200506224336.GA23423-cHozx32mtrEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mirq-test-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2020 at 12:43:36AM +0200, mirq-test-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org wrote:
> On Wed, May 06, 2020 at 09:33:55PM +0200, Thierry Reding wrote:
> [...]
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
> [...]
> Shouldn't this be negated as in suspend? I would assume that inbetween
> suspend and resume nothing changes the stored state.

I know this is confusing because I have now twice had the same doubts
after looking at the patch after I sent it out and thought I had sent
out a wrong version.

However, I think it starts to make more sense when you look at the
resulting code, which I'll reproduce below:

	static int __maybe_unused tegra_i2c_resume(struct device *dev)
	{
		struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
		int err;

		err =3D tegra_i2c_runtime_resume(dev);
		if (err)
			return err;

		err =3D tegra_i2c_init(i2c_dev, false);
		if (err)
			return err;

		if (pm_runtime_status_suspended(dev)) {
			err =3D tegra_i2c_runtime_suspend(dev);
			if (err)
				return err;
		}

		i2c_mark_adapter_resumed(&i2c_dev->adapter);

		return 0;
	}

So the purpose here is to runtime resume the I2C controller temporarily
so that the register context can be reprogrammed because it was lost
during suspend. Now, if the controller was runtime suspended prior to
system suspend, we want to put it back into suspend after the context
was loaded again. Conversely, if it was not runtime suspended, then we
want to keep it on.

If it helps I can sprinkle some comments throughout this function to try
and explain why exactly this is being done.

Thierry

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6z3OAACgkQ3SOs138+
s6EuehAAogxFDT5rRRkKex6Gppi0OnhVKA91lY8Rayw8JdkFPmcaIuNdIW4N+16T
eQdVwiWAIh3lXJLfXzGHg8wiL9HTO2z04tc4KeeFATCQbFVmfQMKiQRgifJIn9qI
8IdRUdRv75fc1MjpWcJqp5Mb2KiOUplopPmwUmdAZjYhJ45BQr/O4/a1sQJd0hvL
RWCXmbDPAiqO/ssmCXudkCmAUTN4fcP9Tk2eaYRAs73nt8VjPnJ4eg1DN3DdeZxk
BngPeMHHPP4RjTCyJ54xHz7iSbymSCaV2C1aIJ3ahYomuX/lelWpYdkgUjo9AS+A
ieEWYTlbHaHSVgVRSj5GyON86ph9JAF3TnaJvdHMlzvIvGyIplcHrjcHTWcE2AJr
zglMh5EnhfO+ILOTUa279lVCc5SQMDFYAtuc66zhJHoFXsv0NnCB6KunqeUw4KYW
DGvzVmGrXJZ8x/cWelSXwInlzVDqqQxF8RFtG0peO8/tnNSNVRx33qFSHUxeIfEf
VTiuc3GUuDoOlw9EHmFVII3+EsZ9PHcfPUDlwRTAEq8Xl9tc5OKiqMLhfpAiiFj7
7Er34qUNL5lIXaLnc4W9jDO3jRfekhVx2xJB43OM/jRuPQ2VwTphhd8TmoZr1xFy
8dJta3tH0OLDX0hOtvTVivc7F2nt9fdwexfdGCPc2CKwUoJ1YXU=
=12NZ
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
