From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v6 04/17] pwm: Add table-based lookup for static mappings
Date: Fri, 13 Apr 2012 10:47:19 +0100
Message-ID: <20120413094718.GL3168@opensource.wolfsonmicro.com>
References: <1334070400-25013-1-git-send-email-thierry.reding@avionic-design.de>
 <1334070400-25013-5-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XRwESHC7KXlqFpSs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1334070400-25013-5-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--XRwESHC7KXlqFpSs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2012 at 05:06:27PM +0200, Thierry Reding wrote:
> In order to get rid of the global namespace for PWM devices, this commit
> provides an alternative method, similar to that of the regulator or
> clock frameworks, for registering a static mapping for PWM devices. This
> works by providing a table with a provider/consumer map in the board
> setup code.
>=20
> With the new pwm_get() and pwm_put() functions available, usage of
> pwm_request() and pwm_free() becomes deprecated.

Reviwed-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

--XRwESHC7KXlqFpSs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPh/YRAAoJEBus8iNuMP3dDEQQAIzFRRk2eS8fwXWKr1Mtbzqn
/cPHjEP7/6kWN7cBn4Qa6tDzwaE+OVpPXcC3zPqE2OG32wYdo+n93DGdaBootoyn
pzper6fdCu8NTtWZXMpwW62+bnQhGG/44oN1S4AaA1WceV0QqzSFhcM5yTXq/s62
+bxLJO+xuU7/M0/sc9vWsNAmflXtyNz8IL572f+ZcTvAJGHFCfqGgnwkBPmxIZUE
hWRbx/aj+H+lziO1aeCt+8XZVYWwr6Jj/BJezqDsNZo4kMmt0RP6hvOGKZRnjuOh
6Cn5BAd8zVOtpyYYEyhgRFsQldeqPV59ZdQs8pgKncQJ/R/nOeQgMllWvRMF+xee
jJqq3egS626kyMLtXfM/hatycMA684hL6MPt/kDzRkvE6Spo3OV0RrrV3Gu/re9y
T7vtzhYZyJO7bHO2Ld6Jfpv3tGEYH4+xfXhRwgQVhNMix1zWqn+s4xaKbT1LgQKY
H1JSsibXN12LqWhtqzLMlPc2QNDTJNxHqpXcsf0VWXFnEt1tlMznAVXuMQQv/+ih
BZ10TZ+pDPTTuhP5efOmnBjVSNMVMRGx4M8wGOGxtwE58kV1BobPonruBt6QzjxL
VJu82E2ir3sHgOP8QCdU9gY3RvDTTkitqCGmVCykI3OTVxKFZ44PNi7J6RF+Df4Q
udgeCa5QRAHtGVUBDG42
=72bn
-----END PGP SIGNATURE-----

--XRwESHC7KXlqFpSs--
