From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 13 Nov 2013 20:49:23 +0000
Message-ID: <20131113204923.GG878@sirena.org.uk>
References: <5278B4CB.9050305@nvidia.com>
 <20131106085100.GB11602@sirena.org.uk>
 <527A1C47.6050405@nvidia.com>
 <20131106110154.GG11602@sirena.org.uk>
 <5281C228.3000404@nvidia.com>
 <5282717C.3050502@wwwdotorg.org>
 <20131113122329.GC878@sirena.org.uk>
 <5283B6E3.9070206@wwwdotorg.org>
 <20131113190745.GD878@sirena.org.uk>
 <5283DD52.5050903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YhYebsMuj/FQeBW/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5283DD52.5050903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--YhYebsMuj/FQeBW/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2013 at 01:13:06PM -0700, Stephen Warren wrote:
> On 11/13/2013 12:07 PM, Mark Brown wrote:

> > This isn't really regulator specific - it's something that applies
> > in general to things implementing deferred probing - so we ought to
> > have a generic "we know if devices can appear later or not" flag
> > that subsystems can check.

> I guess I misunderstand then, since given that modules exist, wouldn't
> that flag always be true?

No, with DT you can say that if there is no DT binding configuring a
given thing (clock, regulator, GPIO or whatever) then no amount of
module loading will ever cause it to appear - this is what the flag in
question controls.

> IIUC, the issue being discussed here isn't about deferred probe at
> all. You always must defer probe if an object is specified as existing
> yet the provider isn't available yet. The issue here is when a
> regulator isn't specified as existing, yet something asks for that
> regulator, should the regulator subsystem automatically provide a
> dummy regulator instead, rather than erroring out.

No, it's a deferred probing thing - one of the effects here is that
we're choosing between deferring waiting for the resource we know is
bound to appear and substituting a dummy for something we know exists
physically and we know can never be provided by software.

--YhYebsMuj/FQeBW/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSg+XMAAoJELSic+t+oim9nWUP/iWjfEDl2b1vyi6uPpWCvl/o
yCYVUHYVJELXOXNO3kxhXx2FDDunXfmuPGl8syJR2t6GviYqPUN6GsbPz0iNHX5t
R6LKUe3EycKdIh1VpHf5AFTEqMwXzdgHOJOXHKpLQf4bF9RFcpyCz6hLqequZQqw
nsmuhYE7yToRnuVO4QDFmLzejLgE8glZz19BAKnOEElViue2xrJNeBh+kfXBhbvH
U/FeAqYi7XXA7ZO9JhiOtxlLxxEy/JGoAX/yr4kuEWYKFqDow8gynUK+APnyahhV
FbENAf7GE9qPp+vA8UPFRuMHYySpU0DCl+WqNzSGWDFOMZ9NAipoqHYBkxDKZBBS
5HDDLc6LWDv0ud0qQ2YSpmdcmlB50IQCpnINtu+ulhLEL5f2PL9+ivRWo7mNtlfH
7rVAPRtG8tO/FhgJM9wTK6C0b/0x8FNW5gwoAb1hoJfaypC246I8wc8+uQmbvkB/
wp7fc+F4qhQsoXin2B5iTM+41yAnCmV0K8D7NMIViYHaqh9h/vRAx4YpWeV3Iu3w
fW3gaKORfc8DdSdajtlaJp2KRNVhEwvgJLFURgMPFpkdRWkozIc/cAvsodDi0MK6
HBPj8V0Ls3RFkl8j79mbv4wZ1BrP5Du/MG4pBkHcUnbs9iqvT9VnAfQsblxW3Jku
ba+oQs/R0+a+Q8aIfSiK
=QDTL
-----END PGP SIGNATURE-----

--YhYebsMuj/FQeBW/--
