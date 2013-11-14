From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Thu, 14 Nov 2013 11:36:46 +0000
Message-ID: <20131114113646.GG26614@sirena.org.uk>
References: <5281C228.3000404@nvidia.com>
 <5282717C.3050502@wwwdotorg.org>
 <20131113122329.GC878@sirena.org.uk>
 <5283B6E3.9070206@wwwdotorg.org>
 <20131113190745.GD878@sirena.org.uk>
 <5283DD52.5050903@wwwdotorg.org>
 <20131113204923.GG878@sirena.org.uk>
 <5283F625.403@wwwdotorg.org>
 <20131113222953.GA26614@sirena.org.uk>
 <52840E23.5080105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HB4mHL4PVvkpZAgW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52840E23.5080105-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--HB4mHL4PVvkpZAgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2013 at 04:41:23PM -0700, Stephen Warren wrote:
> On 11/13/2013 03:29 PM, Mark Brown wrote:

> > In theory.  In practice people often add bindings for devices without
> > including the regulators and then someone comes along and adds the
> > regulators later, perhaps not even using a system with DT, and renders
> > all existing DTs buggy.  This is generally miserable for everyone so
> > it's better if we're liberal in what we accept.

> But that's a per-binding issue. Earlier, you wrote:

No, it's an issue that affects running systems every time a binding gets
updated.  The binding doesn't care.

> That sounds like a system-global flag, not a per-device/binding flag.
> Has the conversation shifted topics? And indeed, I've been talking about
> the system-global has_full_constraints flag all along here.

Yes, this is a behaviour which is implemented by the system in order to
help keep device trees valid.

> But the regulator code already calls of_have_populated_dt() in order to
> determine whether to set has_full_constraints = true; The only issue is
> that it does it too late. If of_have_populated_dt() is the flag that the
> code should key off, what's wrong with the suggestion I made yesterday
> to simply move the existing code (that uses of_have_populated_dt()) to
> an earlier location?

This is a third suggestion which is to check have_populated_dt() at use
time not at some random point during initialisation which may or may not
be the right one.  And someone needs to check that this is actually the
check we want to use earlier on.

--HB4mHL4PVvkpZAgW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJShLXLAAoJELSic+t+oim9o50P/2dxwOwRPiE0D7HFrjTconB5
EJrnNGt163fNqJM525MLhnjyKZOlRb4Jv+Y41qWmmwvrzeV4INJDlZLgwcdY48vG
AU52siulY6g28WAAxPEYuMNXhnVXSvMm+LwkBBefSNrRg2hzt4ZQFyHAiHkF2GBZ
qpY4TVRy68ZCU6USSDLfRBFOxwmgmKMbQlBuS1d9A9WfCNST6i/Z0Et5wTuIYHVj
8vYl9rsmatTTgk4YAWWdcN7tnxBiIJmgzLu/TmISB2az5GWURQNbGCNCSmYSqLy0
5lBtwYhXmnhXxlIKkObQzx5w5KyD5Ybm7FbP5eTxmBzKCJtheiMhGWHm6Cd6Fbp1
7Wld0WTdD+rNU8Tr1e8U99TNcFTxxeaLQsk+U0MpQgokNnDtBwMn7qMSvVqtoDYu
xgEOeKuCDtidHzcVZYqoa72pbGIP7U3i6/e49+hAcrBI0ExifAJUqkkNAD6nnWWR
/UpwiyRlJVpNkfql3mElkSsNoAapXYzcuh5yES9r1tkQQ8MzXf1n/C/UU3kBgd1D
WbYIWOhtc3Q1HaqAO/fzuH9EYmTMhWqqeeke8IXNB0NF31xWXBMy/EgdGL3pVBwF
NhHa3tFi5PCK7WHrkH30TufXh3XNjm9HD/2YXnIzxFBIbRFZIPGBvqHKb8NBjvVM
f0NmdIco7QXJZxWDxX+B
=c3VS
-----END PGP SIGNATURE-----

--HB4mHL4PVvkpZAgW--
