From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Tegra boots failing due to as3722 I/O errors
Date: Wed, 30 Mar 2016 09:46:46 -0700
Message-ID: <20160330164646.GH2350@sirena.org.uk>
References: <20160329190319.GE2350@sirena.org.uk>
 <56FBB923.4000302@nvidia.com>
 <56FBD164.7040707@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9jVH9MMcXWLfwoO6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56FBD164.7040707-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9jVH9MMcXWLfwoO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2016 at 02:15:16PM +0100, Jon Hunter wrote:

> On second thoughts, is this the correct way to fix this? I see that
> there are some operators defined for get/set_bypass for a regulator and
> these are not specified for LDO6 either. However, even if they were I
> don't believe this will fix the problem alone.

If this is trying to implement bypass support it should use bypass
support (and the other things doing this fixed to do so).

> The failure is caused by _regulator_get_voltage() returning an error.
> This function does not check if the regulator is bypassed, but I am
> wondering if it should and then return the bypass voltage?

Yes, like we already do for switches.  I'll send an untested patch
shortly.

--9jVH9MMcXWLfwoO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/AL1AAoJECTWi3JdVIfQgCAH/RJVIWYyTbVfmSVKyzWUcjq0
l5ufGDPzMfgKIsHf8fsJgjj8PaG59h4deQHtrPbA8zU+4ErSzJIKPBK2JZH3xbpm
svoAXLGRuz+OVOIVhHrjDicssi8NkB0tdEIfP4Scc11BgGU9Vbz+5S7QSUcXRvKG
v3j+7dWd/jiTETm8vft8AWoSZeN+fqLHBZncjTY4TTOwNHWd9YTbHswk2WqvWq4s
GZ82bR2lfFghvlR3pgtpwZ/Zo1e1jcI9x6zhiAeuvi/CsAczjg0QZMmvPI6pk4zC
Y+K16+63oUwxq4ERGHEHJa9sd3EnRIVSdI5ec5YKF1O578t0xZXI4vml/pp3zdU=
=nvh2
-----END PGP SIGNATURE-----

--9jVH9MMcXWLfwoO6--
