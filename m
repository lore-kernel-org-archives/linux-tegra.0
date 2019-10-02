From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 00/11] of: Fix DMA configuration for non-DT masters
Date: Wed, 2 Oct 2019 11:28:06 -0700
Message-ID: <fbae48ca-fbd4-e32b-e874-92b5bba5df4d@gmail.com>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
 <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
 <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
 <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
 <aa4c8d62-7990-e385-2bb1-cec55148f0a8@arm.com>
 <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA@mail.gmail.com>
 <307b988d0c67fb1c42166eca12742bcfda09d92d.camel@suse.de>
 <c27a51e1-1adf-ae6a-dc67-ae76222a1163@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c27a51e1-1adf-ae6a-dc67-ae76222a1163@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Rob Herring <robh+dt@kernel.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, Stefan Wahren <wahrenst@gmx.net>, james.quinlan@broadcom.com, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>, freedreno <freedreno@lists.freedesktop.org>, Linux
List-Id: linux-tegra@vger.kernel.org



On 9/26/2019 4:20 AM, Robin Murphy wrote:
> On 2019-09-26 11:44 am, Nicolas Saenz Julienne wrote:
>>>>>> Robin, have you looked into supporting multiple dma-ranges? It's the
>>>>>> next thing
>>>>>> we need for BCM STB's PCIe. I'll have a go at it myself if nothing
>>>>>> is in
>>>>>> the
>>>>>> works already.
>>>>>
>>>>> Multiple dma-ranges as far as configuring inbound windows should work
>>>>> already other than the bug when there's any parent translation. But if
>>>>> you mean supporting multiple DMA offsets and masks per device in the
>>>>> DMA API, there's nothing in the works yet.
>>
>> Sorry, I meant supporting multiple DMA offsets[1]. I think I could
>> still make
>> it with a single DMA mask though.
> 
> The main problem for supporting that case in general is the disgusting
> carving up of the physical memory map you may have to do to guarantee
> that a single buffer allocation cannot ever span two windows with
> different offsets. I don't think we ever reached a conclusion on whether
> that was even achievable in practice.

It is with the Broadcom STB SoCs which have between 1 and 3 memory
controllers depending on the SoC, and multiple dma-ranges cells for PCIe
as a consequence.

Each memory controller has a different physical address aperture in the
CPU's physical address map (e.g.: MEMC0 is 0x0 - 0x3fff_ffff, MEMC1
0x4000_0000 - 0x7ffff_ffff and MEMC2 0x8000_0000 - 0xbfff_ffff, not
counting the extension regions above 4GB), and while the CPU is
scheduled and arbitrated the same way across all memory controllers
(thus making it virtually UMA, almost) having a buffer span two memory
controllers would be problematic because the memory controllers do not
know how to guarantee the transaction ordering and buffer data
consistency in both DRAM itself and for other memory controller clients,
like PCIe.

We historically had to reserve the last 4KB of each memory controller to
avoid problematic controllers like EHCI to prefetch beyond the end of a
memory controller's populated memory and that also incidentally takes
care of never having a buffer cross a controller boundary. Either you
can allocate the entire buffer on a given memory controller, or you
cannot allocate memory at all on that zone/region and another one must
be found (or there is no more memory and there is a genuine OOM).

The way we reserve memory right now is based on the first patch
submitted by Jim:

https://lore.kernel.org/patchwork/patch/988469/

whereby we read the memory node's "reg" property and we map the physical
addresses to the memory controller configuration read from the specific
registers in the CPU's Bus Interface Unit (where the memory controller
apertures are architecturally defined) and then we use that to call
memblock_reserve() (not part of that patch, it should be though).
-- 
Florian
