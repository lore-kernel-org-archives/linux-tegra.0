From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: tegra: Add efuse bindings
Date: Thu, 9 Jan 2014 13:40:38 +0100
Message-ID: <20140109124038.GB23668@ulmo.nvidia.com>
References: <1387891931-9854-1-git-send-email-pdeschrijver@nvidia.com>
 <1387891931-9854-4-git-send-email-pdeschrijver@nvidia.com>
 <52CB14D3.2060904@wwwdotorg.org>
 <20140108133951.GD1592@ulmo.nvidia.com>
 <52CD9DFB.9010007@wwwdotorg.org>
 <20140108200946.GE1298@ulmo.nvidia.com>
 <52CDD430.3010508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52CDD430.3010508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2014 at 03:41:52PM -0700, Stephen Warren wrote:
> On 01/08/2014 01:09 PM, Thierry Reding wrote:
> > On Wed, Jan 08, 2014 at 11:50:35AM -0700, Stephen Warren wrote:
> >> On 01/08/2014 06:39 AM, Thierry Reding wrote:
> >>> On Mon, Jan 06, 2014 at 01:40:51PM -0700, Stephen Warren wrote:
> >>>> On 12/24/2013 06:32 AM, Peter De Schrijver wrote:
> >>> [...]
> >>>>> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/teg=
ra20.dtsi
> >>>>
> >>>>> +	efuse@7000F800 {
> >>>>
> >>>> "fuse" might be a better node name; "efuse" is presumably the name of
> >>>> the instance, not the type of object.
> >>>
> >>> There's another occurrence I noticed recently where we haven't follow=
ed
> >>> that rule. The PMIC node on Venice2 for instance is called as3722.
> >>> Perhaps that should also be renamed.
> >>
> >> Yes, we should fix that. Care to send a patch?
> >=20
> > Ugh... I've just been going through some of the other DTS files and see
> > that quite a lot of other places aren't following this rule either. The
> ...
> > Perhaps it isn't worth fixing them all up after all?
>=20
> I guess that just means the patch will be a little bigger; it doesn't
> seem like that's a good reason not to fix the issue.

Alright, I'll make a pass over all the DTS files that we have and try to
restore some consistency.

Thierry

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzpjGAAoJEN0jrNd/PrOhpU0P/2hPagTNIdn5CfVOh3iJDzw+
WwKGcW/6iMPnUw6tfylAVL64PHhiTYaevV0YXuTfuWRDBatRkiPJ3JZbdCSB6fGn
AnWsuBEgvBfCT/r7UAw3MaBB+Iz8wHJg6abAOCRf6l183+AKGa2H0q60ieq0pwo3
fymgVQVbW5gAlenv9FCVx92Dn5RLRn+fekxYFM5PjpMOEgx8mD8KciEMDzLq/zZK
mg84+/tv0ntPHBqKSQDj1XMTzYf/6tzOMWG6kJeuekz3ujVjQGox4TSaGsWnsbx1
6H7BuoGb/EHOth5g9w+UdfjqMr5NwoTwqixNzokFEG0edha8S2Fb6xB88EfqT1ss
kfB4qnSEv8DKR8KT67UUWeiSVihHh7xfUSMDjKpa/MU9iL3tzc1dseegz4qjC+fQ
OlQ3FJL3jaYLTZYGPpPW5itx4dCbQYscAEPgVeMgZ60IEyjj6ZJc+4KTw8eVH0yN
UpZVmO27alH3SP9ySdSxAa+RdIc8Y7nZ+Kpa3/Occk/q6hhcbjAMXHE7Zy6dB+rK
L/9ZnK+Oo2Wu9NOvFxdvN3wt4aMojOcZuMD3JDwldMPdimc4sasxXwsImmjLK0UW
xfjSSD+vd8rQv7ZJTMOUAad7jDkzRmLI5xX7v1ypa6IDO5Jlr5vxT4p5/qWfDvoB
rbSL/yOshgH3tqbIlnK5
=6YsJ
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
