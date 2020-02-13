From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 0/5] memory: Introduce memory controller mini-framework
Date: Thu, 13 Feb 2020 17:23:23 +0000
Message-ID: <9841eb35-65e4-632a-ceff-bb2ba3b11bb0@arm.com>
References: <20200213163959.819733-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200213163959.819733-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

[+ Maxime]

On 13/02/2020 4:39 pm, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Hi,
> 
> this set of patches adds a new binding that allows device tree nodes to
> explicitly define the DMA parent for a given device. This supplements
> the existing interconnect bindings and is useful to disambiguate in the
> case where a device has multiple paths to system memory. Beyond that it
> can also be useful when there aren't any actual interconnect paths that
> can be controlled, so in simple cases this can serve as a simpler
> variant of interconnect paths.

Isn't that still squarely the intent of the "dma-mem" binding, though? 
i.e. it's not meant to be a 'real' interconnect provider, but a very 
simple way to encode DMA parentage piggybacked onto a more general 
binding (with the *option* of being a full-blown interconnect if it 
wants to, but certainly no expectation).

Robin.

> One other case where this is useful is to describe the relationship
> between devices such as the memory controller and an IOMMU, for example.
> On Tegra186 and later, the memory controller is programmed with a set of
> stream IDs that are to be associated with each memory client. This
> programming needs to happen before translations through the IOMMU start,
> otherwise the used stream IDs may deviate from the expected values. The
> memory-controllers property is used in this case to ensure that the
> memory controller driver has been probed (and hence has programmed the
> stream ID mappings) before the IOMMU becomes available.
> 
> Patch 1 introduces the memory controller bindings, both from the
> perspective of the provider and the consumer. Patch 2 makes use of a
> memory-controllers property to determine the DMA parent for the purpose
> of setting up DMA masks (based on the dma-ranges property of the DMA
> parent). Patch 3 introduces a minimalistic framework that is used to
> register memory controllers with along with a set of helpers to look up
> the memory controller from device tree.
> 
> An example of how to register a memory controller is shown in patch 4
> for Tegra186 (and later) and finally the ARM SMMU driver is extended to
> become a consumer of an (optional) memory controller. As described
> above, the goal is to defer probe as long as the memory controller has
> not yet programmed the stream ID mappings.
> 
> Thierry
> 
> Thierry Reding (5):
>    dt-bindings: Add memory controller bindings
>    of: Use memory-controllers property for DMA parent
>    memory: Introduce memory controller mini-framework
>    memory: tegra186: Register as memory controller
>    iommu: arm-smmu: Get reference to memory controller
> 
>   .../bindings/memory-controllers/consumer.yaml |  14 +
>   .../memory-controllers/memory-controller.yaml |  32 +++
>   drivers/iommu/arm-smmu.c                      |  11 +
>   drivers/iommu/arm-smmu.h                      |   2 +
>   drivers/memory/Makefile                       |   1 +
>   drivers/memory/core.c                         | 248 ++++++++++++++++++
>   drivers/memory/tegra/tegra186.c               |   9 +-
>   drivers/of/address.c                          |  25 +-
>   include/linux/memory-controller.h             |  34 +++
>   9 files changed, 366 insertions(+), 10 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/consumer.yaml
>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/memory-controller.yaml
>   create mode 100644 drivers/memory/core.c
>   create mode 100644 include/linux/memory-controller.h
> 
