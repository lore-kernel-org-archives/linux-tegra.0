From: Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 00/11] of: Fix DMA configuration for non-DT masters
Date: Wed, 25 Sep 2019 17:30:10 +0200
Message-ID: <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
         <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
         <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
         <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Jc6/4bVbm9VDLL08SmH3"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e404c65b-5a66-6f91-5b38-8bf89a7697b2-5wv7dgnIgG8@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <wahrenst-hi6Y0CQ0nG0@public.gmane.org>, james.quinlan-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lis>
List-Id: linux-tegra@vger.kernel.org


--=-Jc6/4bVbm9VDLL08SmH3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-25 at 16:09 +0100, Robin Murphy wrote:
> On 25/09/2019 15:52, Nicolas Saenz Julienne wrote:
> > On Tue, 2019-09-24 at 16:59 -0500, Rob Herring wrote:
> > > On Tue, Sep 24, 2019 at 1:12 PM Nicolas Saenz Julienne
> > > <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org> wrote:
> > > > Hi All,
> > > > this series tries to address one of the issues blocking us from
> > > > upstreaming Broadcom's STB PCIe controller[1]. Namely, the fact tha=
t
> > > > devices not represented in DT which sit behind a PCI bus fail to ge=
t the
> > > > bus' DMA addressing constraints.
> > > >=20
> > > > This is due to the fact that of_dma_configure() assumes it's receiv=
ing a
> > > > DT node representing the device being configured, as opposed to the=
 PCIe
> > > > bridge node we currently pass. This causes the code to directly jum=
p
> > > > into PCI's parent node when checking for 'dma-ranges' and misses
> > > > whatever was set there.
> > > >=20
> > > > To address this I create a new API in OF - inspired from Robin Murp=
hys
> > > > original proposal[2] - which accepts a bus DT node as it's input in
> > > > order to configure a device's DMA constraints. The changes go deep =
into
> > > > of/address.c's implementation, as a device being having a DT node
> > > > assumption was pretty strong.
> > > >=20
> > > > On top of this work, I also cleaned up of_dma_configure() removing =
its
> > > > redundant arguments and creating an alternative function for the sp=
ecial
> > > > cases
> > > > not applicable to either the above case or the default usage.
> > > >=20
> > > > IMO the resulting functions are more explicit. They will probably
> > > > surface some hacky usages that can be properly fixed as I show with=
 the
> > > > DT fixes on the Layerscape platform.
> > > >=20
> > > > This was also tested on a Raspberry Pi 4 with a custom PCIe driver =
and
> > > > on a Seattle AMD board.
> > >=20
> > > Humm, I've been working on this issue too. Looks similar though yours
> > > has a lot more churn and there's some other bugs I've found.
> >=20
> > That's good news, and yes now that I see it, some stuff on my series is
> > overly
> > complicated. Specially around of_translate_*().
> >=20
> > On top of that, you removed in of_dma_get_range():
> >=20
> > -	/*
> > -	 * At least empty ranges has to be defined for parent node if
> > -	 * DMA is supported
> > -	 */
> > -	if (!ranges)
> > -		break;
> >=20
> > Which I assumed was bound to the standard and makes things easier.
> >=20
> > > Can you test out this branch[1]. I don't have any h/w needing this,
> > > but wrote a unittest and tested with modified QEMU.
> >=20
> > I reviewed everything, I did find a minor issue, see the patch attached=
.
>=20
> WRT that patch, the original intent of "force_dma" was purely to=20
> consider a device DMA-capable regardless of the presence of=20
> "dma-ranges". Expecting of_dma_configure() to do anything for a non-OF=
=20
> device has always been bogus - magic paravirt devices which appear out=
=20
> of nowhere and expect to be treated as genuine DMA masters are a=20
> separate problem that we haven't really approached yet.

I agree it's clearly abusing the function. I have no problem with the behav=
iour
change if it's OK with you.

Robin, have you looked into supporting multiple dma-ranges? It's the next t=
hing
we need for BCM STB's PCIe. I'll have a go at it myself if nothing is in th=
e
works already.

Regards,
Nicolas


--=-Jc6/4bVbm9VDLL08SmH3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2LiAIACgkQlfZmHno8
x/7J7Af+NrtcYkM0WphLDC8n2KXI1Rofej10z7b8lAcPZvn586CNcayUtga34+e3
jMIOwHl9qzzFJrgAT9FoyDjkcJ0gfVWKSzQYB798pTOVEND7LdUsHH0ZNqNqf4YM
yRmNNvCpZi+i83aeetAQjPoMUeDjKU0dMCX7oEzfvlrmxi4YRx59jcOfIbaqr2Hg
SGipuOc97V/so7VcwvypG9xeYU/zTeZ0wFoQzT7X4OdEUp4uBAgHoeou4kez1gSy
27EmZX8DU3l7YbWTM5SBP13uDcQ0I2y25cjjy55r4gBm+zQYdGCuh3oHbdOvyws/
xjAYrC9sFk3+VCjuPTn9CTbfyDqZ8A==
=9rW4
-----END PGP SIGNATURE-----

--=-Jc6/4bVbm9VDLL08SmH3--
