From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 13 Nov 2013 19:07:45 +0000
Message-ID: <20131113190745.GD878@sirena.org.uk>
References: <527737C5.5080901@nvidia.com>
 <20131104161828.GK2493@sirena.org.uk>
 <5278B4CB.9050305@nvidia.com>
 <20131106085100.GB11602@sirena.org.uk>
 <527A1C47.6050405@nvidia.com>
 <20131106110154.GG11602@sirena.org.uk>
 <5281C228.3000404@nvidia.com>
 <5282717C.3050502@wwwdotorg.org>
 <20131113122329.GC878@sirena.org.uk>
 <5283B6E3.9070206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MEatx1zidE5asLAI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5283B6E3.9070206-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--MEatx1zidE5asLAI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2013 at 10:29:07AM -0700, Stephen Warren wrote:

> It seems slightly odd to tightly link the drivers/of and
> drivers/regulator code like that, but I guess with the appropriate
> ifdefs it'll work out OK.

This isn't really regulator specific - it's something that applies in
general to things implementing deferred probing - so we ought to have a
generic "we know if devices can appear later or not" flag that
subsystems can check.

--MEatx1zidE5asLAI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSg839AAoJELSic+t+oim9gycP/in1+8UswgJli94TmQE7TMwG
DAL/BlYs/mfFmafYuw+dU8wALuxaUGXPH3o60byzbEShZjOHnSEIIhSa81jj7abh
pF7OVtyVCuF73S02P+z/qwmeZDJrEtIuoxCw1K/Sv0ZMRrvIMRzyBA/d37TAQC/1
2BLGogoAwEFjHAIZopGJ7vc1WxiSqRTTJRwo+zidQz+70GCSit8I9xKlQ1mzgqFF
zYZzznPbwcZ1mkn+9TmiRiiTNmZ9hPK0aZKpALhu7IYZu7xUMyUv/fS3PeyzRlbc
cQNxwoRq+knK/2bdqFJlt2FLTwE8oHNxTkJ+HNK3FFo0vyJjjpSa5unc0cMg9oV8
71LO6XMluNoK2u//zepP6MFORxSB90DKw4VJtDytD2RB/Fczds8ND3qBVL/lAmFW
XqfZ6dRQewaCkb+qZ4xC7D6PqyrdN/x75E7t9XM/1vi8d2903HG1hUarRqw0BlRY
P6gqtUKTlFkcmOtze8eqlDIDnEp0SPR/9eVd319GULsFyOH9bnutkfRxs2mF1wxV
dX8Oitm7vf01IGmCMlsFdteYZWnpQe3Sj9rsDP6FD7e6aTJKiO7nfulYvdGFgO9z
+LVJ2N7LgsZOb7+dTF8lh3j8tG2z3AVSx6cdjVbOaP9uP3tpH9SjTebAtHm/wjQF
nNgaNJ5S2ENeBCLYi2OX
=zEjY
-----END PGP SIGNATURE-----

--MEatx1zidE5asLAI--
