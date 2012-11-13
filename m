From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] drm: Add NVIDIA Tegra20 support
Date: Tue, 13 Nov 2012 10:16:30 +0200
Message-ID: <50A201DE.9090409@nvidia.com>
References: <1352469579-3337-1-git-send-email-thierry.reding@avionic-design.de> <1352469579-3337-2-git-send-email-thierry.reding@avionic-design.de> <50A1FE01.5090808@nvidia.com> <20121113080323.GA15983@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121113080323.GA15983-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 13.11.2012 10:03, Thierry Reding wrote:
> That should be fixed with v2 I posted a few hours ago.

That's true.

> Yes, Tegra30 support will follow in a separate patch. As for IOMMU
> support it should eventually be made completely transparent, but I'm not
> opposed to adding a patch with explicit IOMMU support back in if it
> turns out that it can't be done transparently.

The trouble with this is that the generic case demands that we support
each device having a separate address space. But, on Tegra30 SMMU has
only four address spaces, so in Tegra30 case we actually end up using
the same address space for multiple devices.

Second problem is trying to avoid double mapping. With 2D acceleration,
we need support for allocating buffers, and mapping them to DC, host1x
and 2D. DMA Mapping API has a problem in that it doesn't allow just
allocating - it forces mapping the buffer to a device at the same time.
So, when 2D submit contains a reference to a dma-buf, the buffer has
already been mapped to some device, but we don't have a good way of
detecting that. We end up mapping it again, which is a performance
killer and possibly a coherence problem.

Fortunately this is all related to 2D acceleration, so we can defer both
of these problems for now.

Best regards,
Terje
