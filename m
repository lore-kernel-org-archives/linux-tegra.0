From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: use generated pinmux for Beaver board
Date: Mon, 23 Mar 2015 09:59:59 +0100
Message-ID: <20150323085958.GA11268@ulmo>
References: <1420495066-19221-1-git-send-email-dev@lynxeye.de>
 <54AB0B68.7050704@wwwdotorg.org>
 <1420591830.25483.16.camel@lynxeye.de>
 <1425323769.2182.0.camel@lynxeye.de>
 <1426794762.2212.0.camel@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426794762.2212.0.camel-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2015 at 08:52:42PM +0100, Lucas Stach wrote:
> Am Montag, den 02.03.2015, 20:16 +0100 schrieb Lucas Stach:
> > Am Mittwoch, den 07.01.2015, 01:50 +0100 schrieb Lucas Stach:
> > > Am Montag, den 05.01.2015, 15:08 -0700 schrieb Stephen Warren:
> > > > On 01/05/2015 02:57 PM, Lucas Stach wrote:
> > > > > Replace the current incomplete pinmux setup with a proper one gen=
erated
> > > > > using the tegra pinmux scripts.
> > > >=20
> > > > I assume this is identical to the existing content, it's just that =
the=20
> > > > node sort order changed to match the auto-generation order?
> > > >=20
> > > Yes auto-generation changes the representation of the nodes a bit, bu=
t I
> > > made sure to keep the properties of the existing kernel DT pinmux whe=
re
> > > they were different from the U-Boot pinmux.
> > >=20
> > > > If so,
> > > > Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > This has not been applied. Could anyone please pick this up, so it
> > doesn't miss yet another merge window?
> >=20
> Friendly ping.

Applied, thanks.

Thierry

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVD9YMAAoJEN0jrNd/PrOhf5AP/iSkFVvztDkwF5WdB9ap7L1p
6LIBX/RV0O2Tvv7rGTbP6azx5o17Z0RZt3OTkO7kw9+QI4+gh3VKfhle9ssoL5+5
1VIbZTIi1oRwOcG+IbkfZrQPhNgiih5a8LTyzMHD4hFgTSRPlnWX0yNZIsB083CC
BRNrE53qHqXlN4jkB7qkHt9jtB9GiHh06wcJiWYnv9tSBCMimP/OvcnPQnBruQEO
vm2lvu4OuPw+vshW0d2DHEHjHAHg8kQYgbLBAVOnD4Mo+eyBIzt1MYnYH8cTARxM
ZvXnnefcPsPeMDUhUthqQnF8tN13YMzAkyIrxzP6KCqp43DoQDFDiu96y96jreXo
C/yDOj17mXlXDIDxYc7g6hPeCo5uj6vMxhI3o/yzj+VGdBXjCrWHtPOlPGeLVwRD
sGdR2r9PPBXGiSdhc8551RclI4bpNQedaj6u3/Pf6hSGxhtb5igQU11fABlEgWkr
zQOUEZJNejaFmkG9fPLrkjCMDFpPxvr0iMd6HSkCvnc1ZkvrCCbpF6wUBJ8QtuXn
gMnpz9KSyNbuyOaJUjF17UI8f6I/6rCqbaOOUDs9csPq/5+Pd9drQQVZbQElnpus
HadmGBCsToM8NDOBQDHVyembrAB1wR1K3hScvIKXqZD9tZU1uNAjKS0zHifNt96l
XUiaoKz1onyt8Qu/dzvg
=3AgZ
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
