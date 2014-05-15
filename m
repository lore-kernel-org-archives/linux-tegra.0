From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 06/10] usb: xhci: Add Tegra XHCI host-controller
 driver
Date: Thu, 15 May 2014 11:19:40 +0200
Message-ID: <20140515091938.GD6434@ulmo>
References: <1400113986-339-1-git-send-email-abrestic@chromium.org>
 <1400113986-339-7-git-send-email-abrestic@chromium.org>
 <15599140.PsD4j7x3tZ@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <15599140.PsD4j7x3tZ@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2014 at 10:17:10AM +0200, Arnd Bergmann wrote:
> On Wednesday 14 May 2014 17:33:02 Andrew Bresticker wrote:
[...]
> > +	/* Create child xhci-plat device */
> > +	memset(xhci_resources, 0, sizeof(xhci_resources));
> > +	res =3D platform_get_resource(to_platform_device(dev), IORESOURCE_IRQ=
, 0);
> > +	if (!res) {
> > +		dev_err(dev, "Missing XHCI IRQ\n");
> > +		ret =3D -ENODEV;
> > +		goto out;
> > +	}
> > +	xhci_resources[0].start =3D res->start;
> > +	xhci_resources[0].end =3D res->end;
> > +	xhci_resources[0].flags =3D res->flags;
> > +	xhci_resources[0].name =3D res->name;
> > +	res =3D platform_get_resource(to_platform_device(dev), IORESOURCE_MEM=
, 0);
> > +	if (!res) {
> > +		dev_err(dev, "Missing XHCI registers\n");
> > +		ret =3D -ENODEV;
> > +		goto out;
> > +	}
> > +	xhci_resources[1].start =3D res->start;
> > +	xhci_resources[1].end =3D res->end;
> > +	xhci_resources[1].flags =3D res->flags;
> > +	xhci_resources[1].name =3D res->name;
> > +
> > +	xhci =3D platform_device_alloc("xhci-hcd", PLATFORM_DEVID_AUTO);
> > +	if (!xhci) {
> > +		dev_err(dev, "Failed to allocate XHCI host\n");
> > +		ret =3D -ENOMEM;
> > +		goto out;
> > +	}
>=20
> This does not feel appropriate at all: Rather than creating a child devic=
e,
> you should have a specific driver that hooks into functions exported
> by the xhci core. See Documentation/driver-model/design-patterns.txt

I don't think Documentation/driver-model/design-patterns.txt documents
this. Perhaps this is what you had in mind?

	http://lwn.net/Articles/336262/

Thierry

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTdIaqAAoJEN0jrNd/PrOhBUIQAKd1nXshSupjAjeGsNlkQyez
GH8FCmraBgDc4Kf5v7+l03kYBgpI8rB1itwjnslS59CxSz6E6BVzAI6sFQvZ8kpQ
K7v/OAju6QNevxHHwrqWeyeiQtXE81Il0Q0w/14ca1uoD+64PoN+ztVVkwsegcZy
LtXV5+8WfwUCiaB9IS8ASerm2o17LzUzPTs0qKETwsq7Hy6l17y45uqPYVcFfPR8
tsp6FU+lNEtF9oylXDpjD2I6p4r7MlCClSrSwWURgIeD/Gzq3OjjPf47g/nTMuop
J5UAWrF8XiSgOO03PM5tiK40oHUWmSsDQtvOnaXE1KKyBoKGzhHrYz69lD/4ahps
jzseFt2wimbjXXlVQdydhJthD/nWv62V5yooST1ON6VBUBtmLx37JXhZwU9fTDXF
jxS9aEzCcpDVpWqbe4nT7azZIAywCfle/noJ3qILW+S9a5yF6jqYTv8WBroW2sTt
k3p1ItSxEbIDKfM10FRTlRYGVI49w6W4aTjUvnAzj1rwe0nfr4pxFQD/TM9qpLE1
23f1ebQRRwDJp3Hh8/5VduH7+5JmAc4PMG3do/Lu3bGKH3ahm6OBZPafUd3LYsKR
ThnPd3Cywg2C9eRgez8anuZGsnRREOMmsbRwe+zFLqDB18u/cm2E4b+KlNQNVFZu
1MtdbHv1Ur8/6oBue1vj
=1JJ4
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
