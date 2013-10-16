From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 13/13] WIP: ARM: tegra: Add Tegra114 powergate support
Date: Wed, 16 Oct 2013 12:48:49 +0200
Message-ID: <20131016104848.GE21963@ulmo.nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
 <1381850883-12722-14-git-send-email-treding@nvidia.com>
 <525DB8B2.2050203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525DB8B2.2050203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2013 at 03:50:42PM -0600, Stephen Warren wrote:
> On 10/15/2013 09:28 AM, Thierry Reding wrote:
> > Extend the list of power gates found on Tegra114. Note that there are
> > now holes in the list, so perhaps a simple array is no longer the best
> > data structure to represent it. But perhaps this is good enough for now
> > and can be cleaned up in a follow up patch?
>=20
> Peter should probably comment on this, since I think he's touched the
> powergate driver the most recently.
>=20
> One idea might be to have the powergate IDs be "virtual", with a
> virtual->HW ID mapping table per SoC. The virtual IDs need not have any
> gaps. I'm not sure that having gaps is really much of a problem though,
> except for the debugfs code in powergate.c...

That sounds like a good idea. I'll see what I can come up with.

> > diff --git a/include/linux/tegra-powergate.h b/include/linux/tegra-powe=
rgate.h
>=20
> > +#define TEGRA_POWERGATE_DISA	18
> > +#define TEGRA_POWERGATE_DISB	19
>=20
> s/DIS/DSI/ perhaps?

No, these are actually powergates for display A and display B.

> > -#define TEGRA_POWERGATE_CPU0	TEGRA_POWERGATE_CPU
>=20
> I expect that was added deliberately. Perhaps Peter or Joseph can
> comment? Admittedly, it's not used right now.
>=20
> BTW, while you're fiddling with powergate.c, I note that
> mach-tegra/pmc.c #defines some TEGRA_POWERGATE_xxx rather than including
> tegra-powergate.h. Can you fix that?

There's more: quite a bit of the powergate functionality seems to be
implemented in both powergate.c and pmc.c. I should probably unify both
while at it. Not sure if I can make it before the deadline on Thursday
though, so I'll focus on the refactoring of the power domain stuff first
because that's actually needed for Tegra114 support.

Thierry

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXm8QAAoJEN0jrNd/PrOha9sQAKpc88HGF42jjKeKUwLEH/GH
1x3Idf37gOXThvTP9OLJ1pjLXhZZWvBIDbmp6Nf9hnjkKvJfdzFqxgRmfc/zqB6u
Gd9/+K5eSKlaTlLCB1v4ziLf5UKIYWEE08lUf4ZXrcWZ2qUNvlP/PBLSN88y6fsL
EkViO0YcIGOvPccxVCaxWZJKC3t73CTv6zSiiTIoZ5Mftf409X4Vs6KlaIEkXDH2
d385EGgxchAqyXWmYCmz4rEgh0+gXx7UsiSUpq6IDnf5bp9AkA9clFSHovTuf2BS
B1KgxnNMLB5BxUf4yuGkdi57R4I+Pw5GdQrPE3oVQtErIkwbdS1Gy5N4eNdSiIKs
+sY5mIwqgnkvxloGnF4wgFvPZgaBWy/Vxia0VsrfWvOnViImNAywdHUeJPnof4Ns
x5j39bQpQp20+LbMgK3YOaW7eTWJPZ9IbFUcit2n6I1sm7/dz5TA4lQgOjFuBaET
KuQ7DAO1qZPbUgr9mbaGYtjPw5L38FTtd6tyJlwwwvxT8riOTSi8D8AIQMkaN9u8
ZxfRWlW/dvIO+CXCh2RYF8cxpWdXb2k3+ej/XwNC1I1YtGlUOH5FClJQAsNQnadQ
aIkk5WJqFRCaFEEPaQMnX33/BrrEODNUz8jBFhVl6O/xvCsLnLoxai2G60Ob4SQH
OK5GMn47Szkf3DiQ/JN8
=WLZ8
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
