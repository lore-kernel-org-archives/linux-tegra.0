From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 1/2] ARM: Tegra: Device Tree Support: Update how sdhci
 devices are initialized
Date: Tue, 10 May 2011 15:16:17 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04986AA077@HQMAIL01.nvidia.com>
References: <20110510201108.22693.50319.stgit@riker>
	<20110510201414.22693.7427.stgit@riker>
	<74CDBE0F657A3D45AFBB94109FB122FF04986AA06A@HQMAIL01.nvidia.com>
 <BANLkTingm7PCJPC-xCremYg_Ab7qFvPSag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTingm7PCJPC-xCremYg_Ab7qFvPSag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Tuesday, May 10, 2011 4:07 PM:
> > On Tue, May 10, 2011 at 3:03 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
> > John Bonesio wrote at Tuesday, May 10, 2011 2:14 PM:
> > > This patch changes how sdhci devices are initialized so that a la=
ter
> > > patch can easily add support for i2c devies.
> > >
> > > +static struct tegra_sdhci_platform_data sdhci_pdata1 =3D {
> > > + =A0 =A0 .cd_gpio =A0 =A0 =A0 =A0=3D -1,
> > > + =A0 =A0 .wp_gpio =A0 =A0 =A0 =A0=3D -1,
> > > + =A0 =A0 .power_gpio =A0 =A0 =3D -1,
> > > +};
> > > +
> > So I understand why board-dt is itself registering the SDHCI platfo=
rm
> > devices itself; so that the pdev initialization path is identical
> > between fully hard-coded boards and board-dt.c.
> >=20
> > However, I'm surprised that we would include the platform data for
> > those devices within that argument; if we do that, we'll end up nee=
ding
> > different platform data for every board, and devicetree won't have
> > bought us anything.
> >=20
> > In other words, I understood that board-dt would register all the
> > platform devices within Tegra, but not set up any of the plataform
> > data, and the device drivers for those devices would be updated to
> > get their platform data from devicetree if available, then fall bac=
k
> > to old-style platform data. In other words, the way the SDHCI drive=
rs
> > work today in the devicetree/test branch.
> >=20
> > If my understanding is correct, shouldn't the chunk above and the
> > one below be removed?
>
> That's if we cut everything over, I think. until then, this code shou=
ld
> fill in the platform_device and register it. But the values should co=
me
> from the device tree, and it should only register the controllers tha=
t are
> in the tree (and not marked as disabled).

But doesn't that require board-dt.c to walk and parse the devicetree,
extract the platform data from the DT, and fill in the platform data
structures? I thought we'd explicitly talked about that and decided tha=
t
was a bad idea, since it'd duplicate each driver's DT parsing into
board-dt.c?

--=20
nvpublic
