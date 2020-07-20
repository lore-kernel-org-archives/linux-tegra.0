From: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v11 0/5] NVIDIA ARM SMMU Implementation
Date: Mon, 20 Jul 2020 12:56:09 +0100
Message-ID: <159523385148.790143.14826100945729579786.b4-ty@kernel.org>
References: <20200718193457.30046-1-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200718193457.30046-1-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, robin.murphy-5wv7dgnIgG8@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, 18 Jul 2020 12:34:52 -0700, Krishna Reddy wrote:
> Changes in v11:
> Addressed Rob comment on DT binding patch to set min/maxItems of reg property in else part.
> Rebased on top of https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates.
> 
> Changes in v10:
> Perform SMMU base ioremap before calling implementation init.
> Check for Global faults across both ARM MMU-500s during global interrupt.
> Check for context faults across all contexts of both ARM MMU-500s during context fault interrupt.
> Add new DT binding nvidia,smmu-500 for NVIDIA implementation.
> https://lkml.org/lkml/2020/7/8/57
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/5] iommu/arm-smmu: move TLB timeout and spin count macros
      https://git.kernel.org/will/c/cd8479cf0de9
[2/5] iommu/arm-smmu: ioremap smmu mmio region before implementation init
      https://git.kernel.org/will/c/6c019f4e697e
[3/5] iommu/arm-smmu: add NVIDIA implementation for ARM MMU-500 usage
      https://git.kernel.org/will/c/aab5a1c88276
[4/5] dt-bindings: arm-smmu: add binding for Tegra194 SMMU
      https://git.kernel.org/will/c/3d2deb0cdb69
[5/5] iommu/arm-smmu: Add global/context fault implementation hooks
      https://git.kernel.org/will/c/aa7ec73297df

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
