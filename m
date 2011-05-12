From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 2/3] ARM: Tegra: Device Tree Support: Add i2c devices
Date: Wed, 11 May 2011 22:10:36 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04986AA2C9@HQMAIL01.nvidia.com>
References: <20110511231905.10362.12844.stgit@riker>
 <20110511232659.10362.45811.stgit@riker>
 <74CDBE0F657A3D45AFBB94109FB122FF04986AA2C5@HQMAIL01.nvidia.com>
 <BANLkTinvDRDfdGawFBb=OE8DqG_DW7L6qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTinvDRDfdGawFBb=OE8DqG_DW7L6qQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Grant Likely wrote at Wednesday, May 11, 2011 10:47 PM:
> On Thu, May 12, 2011 at 6:34 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =
wrote:
> > John Bonesio wrote at Wednesday, May 11, 2011 5:27 PM:
> >> This patch initializes i2c controller devices in board-dt.c. The i=
2c controller
> >> is added to tegra250.dtsi so later on-board i2c devices can be fou=
nd and
> >> initialized based on the device tree information.
> >>...
> >> @@ -598,6 +609,7 @@ static int tegra_i2c_probe(struct platform_dev=
ice *pdev)
> >> =A0 =A0 =A0 i2c_dev->adapter.algo =3D &tegra_i2c_algo;
> >> =A0 =A0 =A0 i2c_dev->adapter.dev.parent =3D &pdev->dev;
> >> =A0 =A0 =A0 i2c_dev->adapter.nr =3D pdev->id;
> >> + =A0 =A0 i2c_dev->adapter.dev.of_node =3D of_node_get(pdev->dev.o=
f_node);
> >
> > It seems like users of this of_node (i.e. the probe function) could=
 just
> > access pdev->dev.of_node directly (since pdev is already passed in)
> > rather than storing a copy here. At least, sdhci-tegra.c works that=
 way.
> > Still, this isn't a big deal, I think.
>=20
> Actually, using of_node_get() here is the right thing since it
> increases the reference count on the of_node.  However, the patch
> should also do an of_node_put() in the remove hook, or in the .probe
> error path.

Ah OK, I was missing that the later all of of_i2c_register_devices()
uses i2c_dev->adapter.dev.of_node; I was thinking that it'd just use
i2c_dev->adapter.dev.parent->of_node directly, in which case we
wouldn't need to copy the pointer, nor increment the refcount.

So, I agree this is OK.

--=20
nvpublic
