From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/7] dt-bindings: arm-smmu: Add binding for nvidia,smmu-v2
Date: Fri, 30 Aug 2019 16:13:16 +0100
Message-ID: <37034b76-7e3f-5f3c-25b2-696e25127682@arm.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-3-git-send-email-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567118827-26358-3-git-send-email-vdumpa@nvidia.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Reddy <vdumpa@nvidia.com>
Cc: snikam@nvidia.com, thomasz@nvidia.com, jtukkinen@nvidia.com, mperttunen@nvidia.com, praithatha@nvidia.com, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, talho@nvidia.com, yhsu@nvidia.com, linux-tegra@vger.kernel.org, treding@nvidia.com, avanbrunt@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 29/08/2019 23:47, Krishna Reddy wrote:
> Add binding doc for Nvidia's smmu-v2 implementation.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> index 3133f3b..0de3759 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> @@ -17,6 +17,7 @@ conditions.
>                           "arm,mmu-401"
>                           "arm,mmu-500"
>                           "cavium,smmu-v2"
> +                        "nidia,smmu-v2"
>                           "qcom,smmu-v2"

I agree with Mikko that the compatible must be at least SoC-specific, 
but potentially even instance-specific (e.g. "nvidia,tegra194-gpu-smmu") 
depending on how many of these parallel-SMMU configurations might be 
hiding in current and future SoCs.

Robin.

>   
>                     depending on the particular implementation and/or the
> 
