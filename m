From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 01/10] PCI: Keep pci_fixup_irqs() around after init
Date: Fri, 7 Sep 2012 19:00:24 +0200
Message-ID: <20120907170024.GA16114@avionic-0098.mockup.avionic-design.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
 <1343332512-28762-2-git-send-email-thierry.reding@avionic-design.de>
 <CAErSpo7v+i8i=mXCs7ZW8DtGTDN_4AEntwYLqGG8FcCzweySFg@mail.gmail.com>
 <20120815192814.GA12870@avionic-0098.mockup.avionic-design.de>
 <CAErSpo6cjOzJegJqXzmk59DChExcbLK1sOhwyAyQL4FZkTN21A@mail.gmail.com>
 <504A1EA2.9030008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <504A1EA2.9030008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 07, 2012 at 10:19:46AM -0600, Stephen Warren wrote:
> On 08/15/2012 01:42 PM, Bjorn Helgaas wrote:
> > On Wed, Aug 15, 2012 at 1:28 PM, Thierry Reding
> > <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> >> On Wed, Aug 15, 2012 at 10:06:27AM -0700, Bjorn Helgaas wrote:
> >>> On Thu, Jul 26, 2012 at 12:55 PM, Thierry Reding
> >>> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> >>>> When using deferred driver probing, PCI host controller drivers may
> >>>> actually require this function after the init stage.
> >>>>
> >>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> >>>> ---
> >>>> Changes in v3:
> >>>> - none
> >>>>
> >>>> Changes in v2:
> >>>> - use __devinit annotations
> >>>
> >>> Your original patch removed __init completely.  Here you change it to
> >>> __devinit.  That means we decide whether to discard the function based
> >>> on whether CONFIG_HOTPLUG is supported.  But I think your point is not
> >>> about hotplug; it's merely that we should be able to scan a PCI bus
> >>> after init-time.  We ought to be able to do a late PCI scan even if
> >>> hotplug is not supported.
> >>>
> >>> Therefore, I'd be inclined to remove __init completely unless you have
> >>> another reason for preferring __devinit.
> >>
> >> I thought __devinit would resolve to nothing if HOTPLUG is defined and
> >> __init otherwise. That seemed more appropriate. However you are right
> >> that it is useful to always have it available, so I'm fine with removi=
ng
> >> the annotations altogether. Do you want me to follow up with a patch? =
Or
> >> can you just take the first version? I'm not sure if it still applies.
> >=20
> > You're right about how __devinit works.  It's just that I don't think
> > hotplug is actually relevant here.  We're trying to make
> > pci_fixup_irqs() work after init, whether it's because of hotplug or
> > simply because the arch scans host bridges after init.
> >=20
> > I applied this to my "next" branch.  Thanks!
>=20
> Bjorn, I don't see this patch in next-20120907. Did it get dropped for
> some reason?

Yes, it turns out that dropping the annotations causes lots of section
mismatches on other architectures. See here[0] for the details. I think
the solution to the issue would be to either remove HOTPLUG altogether
and drop __devinit and __devexit annotations or update all architectures
to fix these warnings. I think Bjorn and I settled on the latter because
it's obviously less intrusive. I've been busy building toolchains for
all the PCI architectures and I think I have all of them. I'll just need
some more time to build, find and fix any remaining section mismatches.

Thierry

[0]: http://www.linux-mips.org/archives/linux-mips/2012-08/msg00250.html

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQSigoAAoJEN0jrNd/PrOhtVcP/iZEcqwhIa80XDbtk8PGt+j0
YgMQO2Ar3vV2LpcDV+5vHdhnjeFlu9hHGJmOQP1XCoFgsdWkTCXJfVhuXuudmlsA
PlgfMYDsNK3rzZA7jdPa0e0tPQ4E7ruqmn5LPWyF4EufqZ+K5jNXggU4cx8jbsX6
yC/vYJIRLJARzVClgOcKF2RZJF7BZXP/FllZ0uKh5I3sqriWmzc9LUraFkFZMsQC
Z+8YDw4svBrg9uF2dBE0hhz5vollOOtWrnlKOZ6qqXdRYwYAvkTJ0LaHtC5HvdQA
+SHuj9LYH181ASpqXTMU6Q3feczZrwx5sgqMJioNIy7KqedJWstdil1mIf7M9qja
D6K3ly5Z1Gcbw4qjXa7gH/lgJLoQZUe9+043HvdKQ2ip+Jf5HFVPALa3bWaLYHX5
35LJIYkVoZKNGwjXOqO67oO4pyXzCqB+xQT8h5STN/wkNwqiZdd0YmGMxSmE9Tku
3n5xc+lwcWWKplPGy50nTgVj1ZQRtG/R2UReZ6AJPd7onjJtavIOJdoqRMKa4Y9r
f6hfEf+XMvQff8h6dCMY45J2ErL4QALD8PDCI3N6SYLle8qzOsT+WJ2smbK8BXm9
l7l1v8X65EpnphSzlbP10y0MjfL0uuzz8XwUUkyhGEsI6EdeKrNYlcge5spnFpV9
crvo5nRlK5/ew1eFRZNN
=BMBy
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
