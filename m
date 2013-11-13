From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 13 Nov 2013 22:29:53 +0000
Message-ID: <20131113222953.GA26614@sirena.org.uk>
References: <527A1C47.6050405@nvidia.com>
 <20131106110154.GG11602@sirena.org.uk>
 <5281C228.3000404@nvidia.com>
 <5282717C.3050502@wwwdotorg.org>
 <20131113122329.GC878@sirena.org.uk>
 <5283B6E3.9070206@wwwdotorg.org>
 <20131113190745.GD878@sirena.org.uk>
 <5283DD52.5050903@wwwdotorg.org>
 <20131113204923.GG878@sirena.org.uk>
 <5283F625.403@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5283F625.403-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2013 at 02:59:01PM -0700, Stephen Warren wrote:
> On 11/13/2013 01:49 PM, Mark Brown wrote:

> > No, with DT you can say that if there is no DT binding configuring
> > a given thing (clock, regulator, GPIO or whatever) then no amount
> > of module loading will ever cause it to appear - this is what the
> > flag in question controls.

> But we do have a binding for regulators, so wouldn't that flag always
> be true?

In theory.  In practice people often add bindings for devices without
including the regulators and then someone comes along and adds the
regulators later, perhaps not even using a system with DT, and renders
all existing DTs buggy.  This is generally miserable for everyone so
it's better if we're liberal in what we accept.

> Perhaps you can suggest a name for the flag, and a specific set of
> conditions when it will have specific values. That might help me
> understand what you mean.

Well, of_have_populated_dt() is essentially doing the same thing
(probably, I don't know if it's set at quite the right time) - it's
saying we have a DT.  We could even change the users to check that as
well if it's doing the right thing.

> Are you confusing having a binding (schema definition) with having DT
> content ("foo-supply" property)?

No.

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSg/1eAAoJELSic+t+oim9ex4QAIXgGSC2u6yG9b8urC8rfch6
DzbYkm7jjnAoawyzFtSrSmw+TZ3MY27sHTIdE9GA7WjiY43bHRLw8Zw85S+0bARx
TA584U9Hd1CKmAnQ/BzrvkL2+W8UNeuXGyCnQ9i/5QsB+WW5s+5E6Vmgfg4QTn2o
lSQ1le7mtddGg7WV9oaLDZrArS8z0cRC0ovBjwdQqkeQgcxzkArqt8kmHvMjPFhe
dBCia5P/HysEfBpweFUSRnOU2Z8n01D6WWzcChi0sRc+lLWQqyHZwk/e/7BRPT0r
dFf5YZbaEs6soug3TvTmUc+l2MPJfNgAmfPNDkOHsO5c94OfwANpbKjoS5+qZ//C
HaOymUMP5q63HHT5aMp81EKycZc+L794xRrN3Yau/4eETd5pEoGE0sc+NWgDdZkX
7qQcDnrP2cBH3l/kI12FYNjLslwQhfOTsbEkTm268MNq7+qiIzCtdI6J6Kha64XZ
5t8a/tl3lmzJXFEiO+u8faa0a43/aGzs5U5uOiBHWnD564TPWpU350pPXXyKPpTN
LJNuuqYNIu4mV3jiMhNujtlV0oHC5dB3wLuUO18J/eaDjnvZwlYPKDZqAoNI3K4N
fl8PC8Q+xweptCUxTE4j9JaFPxtqStlDxVVILAagV13KA+SAmB9aaQsCBYgnkcUz
VYUMqW6bhKsYOYboOB1X
=ZR+B
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
