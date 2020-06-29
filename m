From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 3/3] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Mon, 29 Jun 2020 15:38:34 -0700
Message-ID: <20200629223833.GE27967@Asurada-Nvidia>
References: <20200629022838.29628-1-vdumpa@nvidia.com>
 <20200629022838.29628-4-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200629022838.29628-4-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Jun 28, 2020 at 07:28:38PM -0700, Krishna Reddy wrote:
> Add global/context fault hooks to allow NVIDIA SMMU implementation
> handle faults across multiple SMMUs.
> 
> Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> +static irqreturn_t nvidia_smmu_global_fault_inst(int irq,
> +					       struct arm_smmu_device *smmu,
> +					       int inst)
> +{
> +	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
> +	void __iomem *gr0_base = nvidia_smmu_page(smmu, inst, 0);
> +
> +	gfsr = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSR);
> +	gfsynr0 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR0);
> +	gfsynr1 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR1);
> +	gfsynr2 = readl_relaxed(gr0_base + ARM_SMMU_GR0_sGFSYNR2);
> +
> +	if (!gfsr)
> +		return IRQ_NONE;

Could move this before gfsynr readings to save some readl() for
!gfsr cases?

> +static irqreturn_t nvidia_smmu_context_fault_bank(int irq,

> +	void __iomem *cb_base = nvidia_smmu_page(smmu, inst, smmu->numpage + idx);
[...]
> +	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
[...]
> +	writel_relaxed(fsr, cb_base + ARM_SMMU_CB_FSR);

It reads FSR of the default inst (1st), but clears the FSR of
corresponding inst -- just want to make sure that this is okay
and intended.

> @@ -185,7 +283,8 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
>  	}
>  
>  	nvidia_smmu->smmu.impl = &nvidia_smmu_impl;
> -	/* Free the arm_smmu_device struct allocated in arm-smmu.c.
> +	/*
> +	 * Free the arm_smmu_device struct allocated in arm-smmu.c.
>  	 * Once this function returns, arm-smmu.c would use arm_smmu_device
>  	 * allocated as part of nvidia_smmu struct.
>  	 */

Hmm, this coding style fix should be probably squashed into PATCH-1?
