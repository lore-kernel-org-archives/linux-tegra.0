From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 01/11] regulator: core: add API to get voltage
 constraints
Date: Wed, 7 Feb 2018 15:01:55 +0000
Message-ID: <20180207150155.GD6003@sirena.org.uk>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
 <1517934852-23255-2-git-send-email-pdeschrijver@nvidia.com>
 <20180206163544.GI5681@sirena.org.uk>
 <20180207084744.GG7031@tbergstrom-lnx.Nvidia.com>
 <20180207104351.GA6003@sirena.org.uk>
 <20180207123750.GA5850@tbergstrom-lnx.Nvidia.com>
 <20180207141846.GC6003@sirena.org.uk>
 <20180207143213.GB5850@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180207143213.GB5850-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 07, 2018 at 04:32:13PM +0200, Peter De Schrijver wrote:
> On Wed, Feb 07, 2018 at 02:18:46PM +0000, Mark Brown wrote:

> > You're going to have to provide a much better explanation of what this
> > is doing - right now it seems like an abuse of constraints.  Client
> > drivers can already determine if a particular voltage they want to set
> > is available via regulator_list_voltage() and so on, that's what
> > constraints are there to set.  It sounds like you're trying to use them
> > for something else but you're really not explaining your use case
> > clearly.

> There is no way to query what voltage I will actually get for a given input

I looked at patch 2.  It looked like an abuse of what constraints do,
and had zero explanation of why it was doing what it was doing.  In any
case we need the regulator code and changelog to be clear about what the
interface is for and why it should be used, that's not happening here.

> voltage. If you read drivers/clk/tegra/cvb. (you did do that right?), you
> will see that there is a minimum and maximum voltage defined by
> charaterization which needs to be capped to the regulator generated voltages
> for those points.

I can't really tell what you're saying here.  If the driver needs to
know if it can set the a given voltage there's already an API for doing
that as I said.  If you're trying to convey this minimum and maximum
voltage via the constraints that sounds like an abuse of the constraints.

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlp7FOIACgkQJNaLcl1U
h9Aspgf+MssimMSW7Qbj2UivzOJ4IsFXPul0dhXEZnBgvN+DwYbMkV8MG7g1bWdr
M7Z0LE3RLyd/oVzJihAA99ROWs1lFlwFVzKphlqMcMHU9x2ZzYfjJwhnlwNP9AjL
SSGfYCyaD6BqfCF8aEWmpe0XXu107XivI7BYlYU5TBjbCh8NWMBDBXZjdC68PON+
/bKFnhujKGW6kV+fksmorZQ4u3Tz0LXFJRQc3shsU8Aw4q+Jh2kirmXYP8Iu8Cp3
0xRE49lwrhw//uwg61C7PY9VHzns/vFwH7goskLWhGVjbmmscz1qmnz0dQ9xrIjE
TMZiVXKZonoqEXuJfWyDlTV6fCZhHg==
=2qiR
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
