From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Date: Mon,  9 Dec 2019 16:07:46 +0100
Message-ID: <20191209150748.2471814-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On some platforms, the firmware will setup hardware to read from a given
region of memory. One such example is a display controller that is
scanning out a splash screen from physical memory.

During Linux' boot process, the ARM SMMU will configure all contexts to
fault by default. This means that memory accesses that happen by an SMMU
master before its driver has had a chance to properly set up the IOMMU
will cause a fault. This is especially annoying for something like the
display controller scanning out a splash screen because the faults will
result in the display controller getting bogus data (all-ones on Tegra)
and since it repeatedly scans that framebuffer, it will keep triggering
such faults and spam the boot log with them.

In order to work around such problems, scan the device tree for IOMMU
masters and set up a special identity domain that will map 1:1 all of
the reserved regions associated with them. This happens before the SMMU
is enabled, so that the mappings are already set up before translations
begin.

One thing that was pointed out earlier, and which I don't have a good
idea on how to solve it, is that the early identity domain is not
discarded. The assumption is that the standard direct mappings code of
the IOMMU framework will replace the early identity domain once devices
are properly attached to domains, but we don't have a good point in time
when it would be safe to remove the early identity domain.

One option that I can think of would be to create an early identity
domain for each master and inherit it when that master is attached to
the domain later on, but that seems rather complicated from an book-
keeping point of view and tricky because we need to be careful not to
map regions twice, etc.

Any good ideas on how to solve this? It'd also be interesting to see if
there's a more generic way of doing this. I know that something like
this isn't necessary on earlier Tegra SoCs with the custom Tegra SMMU
because translations are only enabled when the devices are attached to a
domain. I'm not sure about other IOMMUs, but in the absence of a struct
device, I suspect that we can't really do anything really generic that
would work across drivers.

Thierry

Thierry Reding (2):
  iommu: arm-smmu: Extract arm_smmu_of_parse()
  iommu: arm-smmu: Add support for early direct mappings

 drivers/iommu/arm-smmu.c | 195 +++++++++++++++++++++++++++++++++++++--
 drivers/iommu/arm-smmu.h |   2 +
 2 files changed, 189 insertions(+), 8 deletions(-)

-- 
2.23.0
