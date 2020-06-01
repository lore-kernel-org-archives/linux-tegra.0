From: Jerry Snitselaar <jsnitsel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Date: Mon, 1 Jun 2020 03:42:40 -0700
Message-ID: <20200601104240.7f5xhz7gooqhaq4n__23996.1936998711$1591008206$gmane$org@cantor>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200529221623.qc6twmpzryh7nkvb@cantor>
Reply-To: Jerry Snitselaar <jsnitsel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane-mx.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20200529221623.qc6twmpzryh7nkvb@cantor>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane-mx.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Lu Baolu <baolu.lu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Gerald Schaefer <gerald.schaefer-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jean-Philippe Brucker <jean-philippe-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, iommu-cunTk1MwBs9IKTv4iemRRA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri May 29 20, Jerry Snitselaar wrote:
>On Tue Apr 14 20, Joerg Roedel wrote:
>>Hi,
>>
>>here is the second version of this patch-set. The first version with
>>some more introductory text can be found here:
>>
>>	https://lore.kernel.org/lkml/20200407183742.4344-1-joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org/
>>
>>Changes v1->v2:
>>
>>	* Rebased to v5.7-rc1
>>
>>	* Re-wrote the arm-smmu changes as suggested by Robin Murphy
>>
>>	* Re-worked the Exynos patches to hopefully not break the
>>	  driver anymore
>>
>>	* Fixed a missing mutex_unlock() reported by Marek Szyprowski,
>>	  thanks for that.
>>
>>There is also a git-branch available with these patches applied:
>>
>>	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device-v2
>>
>>Please review.
>>
>>Thanks,
>>
>>	Joerg
>>
>>Joerg Roedel (32):
>> iommu: Move default domain allocation to separate function
>> iommu/amd: Implement iommu_ops->def_domain_type call-back
>> iommu/vt-d: Wire up iommu_ops->def_domain_type
>> iommu/amd: Remove dma_mask check from check_device()
>> iommu/amd: Return -ENODEV in add_device when device is not handled by
>>   IOMMU
>> iommu: Add probe_device() and remove_device() call-backs
>> iommu: Move default domain allocation to iommu_probe_device()
>> iommu: Keep a list of allocated groups in __iommu_probe_device()
>> iommu: Move new probe_device path to separate function
>> iommu: Split off default domain allocation from group assignment
>> iommu: Move iommu_group_create_direct_mappings() out of
>>   iommu_group_add_device()
>> iommu: Export bus_iommu_probe() and make is safe for re-probing
>> iommu/amd: Remove dev_data->passthrough
>> iommu/amd: Convert to probe/release_device() call-backs
>> iommu/vt-d: Convert to probe/release_device() call-backs
>> iommu/arm-smmu: Convert to probe/release_device() call-backs
>> iommu/pamu: Convert to probe/release_device() call-backs
>> iommu/s390: Convert to probe/release_device() call-backs
>> iommu/virtio: Convert to probe/release_device() call-backs
>> iommu/msm: Convert to probe/release_device() call-backs
>> iommu/mediatek: Convert to probe/release_device() call-backs
>> iommu/mediatek-v1 Convert to probe/release_device() call-backs
>> iommu/qcom: Convert to probe/release_device() call-backs
>> iommu/rockchip: Convert to probe/release_device() call-backs
>> iommu/tegra: Convert to probe/release_device() call-backs
>> iommu/renesas: Convert to probe/release_device() call-backs
>> iommu/omap: Remove orphan_dev tracking
>> iommu/omap: Convert to probe/release_device() call-backs
>> iommu/exynos: Use first SYSMMU in controllers list for IOMMU core
>> iommu/exynos: Convert to probe/release_device() call-backs
>> iommu: Remove add_device()/remove_device() code-paths
>> iommu: Unexport iommu_group_get_for_dev()
>>
>>Sai Praneeth Prakhya (1):
>> iommu: Add def_domain_type() callback in iommu_ops
>>
>>drivers/iommu/amd_iommu.c       |  97 ++++----
>>drivers/iommu/amd_iommu_types.h |   1 -
>>drivers/iommu/arm-smmu-v3.c     |  38 +--
>>drivers/iommu/arm-smmu.c        |  39 ++--
>>drivers/iommu/exynos-iommu.c    |  24 +-
>>drivers/iommu/fsl_pamu_domain.c |  22 +-
>>drivers/iommu/intel-iommu.c     |  68 +-----
>>drivers/iommu/iommu.c           | 393 +++++++++++++++++++++++++-------
>>drivers/iommu/ipmmu-vmsa.c      |  60 ++---
>>drivers/iommu/msm_iommu.c       |  34 +--
>>drivers/iommu/mtk_iommu.c       |  24 +-
>>drivers/iommu/mtk_iommu_v1.c    |  50 ++--
>>drivers/iommu/omap-iommu.c      |  99 ++------
>>drivers/iommu/qcom_iommu.c      |  24 +-
>>drivers/iommu/rockchip-iommu.c  |  26 +--
>>drivers/iommu/s390-iommu.c      |  22 +-
>>drivers/iommu/tegra-gart.c      |  24 +-
>>drivers/iommu/tegra-smmu.c      |  31 +--
>>drivers/iommu/virtio-iommu.c    |  41 +---
>>include/linux/iommu.h           |  21 +-
>>20 files changed, 533 insertions(+), 605 deletions(-)
>>
>>-- 
>>2.17.1
>>
>>_______________________________________________
>>iommu mailing list
>>iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
>>https://lists.linuxfoundation.org/mailman/listinfo/iommu
>>
>
>Hi Joerg,
>
>With this patchset, I have an epyc system where if I boot with
>iommu=nopt and force a dump I will see some io page faults for a nic
>on the system. The vmcore is harvested and the system reboots. I
>haven't reproduced it on other systems yet, but without the patchset I
>don't see the io page faults during the kdump.
>
>Regards,
>Jerry

I just hit an issue on a separate intel based system (kdump iommu=nopt),
where it panics in during intel_iommu_attach_device, in is_aux_domain,
due to device_domain_info being DEFER_DEVICE_DOMAIN_INFO. That doesn't
get set to a valid address until the domain_add_dev_info call.

Is it as simple as the following?

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 29d3940847d3..f1bbeed46a4c 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5053,8 +5053,8 @@ is_aux_domain(struct device *dev, struct iommu_domain *domain)
  {
         struct device_domain_info *info = dev->archdata.iommu;
  
-       return info && info->auxd_enabled &&
-                       domain->type == IOMMU_DOMAIN_UNMANAGED;
+       return info && info != DEFER_DEVICE_DOMAIN_INFO &&
+               info->auxd_enabled && domain->type == IOMMU_DOMAIN_UNMANAGED;
  }
  
  static void auxiliary_link_device(struct dmar_domain *domain,


Regards,
Jerry
