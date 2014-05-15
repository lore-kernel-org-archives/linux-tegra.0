From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 06/10] usb: xhci: Add Tegra XHCI host-controller
 driver
Date: Thu, 15 May 2014 23:18:13 +0200
Message-ID: <20140515211812.GC7136@mithrandir>
References: <1400113986-339-1-git-send-email-abrestic@chromium.org>
 <1400113986-339-7-git-send-email-abrestic@chromium.org>
 <15599140.PsD4j7x3tZ@wuerfel>
 <CAL1qeaHm7U2NVDeVZS-Tiz5ntkk4c13RR_1ws9MTYGGoGCOB5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL1qeaHm7U2NVDeVZS-Tiz5ntkk4c13RR_1ws9MTYGGoGCOB5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap@infr>
List-Id: linux-tegra@vger.kernel.org


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2014 at 01:18:22PM -0700, Andrew Bresticker wrote:
> Arnd,
>=20
> On Thu, May 15, 2014 at 1:17 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Wednesday 14 May 2014 17:33:02 Andrew Bresticker wrote:
> >> +
> >> +int tegra_xhci_register_mbox_notifier(struct notifier_block *nb)
> >> +{
> >> +     int ret;
> >> +
> >> +     mutex_lock(&tegra_xhci_mbox_lock);
> >> +     ret =3D raw_notifier_chain_register(&tegra_xhci_mbox_notifiers, =
nb);
> >> +     mutex_unlock(&tegra_xhci_mbox_lock);
> >> +
> >> +     return ret;
> >> +}
> >> +EXPORT_SYMBOL(tegra_xhci_register_mbox_notifier);
> >> +
> >> +void tegra_xhci_unregister_mbox_notifier(struct notifier_block *nb)
> >> +{
> >> +     mutex_lock(&tegra_xhci_mbox_lock);
> >> +     raw_notifier_chain_unregister(&tegra_xhci_mbox_notifiers, nb);
> >> +     mutex_unlock(&tegra_xhci_mbox_lock);
> >> +}
> >> +EXPORT_SYMBOL(tegra_xhci_unregister_mbox_notifier);
> >
> > What driver would use these?
>=20
> It's used by just this driver (the host) and the PHY driver (next
> patch in series).
>=20
> > My feeling is that if you have a mailbox that is used by multiple
> > drivers, you should use a proper mailbox driver to operate them,
> > and have the drivers register with that API instead of a custom one.
>=20
> Ok, will do.
>=20
> >> +     /* Create child xhci-plat device */
> >> +     memset(xhci_resources, 0, sizeof(xhci_resources));
> >> +     res =3D platform_get_resource(to_platform_device(dev), IORESOURC=
E_IRQ, 0);
> >> +     if (!res) {
> >> +             dev_err(dev, "Missing XHCI IRQ\n");
> >> +             ret =3D -ENODEV;
> >> +             goto out;
> >> +     }
> >> +     xhci_resources[0].start =3D res->start;
> >> +     xhci_resources[0].end =3D res->end;
> >> +     xhci_resources[0].flags =3D res->flags;
> >> +     xhci_resources[0].name =3D res->name;
> >> +     res =3D platform_get_resource(to_platform_device(dev), IORESOURC=
E_MEM, 0);
> >> +     if (!res) {
> >> +             dev_err(dev, "Missing XHCI registers\n");
> >> +             ret =3D -ENODEV;
> >> +             goto out;
> >> +     }
> >> +     xhci_resources[1].start =3D res->start;
> >> +     xhci_resources[1].end =3D res->end;
> >> +     xhci_resources[1].flags =3D res->flags;
> >> +     xhci_resources[1].name =3D res->name;
> >> +
> >> +     xhci =3D platform_device_alloc("xhci-hcd", PLATFORM_DEVID_AUTO);
> >> +     if (!xhci) {
> >> +             dev_err(dev, "Failed to allocate XHCI host\n");
> >> +             ret =3D -ENOMEM;
> >> +             goto out;
> >> +     }
> >
> > This does not feel appropriate at all: Rather than creating a child dev=
ice,
> > you should have a specific driver that hooks into functions exported
> > by the xhci core. See Documentation/driver-model/design-patterns.txt
>=20
> This is how DWC3, currently the only in-tree non-PCI XHCI host driver,
> is structured - see drivers/usb/dwc3/host.c.  The recently proposed
> Armada XHCI driver [1] just adds clock support and a hook in
> xhci-plat's probe() to do the platform-specific initialization.

Ugh... that very much sounds like the midlayer mistake. Doing that is
not going to scale in the long run. Everybody will just keep adding
quirks to the initialization until it's become a huge mess.

> Tegra's XHCI driver initialization is quite a bit more complicated,
> mainly due to the need for external firmware and specific ordering
> (e.g. firmware messages should only be enabled after the HCD is
> created).  I could do away with the xhci-plat sub-device and just
> create a Tegra hc_driver, but it seems silly to have three XHCI
> platform drivers structured in three different ways.  USB folks, do
> you have an opinion on how this should be done?

The tendency in other subsystems (and I think this is also true to some
degree for USB, though I'm less familiar with it) is to make common
functions available as a library of helpers so that other drivers can
use them (either directly or by wrapping them in platform-specific
implementations). That allows you to keep the platform-specific code
where it belongs: in the platform-specific driver.

Thierry

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTdS8UAAoJEN0jrNd/PrOhJ6kQAKlp/XRhFFDIJL5tcNiP5LsQ
a9Rqd3C2cKDJxJMOw2WDxsimb3TJLin2mZvQHPB4R4rNDsadYDanF34LIyJ3wrga
p0nmfYvCwndGTnokWVCBwQV3rAZfkshZ9PMrnv49KhIi5EvJ743D8McfO/0uSV3n
rl9n6vT/HzKWhXwuSfkyPi99Nl0eQBkI8x1WrZpSGuguZlTQUUEPt4DWvLI5dyOJ
CrAtjI4r6OQBqZZE4+DTO+DGdPmvPMAIMGIslNiljygNFfCdddhw4fZ+tXzDnc0/
9clcw5Xu2ofIDE2cvWOCgpgO9G6gpvFEYVYIalKhv5iiCnvjfdYbARPMqcg1ad/D
ioQQQFl/sz8GBog6lrTZrbUmROuF1K4xUsihUB/XFTS99q1OY7NnCDGbBuJw4vgn
tmt4K+U9+gmLCY66px+Mqp/C3i3aupGEI5tEbRitaI+BmJ223YlhfOsixlEf3j3r
6uJ7sg5/Dsd7SdnqOAjg4n089LqqLF4R5jHDaprsy55dZlFl/IbyT5iFFwrbMpRQ
OfuPXw5hySXRx07mObpo3SJqBOkjzchB6P+U2JB0t+k+p99AqKLdm38uvkfFu7Bp
ih00eK1H1Fod/DqyEu/VoBfoUHjjK1NK5KoX9ClmngYClXN39no/lCsEbo9XOw19
ApNDSSv+/SpT6BYQUNLo
=uX8L
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
