From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: roth: add display DT node
Date: Mon, 21 Jul 2014 23:51:53 +0100
Message-ID: <20140721225153.GJ17528@sirena.org.uk>
References: <1404303560-32209-1-git-send-email-acourbot@nvidia.com>
 <1404303560-32209-5-git-send-email-acourbot@nvidia.com>
 <53B42B60.1000600@wwwdotorg.org>
 <53B4C9C0.4000605@nvidia.com>
 <53CD333F.2070805@wwwdotorg.org>
 <20140721211630.GA12076@mithrandir>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w47z9evyjOavafUr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140721211630.GA12076@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--w47z9evyjOavafUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 21, 2014 at 11:16:32PM +0200, Thierry Reding wrote:
> On Mon, Jul 21, 2014 at 09:35:27AM -0600, Stephen Warren wrote:

> > > vdd-2v8-display needs to remain always-on however. Here we may hit a
> > > limitation of the simple-panel driver, where only one power supply can
> > > be provided.

> > Can't we fix the simple-panel driver to allow a list of regulators in
> > the property?

> I have no objection to allowing that. But I don't think there's a way to
> do that with the current regulator API. You can use the bulk API, but
> that requires separate properties, not multiple regulators in one
> property.

> Perhaps one idea to solve this would be to make the regulator API return
> a regulator handle that in fact controls an array of regulators? Adding
> Mark.

I'm really not comfortable with that idea, it seems like most of the
users would be abusing it - one of the biggest issues is always getting
people to understand that their driver may be used in other systems with
the supplies mapped differently.  If you were going to do something
along those lines you'd need to do something that enumerated all the
supply properties on the device.

--w47z9evyjOavafUr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzZmAAAoJELSic+t+oim9nwUP/jK/eXoKVl99dSmhUmDtv+9E
CeL0oOyWN7ovsIbFi800l43DW19imQqvN6JA2lwWqGan0uZ7EyChCqe3ttv9y8Ul
a5HtfqM8Yhoigosz6FMmVLhY2//XAaYpnUBTrjo3SZmN4ZDdI6cNWrTRx1IhJHIM
YNR9mvCLQJM3B8/Fxh+FM8Ayly3rdkvzIVbfurw6bhqQ1z06zWTO8bGdXFaKU+xh
YgBMDrtH1ctgNlCwsD35MdNjh6GD4SYrWOyR3s7Ki0v5VI0RdMxGBbW7j/m+h6Zf
PvJrjqUsqpM/FX1GsIHttsm6+Cmhj8cQuvStBgOKIP4TQuML5Q/k58R914bUAjv7
Oy0Zhrs0Xed+S95sL9Va0B45El4reSe+GGRDwD4etFojQ36zCUZOlamzRwtZ3AKB
eDmMwdh53DHWL6iYkwsQVT15L7yLc519SRHh6/M0jjYfjpCc3OjXCx7VmFBJToOD
4zSc8ObXFEcBY+6JEES/I66PY/7lQ50cEfeOAu+MWpKcTxtJscYCDsKibMo3lT+8
etEAkPGqCPO/DOB0CedkAF0/vfqu+1sd3dN5nS4M1ovv4tsIztLaI+QWMqcquLAc
vQo8SfPKXlsdoJ2kEZaYIVhuuj+pBuztkPQPqXQjDbzdKQROqssH7GocuT3iHbpa
P18re0tQtirmXt9c4mS+
=3it+
-----END PGP SIGNATURE-----

--w47z9evyjOavafUr--
