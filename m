From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/3] dt: palmas: support IRQ inversion at the board
 level
Date: Sat, 1 Mar 2014 12:13:58 +0900
Message-ID: <20140301031358.GI29849@sirena.org.uk>
References: <1393534281-30759-1-git-send-email-swarren@wwwdotorg.org>
 <20140227210227.GE2931@xora-haswell>
 <530FAFAE.5050800@wwwdotorg.org>
 <20140228055818.GA29849@sirena.org.uk>
 <5310BA99.4050203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0XMZdl/q8hSSmFeD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5310BA99.4050203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Graeme Gregory <graeme-/SyDAi3Rz4f10XsdtD+oqA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0XMZdl/q8hSSmFeD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 28, 2014 at 09:34:33AM -0700, Stephen Warren wrote:
> On 02/27/2014 10:58 PM, Mark Brown wrote:

> > I'm not sure that renaming the property really deals with the concerns
> > though since drivers still all need to manually add support for this,
> > shouldn't there be an interrupt controller described in the DT which
> > just chains on to the parent with the polarity inverted to do the
> > impedence match?

> I had thought of that when first dealing with this a couple years ago,
> but Olof suggested that was too complicated.

It's not obvious to me that it should be especially hard but I've not
thought about it too deeply.

> Another alternative might be to add an extra IRQ bit in the IRQ
> specifier (and something similar would be needed for GPIO specifiers)
> that indicates "inversion between source and destination". This could be
> queried by drivers in exactly the same way as the existing polarity/type
> IRQ flags. We'd need to update each individual IRQ controller binding to
> enable that flag, since each binding defines its own definition of such
> flags. (although in practice since most use the same centrally suggested
> flags, this wouldn't be any more than just saying yes, this binding
> allows that new flag to be used).

Yes, doing something on the controller side seems more obvious here.

--0XMZdl/q8hSSmFeD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTEVBzAAoJELSic+t+oim9RwIP/3uoO08gHGTML1Dz3mWPPTL9
UAAKXMs77CbvpZZAxG+Bgk8gFZeenqXA2crdJRrOxu35t71FMOmdRB5elt7EIrdu
Zvq9fPikJ1tXSxK+KWCX4WzHWYBdBEBmBLBTlBuxAQ0zowH4y5pg8DTDZ23gT4Fo
BMiyJL0vN2qGBTeH/MYiZUlrOgjweX9a/OU/Ao6m0i6Ukhe6Ezp1iIM9R4UK2z9E
lgUdk9v19ddENqE4HD+N9rB0ShTUN7KEssX4SypLnayMdCb4NQXTGLIVlspvdRAE
oZZR66YrXRqafFlwlOyMf3/yXCR3CQdpWwq4PK14DeJRI/7gWofHPwfYcTDgoDqf
p8tuvmGCXDBAlSQdV2iyHxajZFP7gecaRmyoRQUbMhLoWtzYU2oU9GjVFwH6sBj5
o9eKQMOPQjmkOQW5BKqliFEWkfPybwB/k8u6gEALBQf311cqjWyvg7NGp8B/XhNz
FHYKJMMdW6e69eUCUrWuAi4efVyOsitNYwuLdFvuzYOKtNBvqQsnZmGSJN9bwNeZ
4wLMtigiE7CkagNUOFt7zJ8Y97R8jLm0qp/yiJmEO73yllBBjw9DOkcYntO0YJXH
wxfSaEmzpr/4cOMZg8woXAhkCuKD5QbCuoGghN1VeAzupJeB3igLodxl3FJbr7d7
vg1rExIDyjVfN7/Dr3hY
=3cxz
-----END PGP SIGNATURE-----

--0XMZdl/q8hSSmFeD--
