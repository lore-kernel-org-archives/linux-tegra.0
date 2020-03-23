From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
Date: Mon, 23 Mar 2020 12:05:31 +0100
Message-ID: <20200323110531.GD3883508@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
 <b5fb83d8-003c-d76b-9dac-7c8ef15f2ab1@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b5fb83d8-003c-d76b-9dac-7c8ef15f2ab1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:55:39PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The EMC clock needs to carefully coordinate with the EMC controller
> > programming to make sure external memory can be properly clocked. Do so
> > by hooking up the EMC clock with an EMC provider that will specify which
> > rates are supported by the EMC and provide a callback to use for setting
> > the clock rate at the EMC.
> >=20
> > Based on work by Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> >=20
> > Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v5:
> > - major rework and cleanup
>=20
> ...
>=20
> > +static int tegra210_emc_resume(struct device *dev)
> > +{
> > +	struct tegra_emc *emc =3D dev_get_drvdata(dev);
> > +
> > +	emc->emc_suspend =3D false;
>=20
> Looks like the 'emc->emc_suspend' isn't really needed, nothing in kernel
> shall touch EMC rate at this point.

I've removed this.

> Perhaps should be better to make EMC clk exlusive in order to catch
> abusers, please see tegra30-emc suspend/resume for an example.

Good idea. Done.

> > +	clk_set_rate(emc->emc_clk, emc->emc_resume_rate);
> > +
> > +	pr_debug("%s at rate %lu\n", __func__, clk_get_rate(emc->emc_clk));
> > +
> > +	return 0;
> > +}
> > +#endif
> > +
> > +static const struct dev_pm_ops tegra210_emc_pm_ops =3D {
> > +	SET_SYSTEM_SLEEP_PM_OPS(tegra210_emc_suspend, tegra210_emc_resume)
> > +};
> What about to use the default suspend/resume level?

I don't understand. This is already the default suspend/resume level,
isn't it?

Thierry

--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54l/sACgkQ3SOs138+
s6Gcgg//XEFAg5FXQke9ezCAmIWt0qxVXLKGIpJAn6Own9QsP/hoyD89LVQwfmMI
JMow5JKbPdySRmJJ4Nb4ZLF1nT3Ma8eIPW58fGjaAlWodsmAdTpQTrD5s2dLsQRr
Pu5GuDUR+7rVAz7fpBZl+DJREyq0DThvnN5ojtGnAqaYJ8LSbJuJuG2+7VNLCGF/
YGIcH/xTYr+UvjPSQcnyxIjYLSqj6Y2KWJnCHeMeYm/5LFfsZ3l5p4fxAcVyS1E8
pw2ejNhajSx+6MbolV/2j0/4flKzFs5FTWdq8mJOpuPwsVO6a3vJAahl1Y2xzOib
BH8VZboNjnF1DYIO4QfqAzm116b2sTlm7rOV3czv3HYVtrrhIMX7RXNYHsTq5y+z
TkwBqnt9uYjRHFgR/H1z7aNRcyBeW6ec0oc7Xl2wZ7AZoSDojbrdmI9gEqjSQryu
DG1S484D0Tht+dhpHjYH3dIblsrfZiVJ9e3vyocFl8zdwRGOdbKXWl5gClF33yaN
5kgIJWWXbGakpSF0JguWG2NLdpvdhvCJqCl9Y1fmqPs6yull0ptPW/mwPl02Bi/8
5l9wo+QiUsg4PYWZf6NQ1Z77NXVyQCPmPJlO7RyWvQEyCJJIcpGAIxCfCbNSskZ5
hCGvCUvxx05WtqmhAw3jtaXzbmtg1DrYXeouAxUz0G2TjXi/46U=
=k3Qa
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--
