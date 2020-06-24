From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Date: Wed, 24 Jun 2020 23:55:25 +0300
Message-ID: <867dea06-8741-82e8-3e26-9a017ad9057a@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

23.06.2020 15:09, Mikko Perttunen пишет:
...
> * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
> Not sure if they are still needed.

Hello Mikko!

A quick comment for the starter. Switching away from the Tegra-specific
GEM IOCTLs to the dma-buf heaps is a such radical change! But I like it!

Previously I was curious about whether we could have multiple CMA
regions (one shared/reusable and other private, for example) for the
Tegra DRM driver and at a quick glance the dma-buf heaps could be a nice
solution that avoids re-inventing a driver-specific things for that.

I'm instantly foreseeing these types of heaps:

1. Large reusable CMA heap.
2. Smaller non-reusable common CMA that could be used when allocation
from a reusable CMA fails. Or vice versa, when we want to reduce the
chance to block for a long time on allocation, for example.
3. Sparse (system) memory heap.

It's the first time I'm looking at the dma-buf heaps and it sounds like
a very nice idea to utilize them!

The https://lkml.org/lkml/2019/11/18/787 says that the system-contiguous
and carveout heaps we not added because they were not needed, but they
will be needed for the Tegra20 drivers and for the case where IOMMU is
disabled. It shouldn't be difficult to add these types of heaps.

I'll continue to examine the dma-buf heaps in a more details.
