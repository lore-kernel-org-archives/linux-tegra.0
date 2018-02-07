From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 01/11] regulator: core: add API to get voltage
 constraints
Date: Wed, 7 Feb 2018 15:37:11 +0000
Message-ID: <20180207153711.GE6003@sirena.org.uk>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
 <1517934852-23255-2-git-send-email-pdeschrijver@nvidia.com>
 <20180206163544.GI5681@sirena.org.uk>
 <20180207084744.GG7031@tbergstrom-lnx.Nvidia.com>
 <20180207104351.GA6003@sirena.org.uk>
 <20180207123750.GA5850@tbergstrom-lnx.Nvidia.com>
 <20180207141846.GC6003@sirena.org.uk>
 <20180207143213.GB5850@tbergstrom-lnx.Nvidia.com>
 <20180207150155.GD6003@sirena.org.uk>
 <20180207152045.GC5850@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180207152045.GC5850-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 07, 2018 at 05:20:45PM +0200, Peter De Schrijver wrote:
> On Wed, Feb 07, 2018 at 03:01:55PM +0000, Mark Brown wrote:

> > I can't really tell what you're saying here.  If the driver needs to
> > know if it can set the a given voltage there's already an API for doing
> > that as I said.  If you're trying to convey this minimum and maximum
> > voltage via the constraints that sounds like an abuse of the constraints.

> No, what I want is the voltage which the regulator will output for a given
> regulator_set_voltage request taking constraints, regulator step etc into
> account.

Knowing the range of the constaints is going to tell you nothing useful
about that, it has zero information on steps or anything.  The way to
find out what voltages can be set is to enumerate the voltages that can
be set through the existing API and then if you want to set a specific
voltage that you've confirmed is available you can set exactly that
voltage via the normal voltage setting interface, no need to provide a
range.

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlp7HSYACgkQJNaLcl1U
h9BRDAf9FdaH1tOaZcNU2t7spzIT8bqpr3eAGIuF9GdmskpVdhVYL2z/iik+AAWA
5dvU5+U4UfexPA6KB0lZFVASav5z8XuUdk+t0GH45MGYIramZTSm6ouCpQXor7YD
DtVtWRw0oNJIgBesUpC3Vfa0JVpuwbkce4GzvmlzLMB/Jd1nEJkjxJm3l14k997k
njGXu7R/9hI1uwLFSwoMdDFQME49766JgVrp5cVOySWbK2c4c/l9+iL4Xg+TuGpP
REVfT2NC4ZNWH7BlqtdUqdwzO1bE9F+WaVh/0bfNbtrHgHV+0XWYNNv2IFTDtYvl
pOPsqdXTfJ8HlKeSjw7f0SqZdWU52g==
=lJXf
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
