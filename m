From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 00/11] of: Fix DMA configuration for non-DT masters
Date: Wed, 25 Sep 2019 11:07:25 -0500
Message-ID: <CAL_JsqKuz7WEB9zP6apZrdsC_8Q4OQmSuvqgLzJFPsZio0Z6=g@mail.gmail.com>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de> <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-wireless <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, etnaviv@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>, xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-pci@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, james.quinlan@broadcom.comStefan Wahren <w>
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 25, 2019 at 9:53 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> On Tue, 2019-09-24 at 16:59 -0500, Rob Herring wrote:
> > On Tue, Sep 24, 2019 at 1:12 PM Nicolas Saenz Julienne
> > <nsaenzjulienne@suse.de> wrote:
> > > Hi All,
> > > this series tries to address one of the issues blocking us from
> > > upstreaming Broadcom's STB PCIe controller[1]. Namely, the fact that
> > > devices not represented in DT which sit behind a PCI bus fail to get the
> > > bus' DMA addressing constraints.
> > >
> > > This is due to the fact that of_dma_configure() assumes it's receiving a
> > > DT node representing the device being configured, as opposed to the PCIe
> > > bridge node we currently pass. This causes the code to directly jump
> > > into PCI's parent node when checking for 'dma-ranges' and misses
> > > whatever was set there.
> > >
> > > To address this I create a new API in OF - inspired from Robin Murphys
> > > original proposal[2] - which accepts a bus DT node as it's input in
> > > order to configure a device's DMA constraints. The changes go deep into
> > > of/address.c's implementation, as a device being having a DT node
> > > assumption was pretty strong.
> > >
> > > On top of this work, I also cleaned up of_dma_configure() removing its
> > > redundant arguments and creating an alternative function for the special
> > > cases
> > > not applicable to either the above case or the default usage.
> > >
> > > IMO the resulting functions are more explicit. They will probably
> > > surface some hacky usages that can be properly fixed as I show with the
> > > DT fixes on the Layerscape platform.
> > >
> > > This was also tested on a Raspberry Pi 4 with a custom PCIe driver and
> > > on a Seattle AMD board.
> >
> > Humm, I've been working on this issue too. Looks similar though yours
> > has a lot more churn and there's some other bugs I've found.
>
> That's good news, and yes now that I see it, some stuff on my series is overly
> complicated. Specially around of_translate_*().
>
> On top of that, you removed in of_dma_get_range():
>
> -       /*
> -        * At least empty ranges has to be defined for parent node if
> -        * DMA is supported
> -        */
> -       if (!ranges)
> -               break;
>
> Which I assumed was bound to the standard and makes things easier.

The standard is whatever we say it is and what exists in the wild...

Probably better for me to get the series posted for context, but the
above is removed because we could be passing in the bus device/child
node and checking for 'dma-ranges' rather than only the bus node.
While this does mean 'dma-ranges' could be in a child node which is
wrong, it simplifies the only caller of_dma_configure(). And really,
there's no way to detect that error. Someone could call
of_dma_configure(NULL, child, ...). Perhaps we could assert that
'ranges' is present whenever 'dma-ranges' is.

Back to the standard, I think it can be summarized as a device's
immediate parent (a bus node) must contain 'dma-ranges'. All the
parent nodes of the bus node should also have 'dma-ranges', but
missing is treated as empty (1:1 translation). 'dma-ranges' missing in
all the parent nodes is also treated as 1:1 translation and no
addressing restrictions.

> > Can you test out this branch[1]. I don't have any h/w needing this,
> > but wrote a unittest and tested with modified QEMU.
>
> I reviewed everything, I did find a minor issue, see the patch attached.
>
> Also I tested your branch both on an RPi4, with a PCI device that depends on
> these changes and by comparing the OF debugs logs on a Layerscape board which
> uses dma-ranges, dma-coherent and IOMMU. All works as expected.
>
> Will you send this series for v5.5? Please keep me in the loop, I'll review and
> test the final version.

Yes, sending it out soon.

Rob
