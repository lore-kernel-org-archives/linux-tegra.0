From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 01/10] PCI: Keep pci_fixup_irqs() around after init
Date: Wed, 15 Aug 2012 22:01:16 +0200
Message-ID: <20120815200116.GB12870@avionic-0098.mockup.avionic-design.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
 <1343332512-28762-2-git-send-email-thierry.reding@avionic-design.de>
 <CAErSpo7v+i8i=mXCs7ZW8DtGTDN_4AEntwYLqGG8FcCzweySFg@mail.gmail.com>
 <20120815192814.GA12870@avionic-0098.mockup.avionic-design.de>
 <CAErSpo6cjOzJegJqXzmk59DChExcbLK1sOhwyAyQL4FZkTN21A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0079125791072814664=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAErSpo6cjOzJegJqXzmk59DChExcbLK1sOhwyAyQL4FZkTN21A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0079125791072814664==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 01:42:39PM -0600, Bjorn Helgaas wrote:
> On Wed, Aug 15, 2012 at 1:28 PM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > On Wed, Aug 15, 2012 at 10:06:27AM -0700, Bjorn Helgaas wrote:
> >> On Thu, Jul 26, 2012 at 12:55 PM, Thierry Reding
> >> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> >> > When using deferred driver probing, PCI host controller drivers may
> >> > actually require this function after the init stage.
> >> >
> >> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> >> > ---
> >> > Changes in v3:
> >> > - none
> >> >
> >> > Changes in v2:
> >> > - use __devinit annotations
> >>
> >> Your original patch removed __init completely.  Here you change it to
> >> __devinit.  That means we decide whether to discard the function based
> >> on whether CONFIG_HOTPLUG is supported.  But I think your point is not
> >> about hotplug; it's merely that we should be able to scan a PCI bus
> >> after init-time.  We ought to be able to do a late PCI scan even if
> >> hotplug is not supported.
> >>
> >> Therefore, I'd be inclined to remove __init completely unless you have
> >> another reason for preferring __devinit.
> >
> > I thought __devinit would resolve to nothing if HOTPLUG is defined and
> > __init otherwise. That seemed more appropriate. However you are right
> > that it is useful to always have it available, so I'm fine with removing
> > the annotations altogether. Do you want me to follow up with a patch? Or
> > can you just take the first version? I'm not sure if it still applies.
>=20
> You're right about how __devinit works.  It's just that I don't think
> hotplug is actually relevant here.  We're trying to make
> pci_fixup_irqs() work after init, whether it's because of hotplug or
> simply because the arch scans host bridges after init.
>=20
> I applied this to my "next" branch.  Thanks!

Great! Thanks. It's nice to see the patch series shrink. =3D)

Thierry

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQLAAMAAoJEN0jrNd/PrOhEFIQAK3kNbIdYxs1GMd5vMRm1V67
ZJLdqBv9G5dwO/ryCmnVI2ZZeG5H1TD3CizzPkN/8ANRRx5lbicoY4Rxu1QsbsCR
8z29tUliIry8e6GrakucgzEMVNRas49pPxS6eBzwzZ6Xk+cWTD4dbyqrDJqRMent
ZSjXFVPprvEJA3IO6Nz7GGVgiNODweBSjHLzTusY/RDrcoPe+9FhEqqXiuXju/wQ
XfMG5zXLS8gxq4NK5RH9QYcsOswElrnkthcReTG+4HlyNWXpytrgxsUg8ASxw9co
hx8Dy/OYaVutUdqO9ky6v8J9rp7p7xvGl8ynNLqsoHzdDmz2c0A+G4rD2NoBg1Y4
ribx5tvhXRD9FVUZc4tqsgcikqFKuP5YQwwJgYMzBYT4amZCNrwl/kdQ3UZXFemq
nLQroeX53Nuka/Rew1igtHaMaFYIgN0ZruG7cGe1SAS+/9ULUHvaPCbbXu4CvoQD
T8lMjXadFaS28UMdb0rfI+mNVHIw/4ZYE2N3h2W3a4US+Ha6dnwtvbRCXpnqbHy2
zPnDEHORCvLFfnP0D4yu/KhOYRj+qEwBYPRsZxOukzwCaD8EHTwipRrvc9X28Czz
vB4hwu90qA2bSycvgPICDirtmog862lztqr1P5UwuTXJaihWeVG7jvIVojc6ehxJ
mtcihxwgvpXpqoeh9qhD
=MNUd
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--

--===============0079125791072814664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0079125791072814664==--
