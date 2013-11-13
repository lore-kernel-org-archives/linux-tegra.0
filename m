From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 13 Nov 2013 12:23:29 +0000
Message-ID: <20131113122329.GC878@sirena.org.uk>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com>
 <20131031162029.GF2493@sirena.org.uk>
 <527737C5.5080901@nvidia.com>
 <20131104161828.GK2493@sirena.org.uk>
 <5278B4CB.9050305@nvidia.com>
 <20131106085100.GB11602@sirena.org.uk>
 <527A1C47.6050405@nvidia.com>
 <20131106110154.GG11602@sirena.org.uk>
 <5281C228.3000404@nvidia.com>
 <5282717C.3050502@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5282717C.3050502-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 12, 2013 at 11:20:44AM -0700, Stephen Warren wrote:

> The only issue you may have to watch out for is: When is
> regulator_init() called (i.e. when does core_initcall happen) relative
> to when driver probe()s can be called? If it's earlier, then
> core_initcall is early enough I suspect.

What I said was to set this up when we hand the DT over to the DT code
to be parsed so that we don't need to worry about any gaps like that,
it seems like a more direct solution than worrying about initcall
ordering.

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSg285AAoJELSic+t+oim9oCYP/iF5TEs9BBI4JdKSWFccG1Wf
OZBzqLD0phzaLYmCzuETh7NTXBL/SAQs4UoTp8zYOaB11sfdlaff+WwbM21vh9gv
HHu/nZpokbLXIIYt5djefj973cqzLtKVZlMev6TK4m4s27Bzao5kToaueuVH8mJF
KepYfMgTTx9zLujsc6GcD9xPz/TiJvspJjT+nKiCnc3ESLIZ6LMuXXjDs4Ryz5TD
6OfeiwD+kzCSIsX3rKKdUXe7R6rq4iqFHJTbHZ+LGaaFfjqfwRXqKio3XLcFmtfB
0RqUB3QXiYs7aTljBOhXL3dOy3NO0yF4aYeBDxr3s0AUFfaUsEzfzUy+LgcUhseH
wkuqGgOdKRnOpuML/EJX6WUw3vAo8ZzahSi/Vwxl4SpAbDvsDGvuiL4l4FKR7TAU
IYBq5z3OgnwwP581g+Zqxq2sXHYqRRtaNPkjZyqhqFwkW797mfie568cRA6desFO
UDibdmplzGVbS/PqzkUZilQL8OJhpl/XisSGBlHT0jHAAn7rUZcy6DY/9FxBaf7T
RSt4Gsg5Zi0ilT5jfiCczJ424JQ8EmI5uwxUAqXxKUVcC5wd6WpNcdmMGf4+Vly4
+t29LSC4iQIks+u/UmLDQwHap6wfd8yU/noJZKU/AIkUNHJpm07yNnWKJuUYuV+Z
FGybMqYpGiEJMJb+ecNG
=li8B
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
