From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v9 2/4] iommu/arm-smmu: add NVIDIA implementation for ARM
 MMU-500 usage
Date: Wed, 1 Jul 2020 09:16:01 +0100
Message-ID: <ed35713b-ec24-db7b-7367-7873134f76ca@nvidia.com>
References: <20200630235752.8737-1-vdumpa@nvidia.com>
 <20200630235752.8737-3-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200630235752.8737-3-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 01/07/2020 00:57, Krishna Reddy wrote:
> NVIDIA's Tegra194 SoC has three ARM MMU-500 instances.
> It uses two of ARM MMU-500s together to interleave IOVA accesses
> across them and must be programmed identically.
> The third SMMU instance is used as a regular ARM MMU-500 and it
> can either be programmed independently or identical to other
> two ARM MMU-500s.
> 
> This implementation supports programming two or three ARM MMU-500s
> identically as per DT config.
> 
> Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  MAINTAINERS                     |   2 +
>  drivers/iommu/Makefile          |   2 +-
>  drivers/iommu/arm-smmu-impl.c   |   3 +
>  drivers/iommu/arm-smmu-nvidia.c | 206 ++++++++++++++++++++++++++++++++
>  drivers/iommu/arm-smmu.h        |   1 +
>  5 files changed, 213 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/iommu/arm-smmu-nvidia.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7b5ffd646c6b9..64c37dbdd4426 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16808,8 +16808,10 @@ F:	drivers/i2c/busses/i2c-tegra.c
>  
>  TEGRA IOMMU DRIVERS
>  M:	Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +R:	Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>  L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  S:	Supported
> +F:	drivers/iommu/arm-smmu-nvidia.c
>  F:	drivers/iommu/tegra*
>  
>  TEGRA KBC DRIVER
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 342190196dfb0..2b8203db73ec3 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -15,7 +15,7 @@ obj-$(CONFIG_AMD_IOMMU) += amd/iommu.o amd/init.o amd/quirks.o
>  obj-$(CONFIG_AMD_IOMMU_DEBUGFS) += amd/debugfs.o
>  obj-$(CONFIG_AMD_IOMMU_V2) += amd/iommu_v2.o
>  obj-$(CONFIG_ARM_SMMU) += arm_smmu.o
> -arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-qcom.o
> +arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-nvidia.o arm-smmu-qcom.o
>  obj-$(CONFIG_ARM_SMMU_V3) += arm-smmu-v3.o
>  obj-$(CONFIG_DMAR_TABLE) += intel/dmar.o
>  obj-$(CONFIG_INTEL_IOMMU) += intel/iommu.o intel/pasid.o
> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
> index c75b9d957b702..f15571d05474e 100644
> --- a/drivers/iommu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm-smmu-impl.c
> @@ -171,6 +171,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>  	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
>  		smmu->impl = &calxeda_impl;
>  
> +	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
> +		return nvidia_smmu_impl_init(smmu);
> +
>  	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
>  	    of_device_is_compatible(np, "qcom,sc7180-smmu-500"))
>  		return qcom_smmu_impl_init(smmu);
> diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvidia.c
> new file mode 100644
> index 0000000000000..5c874912e1c1a
> --- /dev/null
> +++ b/drivers/iommu/arm-smmu-nvidia.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// NVIDIA ARM SMMU v2 implementation quirks
> +// Copyright (C) 2019-2020 NVIDIA CORPORATION.  All rights reserved.
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "arm-smmu.h"
> +
> +/*
> + * Tegra194 has three ARM MMU-500 Instances.
> + * Two of them are used together for interleaved IOVA accesses and
> + * used by non-isochronous HW devices for SMMU translations.
> + * Third one is used for SMMU translations from isochronous HW devices.
> + * It is possible to use this implementation to program either
> + * all three or two of the instances identically as desired through
> + * DT node.
> + *
> + * Programming all the three instances identically comes with redundant TLB
> + * invalidations as all three never need to be TLB invalidated for a HW device.
> + *
> + * When Linux kernel supports multiple SMMU devices, the SMMU device used for
> + * isochornous HW devices should be added as a separate ARM MMU-500 device
> + * in DT and be programmed independently for efficient TLB invalidates.
> + */

We should address Robin's comment about the 'When' above.

> +#define MAX_SMMU_INSTANCES 3
> +
> +struct nvidia_smmu {
> +	struct arm_smmu_device	smmu;
> +	unsigned int		num_inst;
> +	void __iomem		*bases[MAX_SMMU_INSTANCES];
> +};
> +
> +static inline struct nvidia_smmu *to_nvidia_smmu(struct arm_smmu_device *smmu)
> +{
> +	return container_of(smmu, struct nvidia_smmu, smmu);
> +}
> +
> +static inline void __iomem *nvidia_smmu_page(struct arm_smmu_device *smmu,
> +					     unsigned int inst, int page)
> +{
> +	struct nvidia_smmu *nvidia_smmu = to_nvidia_smmu(smmu);
> +
> +	if (!nvidia_smmu->bases[0])
> +		nvidia_smmu->bases[0] = smmu->base;


Robin said that he would accept a patch to move the
devm_ioremap_resource() call in arm_smmu_device_probe() so that we do
not need to do this. See the V7 series. I think that this would be a
good improvement so that we could avoid doing the above.

Cheers
Jon

-- 
nvpublic
