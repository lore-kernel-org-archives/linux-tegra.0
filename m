From: Laurentiu Tudor <laurentiu.tudor-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [RFC PATCH v2 0/2] iommu: arm-smmu: Add support for early direct
 mappings
Date: Tue, 17 Mar 2020 20:35:58 +0200
Message-ID: <a7abd8fd-52a1-6bb8-43d7-c8711af8ef74@nxp.com>
References: <20200317142107.28776-1-laurentiu.tudor@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200317142107.28776-1-laurentiu.tudor-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: saravanak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, pdaly-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, diana.craciun-3arQi8VN3Tc@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

[ +Russell ]

Forgot to Cc: you Russell, sorry about that. This patch series could be 
an important step towards fixing the MC firmware over smmu issue on nxp 
layerscape chips.

---

Best Regards, Laurentiu

On 3/17/2020 4:21 PM, laurentiu.tudor-3arQi8VN3Tc@public.gmane.org wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> On some platforms, the firmware will setup hardware to read from a given
> region of memory. One such example is a display controller that is
> scanning out a splash screen from physical memory.
>
> During Linux' boot process, the ARM SMMU will configure all contexts to
> fault by default. This means that memory accesses that happen by an SMMU
> master before its driver has had a chance to properly set up the IOMMU
> will cause a fault. This is especially annoying for something like the
> display controller scanning out a splash screen because the faults will
> result in the display controller getting bogus data (all-ones on Tegra)
> and since it repeatedly scans that framebuffer, it will keep triggering
> such faults and spam the boot log with them.
>
> In order to work around such problems, scan the device tree for IOMMU
> masters and set up a special identity domain that will map 1:1 all of
> the reserved regions associated with them. This happens before the SMMU
> is enabled, so that the mappings are already set up before translations
> begin.
>
> One thing that was pointed out earlier, and which I don't have a good
> idea on how to solve it, is that the early identity domain is not
> discarded. The assumption is that the standard direct mappings code of
> the IOMMU framework will replace the early identity domain once devices
> are properly attached to domains, but we don't have a good point in time
> when it would be safe to remove the early identity domain.
>
> One option that I can think of would be to create an early identity
> domain for each master and inherit it when that master is attached to
> the domain later on, but that seems rather complicated from an book-
> keeping point of view and tricky because we need to be careful not to
> map regions twice, etc.
>
> Any good ideas on how to solve this? It'd also be interesting to see if
> there's a more generic way of doing this. I know that something like
> this isn't necessary on earlier Tegra SoCs with the custom Tegra SMMU
> because translations are only enabled when the devices are attached to a
> domain. I'm not sure about other IOMMUs, but in the absence of a struct
> device, I suspect that we can't really do anything really generic that
> would work across drivers.
>
> Previous version: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fcover%2F11279577%2F&amp;data=02%7C01%7Claurentiu.tudor%40nxp.com%7Cb40c3ee306224a2fc8fe08d7ca7e8007%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637200517038451677&amp;sdata=rq8Ojkh1fovakZ2jTGHjSUaYROtvjY8ZDItEiqCTuI4%3D&amp;reserved=0
>
> Changes in v2:
>   - recreate identity mappings when the device is placed in its rightful domain
>   - delete its original identity mappings from the identity domain
>   - added a counter to keep track of number of devices with identity mappings
>   - free identity domain when the counter reaches 0
>   - this should help fix our firmware issue, mentioned here [1]
>
> [1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fcomment%2F23200041%2F&amp;data=02%7C01%7Claurentiu.tudor%40nxp.com%7Cb40c3ee306224a2fc8fe08d7ca7e8007%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637200517038451677&amp;sdata=Q0T326D1QMz5EtWY%2BzVUxdd01AbKySe8Ota66H2rkiI%3D&amp;reserved=0
>
> Thierry Reding (2):
>    iommu: arm-smmu: Extract arm_smmu_of_parse()
>    iommu: arm-smmu: Add support for early direct mappings
>
>   drivers/iommu/arm-smmu.c | 280 +++++++++++++++++++++++++++++++++++++--
>   drivers/iommu/arm-smmu.h |   3 +
>   2 files changed, 275 insertions(+), 8 deletions(-)
>
