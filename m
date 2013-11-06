From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 6 Nov 2013 11:01:54 +0000
Message-ID: <20131106110154.GG11602@sirena.org.uk>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com>
 <20131031162029.GF2493@sirena.org.uk>
 <527737C5.5080901@nvidia.com>
 <20131104161828.GK2493@sirena.org.uk>
 <5278B4CB.9050305@nvidia.com>
 <20131106085100.GB11602@sirena.org.uk>
 <527A1C47.6050405@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uTCAFClMX+U9tLbX"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <527A1C47.6050405-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--uTCAFClMX+U9tLbX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 06, 2013 at 06:39:03PM +0800, Wei Ni wrote:

> I still can't find a good place to set full_constraints, could you
> please show me some reference codes where we can set it?

The places where we unflatten the device tree for example, or start
instantiating devices from DT.

--uTCAFClMX+U9tLbX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSeiGfAAoJELSic+t+oim9C28P/1PUja8uWq2GXBEkSEv/gOCW
Sm/Z3rCZXvDlXYFKogej0Tp6BALks4rfpjH/dejBTG/6V1dsm1mjEyhTgFmJUpr/
xrz8taO/9hJwkboWHLGved7MTv18TmrA2oWcRkGwKrqL2s1nxgHjaOrl+4lKF1B/
wjMa4BkbC368appNMaPbn7NRbY0v8GbGIwOVggnV7IXpeBQfFAnG2s1fxCxEjMAT
Fg3CvtbR0ufI8E4F/hwZyVeChBgPed8vmCGvxO3oEjffHkYjru8dlhDvwlC0In6v
YwCTm2S0PDmN/bjlMSGZcjupumi5qXzAEYl7UQKhwHqmlQiMbwGttFT6WJpBAgAB
UFftsuq/EQMM87f2EBhT5dQYMXM6LGL8VwTPyLdpJ9ZBDU+Kv3Z2REOG8n2Ceo1I
dvmpYK6x2fPM56qTck7qbWyxC3KBcemyka+DmqHAjR2f4kv+DeE+uVkKwBxwCJjM
fWEAt9gcYeeM0HosIRdqYdwTcsdeAx9dxtrhoq92MV1kWOgxSXFf82nDe+z8krU1
MN4EyxB7hkJSw2nubcnj2aiwk2nF8p44iUMcY5uiaWnx0db4RdWTRXbb74Emlk+X
n0oTSPX0daUh3LvsqtIEzY6n+BfIP3SBwDwWWsCHnXl5a042MQ5amihkFxLYoABe
jy1pcFpnD89GG2gDtgvf
=VPYf
-----END PGP SIGNATURE-----

--uTCAFClMX+U9tLbX--
