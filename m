From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 01/11] regulator: core: add API to get voltage
 constraints
Date: Thu, 8 Feb 2018 14:58:34 +0000
Message-ID: <20180208145834.GA27520@sirena.org.uk>
References: <20180206163544.GI5681@sirena.org.uk>
 <20180207084744.GG7031@tbergstrom-lnx.Nvidia.com>
 <20180207104351.GA6003@sirena.org.uk>
 <20180207123750.GA5850@tbergstrom-lnx.Nvidia.com>
 <20180207141846.GC6003@sirena.org.uk>
 <20180207143213.GB5850@tbergstrom-lnx.Nvidia.com>
 <20180207150155.GD6003@sirena.org.uk>
 <20180207152045.GC5850@tbergstrom-lnx.Nvidia.com>
 <20180207153711.GE6003@sirena.org.uk>
 <86cd40ac-d255-f4b9-87cb-0cd34efba7d8@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <86cd40ac-d255-f4b9-87cb-0cd34efba7d8-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 08, 2018 at 03:34:56PM +0530, Laxman Dewangan wrote:

> I added this API in downstream for the purpose of finding whether rail
> output can be changed or not(fixed) based on constraints.
> If min and max is same then it can not change. I used this information to
> set the pad voltage of SOC automatically.

That's a reasonable thing to want to know.  The way the API wants you to
ask that question at the minute is to check if you can set the voltages
you might want to set and then if there's only one possible voltage you
can conclude that change is not possible.  I appreciate that that's a
bit of a long way round to do it, the thinking was to try to keep the
client drivers more robust in cases you can change the voltage but not
to all the values the driver wants.  I'd consider relaxing that and
having a direct API to ask about variability (just as a boolean) since
it does occur to me that this can be a useful speedup during init but I
need to think.

> I dont know other usage when I added this API. May be Peter is needed here.

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlp8ZZcACgkQJNaLcl1U
h9DXJwf8CqkMIWic5ktqMvXm7+Fipc3AtSZRxkBTPVWCWwoulvW+g8VEg+WApNPy
yPyv8tJocgRVEXT9MezcPxXPYlaR9O8rWetE+0y1Az4hXY2Q4O7nZagBlA4MEADb
uKFDwr8yFLbByfCVtQrNZrgVL+FxMWubfdL08IgyK1/fNqc4E3DJdX10pkaqn/hL
5ku7ONEk1Y6zRir9cU1Elp9WN9l4Myy+kYZluzoYWUHyqdo3j/IRFPVNMQt2niKQ
N8d3UXjDos5l498im3zDbfas0NYf4pwKu/jrR1OTyx4vMIzjSVloXe8sN38dibFp
Hs4wXK5N508UNu4YnuiiWB77MB1S5w==
=Jk69
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
