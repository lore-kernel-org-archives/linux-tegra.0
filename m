From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 01/11] regulator: core: add API to get voltage
 constraints
Date: Wed, 7 Feb 2018 14:18:46 +0000
Message-ID: <20180207141846.GC6003@sirena.org.uk>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
 <1517934852-23255-2-git-send-email-pdeschrijver@nvidia.com>
 <20180206163544.GI5681@sirena.org.uk>
 <20180207084744.GG7031@tbergstrom-lnx.Nvidia.com>
 <20180207104351.GA6003@sirena.org.uk>
 <20180207123750.GA5850@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180207123750.GA5850-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 07, 2018 at 02:37:51PM +0200, Peter De Schrijver wrote:
> On Wed, Feb 07, 2018 at 10:43:51AM +0000, Mark Brown wrote:
> > On Wed, Feb 07, 2018 at 10:47:44AM +0200, Peter De Schrijver wrote:
> > > On Tue, Feb 06, 2018 at 04:35:44PM +0000, Mark Brown wrote:
> > > > On Tue, Feb 06, 2018 at 06:34:02PM +0200, Peter De Schrijver wrote:

> > > > > Add API to get min/max rail voltage configured from platform for
> > > > > given rails.

> > > > because...

> > > of the next patch where this is used to retrieve the minimum rail voltage.

> > And that in turn is needed for...?

> To calculate the required voltage for each frequency.

You're going to have to provide a much better explanation of what this
is doing - right now it seems like an abuse of constraints.  Client
drivers can already determine if a particular voltage they want to set
is available via regulator_list_voltage() and so on, that's what
constraints are there to set.  It sounds like you're trying to use them
for something else but you're really not explaining your use case
clearly.

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlp7CsUACgkQJNaLcl1U
h9D8NQf9HArPCGOGdxVM2WXctuVLm1L69UeQZ4U5agoguZ9RA64DKMLKWWMWP9sm
XmnSvULmxvpwoRJG0lhRGlQKnd9PpsBiKCIcIixPgWRqdjEdfV8eFd1rKlpqUgss
ahAPnok+UzhsRJTXum2ibaZOyiQb6MDwyxvXvAXJrZ3fKQ68WpxMIvNLgTdx9YK0
/oEEbp4T/jSTLLm1Cf7+1OYJ64muqNh25QcxJR1S9UnlNw5qdEjUXaoQvL9XXxro
Su1vPDfnb0E+W0DEIBW8wWyJLGU8nmAOFX+mbPSukmq+VwQjBMzp66khYbpgGjVQ
p/CdoTHiJ+CI0E3ymlqYhkE6pkcXnQ==
=IooP
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
