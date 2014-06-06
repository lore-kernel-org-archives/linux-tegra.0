From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] usb: host: ohci-exynos: Use devm_ioremap_resource
 instead of devm_ioremap
Date: Sat, 7 Jun 2014 00:52:48 +0200
Message-ID: <20140606225246.GB22188@mithrandir>
References: <1399723210-21569-1-git-send-email-gautam.vivek@samsung.com>
 <1399723210-21569-7-git-send-email-gautam.vivek@samsung.com>
 <CAFp+6iFufCh6SVEF-HQA62ZsJGJGSebDSs28eqcrMy1X8e5vjA@mail.gmail.com>
 <20140604131306.GB28484@ulmo>
 <CAFp+6iEe8fvxboG79=2s=oe4BkQJYAoVUPtYkPdjJHCe+bC=8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iEe8fvxboG79=2s=oe4BkQJYAoVUPtYkPdjJHCe+bC=8Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 06, 2014 at 06:32:42PM +0530, Vivek Gautam wrote:
> On Wed, Jun 4, 2014 at 6:43 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> > On Wed, Jun 04, 2014 at 03:41:20PM +0530, Vivek Gautam wrote:
> >> On Sat, May 10, 2014 at 5:30 PM, Vivek Gautam <gautam.vivek-Sze3O3UU22KIwRZHo2/mJg@public.gmane.org=
m> wrote:
[...]
> >> > diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-=
exynos.c
> >> > index 9cf80cb..dec691d 100644
> >> > --- a/drivers/usb/host/ohci-exynos.c
> >> > +++ b/drivers/usb/host/ohci-exynos.c
> >> > @@ -120,10 +120,9 @@ skip_phy:
> >> >
> >> >         hcd->rsrc_start =3D res->start;
> >> >         hcd->rsrc_len =3D resource_size(res);
> >> > -       hcd->regs =3D devm_ioremap(&pdev->dev, res->start, hcd->rsrc=
_len);
> >> > -       if (!hcd->regs) {
> >> > -               dev_err(&pdev->dev, "Failed to remap I/O memory\n");
> >> > -               err =3D -ENOMEM;
> >> > +       hcd->regs =3D devm_ioremap_resource(&pdev->dev, res);
> >>
> >> Here, we replaced devm_ioremap() call with devm_ioremap_resource(),
> >> which internally requests the memory region
> >
> > I guess this could lead to problems if drivers haven't been written to
> > cleanly split the register ranges that they access, since now two
> > overlapping regions may be requested and cause the drivers to fail.
>=20
> Sorry i did not understand completely. Wouldn't the request_mem_region()
> fail for an already busy resource ?
> So devm_ioremap_resource() will in fact prevent the drivers from requesti=
ng
> the same memory region twice until the first request frees the region.
> Isn't it ?

Yes exactly. What I was trying to say is that since drivers weren't
requesting the resources before they may be using overlapping regions.
Now that this patch changes these drivers to also request the resources
they will fail if the regions overlap with those of other drivers.

> >> and then does a "devm_ioremap()" or "devm_ioremap_nocache()" based on
> >> the check for IORESOURCE_CACHEABLE flag.
> >>
> >> But this flag is not set for the resource of this device.
> >> So should we be explicitly setting the flag in driver ?
> >
> > I don't think it makes much sense to map these registers cached anyway.
> > Drivers will likely expect writes to this region to take effect without
> > needing any kind of flushing.
>=20
> These "hcd->regs" are going to be used by the controller, so wouldn't
> there be a performance difference when the requested address space is
> cacheable/non-cacheable ?

The issue here is that if the region is mapped cacheable then register
writes may not immediately take effect and that's almost certainly not
what the driver will expect. I don't think it ever makes sense to map
registers cacheable.

Thierry

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTkkY+AAoJEN0jrNd/PrOhPmoP/AqwOmizwuk3rpr6uU+x3K/j
Y2+eFQQw8EBVSnaCFI1QN+s/27vM2OcN1ByZ55G6B1NaA6WiAnhQWEUv1t+KvLt/
Go3Tv1tr53xQNyKXSdOuS0WkQa5y+ZxhgT6dgKn+knOdXCbdfb93WR8cvprQoiRE
c/E8wsA8heV4Sk94HZW0qvcMRCfV3XLKR7H3VfYdbZEQhZYwooQP6u/WjY88094x
fXhI8Cga5O9i0eDkkSeUgQYlhzi4N9Qpp00shx66+KoSsafVj/YpblFBKCzrQ/0E
AyqnOOUsEt4OJOk6GPoZmON1odPIYBMemgZukjKNqLOx+G8KU50a4IhqAnjfgTTj
wZeKC8mAi90s/ZeTtBsr+pRvZGmpgvbO0vZ8ZAovHFDKebnPT2dtqWvMv9CgpB+f
BAKnakjrL8yn+uZWBs+TuYmx03wQLWNNbj0FUUgWHt/fmPQnsvKSVx77p45t0ihX
G5Kh8ttUtfYOMnJSkE063Cya5CLCrEx8fN92AtqklGsawiA56XmpPhfhrdOKWYvO
elL6S15Bf0Gk3gf1l61K5B5rHEuiRRmaxy6U+lVcozmGFwkMns4TlFgYmWJG9S/j
no2o93RmxSMf5i9qfaDukCKOxsp9VjoXnt37Fe66tmolBdYnU8l637C2oZGgTScb
kbheiVhKz1zjQJLsN956
=QxJm
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
