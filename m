From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 00/11] of: Fix DMA configuration for non-DT masters
Date: Wed, 25 Sep 2019 16:09:12 +0100
Message-ID: <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-wireless <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, etnaviv@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>, xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-pci@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, Florian Fainelli <f.fainelli@gmail.com>, james.quinlan@broadcom.com, Stefan Wahren <wahrenst@gmx.net>, Dan Williams <dan.j>
List-Id: linux-tegra@vger.kernel.org

On 25/09/2019 15:52, Nicolas Saenz Julienne wrote:
> On Tue, 2019-09-24 at 16:59 -0500, Rob Herring wrote:
>> On Tue, Sep 24, 2019 at 1:12 PM Nicolas Saenz Julienne
>> <nsaenzjulienne@suse.de> wrote:
>>> Hi All,
>>> this series tries to address one of the issues blocking us from
>>> upstreaming Broadcom's STB PCIe controller[1]. Namely, the fact that
>>> devices not represented in DT which sit behind a PCI bus fail to get the
>>> bus' DMA addressing constraints.
>>>
>>> This is due to the fact that of_dma_configure() assumes it's receiving a
>>> DT node representing the device being configured, as opposed to the PCIe
>>> bridge node we currently pass. This causes the code to directly jump
>>> into PCI's parent node when checking for 'dma-ranges' and misses
>>> whatever was set there.
>>>
>>> To address this I create a new API in OF - inspired from Robin Murphys
>>> original proposal[2] - which accepts a bus DT node as it's input in
>>> order to configure a device's DMA constraints. The changes go deep into
>>> of/address.c's implementation, as a device being having a DT node
>>> assumption was pretty strong.
>>>
>>> On top of this work, I also cleaned up of_dma_configure() removing its
>>> redundant arguments and creating an alternative function for the special
>>> cases
>>> not applicable to either the above case or the default usage.
>>>
>>> IMO the resulting functions are more explicit. They will probably
>>> surface some hacky usages that can be properly fixed as I show with the
>>> DT fixes on the Layerscape platform.
>>>
>>> This was also tested on a Raspberry Pi 4 with a custom PCIe driver and
>>> on a Seattle AMD board.
>>
>> Humm, I've been working on this issue too. Looks similar though yours
>> has a lot more churn and there's some other bugs I've found.
> 
> That's good news, and yes now that I see it, some stuff on my series is overly
> complicated. Specially around of_translate_*().
> 
> On top of that, you removed in of_dma_get_range():
> 
> -	/*
> -	 * At least empty ranges has to be defined for parent node if
> -	 * DMA is supported
> -	 */
> -	if (!ranges)
> -		break;
> 
> Which I assumed was bound to the standard and makes things easier.
> 
>> Can you test out this branch[1]. I don't have any h/w needing this,
>> but wrote a unittest and tested with modified QEMU.
> 
> I reviewed everything, I did find a minor issue, see the patch attached.

WRT that patch, the original intent of "force_dma" was purely to 
consider a device DMA-capable regardless of the presence of 
"dma-ranges". Expecting of_dma_configure() to do anything for a non-OF 
device has always been bogus - magic paravirt devices which appear out 
of nowhere and expect to be treated as genuine DMA masters are a 
separate problem that we haven't really approached yet.

Robin.
