From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: tegra: Add efuse bindings
Date: Wed, 8 Jan 2014 21:09:48 +0100
Message-ID: <20140108200946.GE1298@ulmo.nvidia.com>
References: <1387891931-9854-1-git-send-email-pdeschrijver@nvidia.com>
 <1387891931-9854-4-git-send-email-pdeschrijver@nvidia.com>
 <52CB14D3.2060904@wwwdotorg.org>
 <20140108133951.GD1592@ulmo.nvidia.com>
 <52CD9DFB.9010007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dFWYt1i2NyOo1oI9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52CD9DFB.9010007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--dFWYt1i2NyOo1oI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2014 at 11:50:35AM -0700, Stephen Warren wrote:
> On 01/08/2014 06:39 AM, Thierry Reding wrote:
> > On Mon, Jan 06, 2014 at 01:40:51PM -0700, Stephen Warren wrote:
> >> On 12/24/2013 06:32 AM, Peter De Schrijver wrote:
> > [...]
> >>> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra=
20.dtsi
> >>
> >>> +	efuse@7000F800 {
> >>
> >> "fuse" might be a better node name; "efuse" is presumably the name of
> >> the instance, not the type of object.
> >=20
> > There's another occurrence I noticed recently where we haven't followed
> > that rule. The PMIC node on Venice2 for instance is called as3722.
> > Perhaps that should also be renamed.
>=20
> Yes, we should fix that. Care to send a patch?

Ugh... I've just been going through some of the other DTS files and see
that quite a lot of other places aren't following this rule either. The
Beaver DTS has things like:

		rt5640: rt5640@1c {
			...
		};

which I guess "should have been"

		rt5640: codec@1c { /* or even audio-codec@1c */
			...
		};

and

		pmic: tps65911@2d {
			...
		};
>
which would be another candidate for pmic@2d.

Perhaps it isn't worth fixing them all up after all?

Thierry

--dFWYt1i2NyOo1oI9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzbCKAAoJEN0jrNd/PrOhK6EP/RYFt4xDK/5hdp4EPLPOJtNf
Ecw5kpV/DClLaYh72xvzOplIE47gEedCHJyzv0CG6+bf/JEaTJ9uDj2Kq0UIYxqt
gJTlzHZ3qzOOME80XP0hRSmzznGKqLxgGXGKmvHaKgvM0VSyjXm1lGqz1wzgVDjA
5b+lAVXJPaXW5pV2uCDacBxXHtpWb3b98tBman6khjI77zuDUPpXcdCzqMKqGxoz
sMT+nA179raHHy06xNR70OsvzPsZqkkPC1fnsdmonLTHrkYsfjjR8BYqehP30fiX
fE16Ty6Fqxn3HsWd1msE4nyUzXhxB2rJUVKExKavXpYzjAaocLooUGXnad8ptUeu
3BkCHqaDmfqB0aN3gFb/odJZXpN9mAnrEjLft6FBKOP3SQkPLoLllKdRfEHTDzJ/
grES4xodoZE0wHw3uqe+2WQfQ6klRRdl8+WYOnw6CWQc9CICXX11AXl32bYGH+dB
xE4oRuSZWTBv6nwO7u93o6Mow8XHy7G225z+WB0UeFWfZ7Nc6cvKD7OICI/HhZVD
OQLq1hRnostBrPzfzlRpG4WokB2yJdDlCyNxuqR/xwQH2qz5+IanFWecJYeGqRRU
1S2bsMTlmIj0ODArNA8+roImmGvghAOLkdyLPGjuXTpZ7h7G6KS2S9CQt7Fj32z7
8iZERIaCEwWmyvOR91nn
=qana
-----END PGP SIGNATURE-----

--dFWYt1i2NyOo1oI9--
