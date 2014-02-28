From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/3] dt: palmas: support IRQ inversion at the board
 level
Date: Fri, 28 Feb 2014 14:58:18 +0900
Message-ID: <20140228055818.GA29849@sirena.org.uk>
References: <1393534281-30759-1-git-send-email-swarren@wwwdotorg.org>
 <20140227210227.GE2931@xora-haswell>
 <530FAFAE.5050800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <530FAFAE.5050800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Graeme Gregory <graeme-/SyDAi3Rz4f10XsdtD+oqA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 27, 2014 at 02:35:42PM -0700, Stephen Warren wrote:
> On 02/27/2014 02:02 PM, Graeme Gregory wrote:

> >> +- ti,irq-externally-inverted : If missing, the polarity of the Palmas IRQ
> >> +  output should be set to the opposite of the polarity indicated by the IRQ
> >> +  specifier in the interrupts property. If absent, the polarity should be
> >> +  configured to match. This allows the representation of an inverter between
> >> +  the Palmas IRQ output and the interrupt parent's IRQ input.

> > This has got to be the wrong way to do things, all this leads to is every
> > device doing this property in its own way and having totally inconsistent
> > properties all meaning the same thing.

> > If there is some other hardware inverting lines then there should be
> > a generic binding for this in DT. This is not describing the palmas hardware
> > but some external object to the palmas.

> I'd be fine with removing the "ti," vendor prefix from the property
> name, and promoting it to be a cross-device standard.

> I'm not sure that many devices will need this though; most don't have
> configurable output polarity. Still, I guess that shouldn't stop us from
> creating standards for the cases where it is needed.

It's really common for PMICs and CODECs to be able to set any interrupt
polarity at least.

> If the DT reviewers can ack the concept, I'm happy to respin the patch
> with the more generic property name.

I'm not sure that renaming the property really deals with the concerns
though since drivers still all need to manually add support for this,
shouldn't there be an interrupt controller described in the DT which
just chains on to the parent with the polarity inverted to do the
impedence match?

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTECV3AAoJELSic+t+oim9wQEP/37qCArlS3dUh3vUmfi0qHVH
vEUHBswYi88LRBybUXSccjSsBRJk33FowLsF9IDkddwYvGQBXtHxc3IP2NNyuMXQ
0Lpm+c1EY1dasH8UcA6R8qg4DIxieZKlEKHK2NBxymiKCam278zriNuo13BsliPf
d3vdfHmbZAwxQ4lBjCiZ32TH978NqhTUdChnnvA/8K5GWnQ5P6wzSO9Hq1023Nd6
QYul6wpD5ILUlgFvr5vc485rjvVkNEMetEaoW3/OewZXVBxDa53y2xaq4lOCHO8c
MWbDPm1TMpVnlWDh8Cbe/CKpPRnlOhFGXla2XcFJKUOL8hOj9qkllwJVb/LxS4+Z
CdqthLxGqvL8UGUIZVz4Hj8WEcoNVMskLwqxDc1LuBkowOyVkqCAq/Xx/TlaQMRs
ir/fksr6gW/dDHr8wA5AC7nSa+Rml9Ugj9GZLfJ4ZsVqC15VUTc8pSN2Htm0/jg/
XsSVmHoLcBO+GXVa0qyoZtG7wk5Rvlv9lG/c6Tufdot+HOQzbOusHgrL8rPDrSO3
ai2kcRutJ9Kjpf27GW5ktbwv+PVJKFFh1Lh7HSYRmzw5NLxzSnJ8MYwusFyNROnV
I9FPySV6GfQGN27SDfMkrNPCWHuSXlQPCA6IV0LxHoggNvHEuzgazASggo6LChAg
aTa2kz+rEuujh9bqKA6m
=lCCz
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
